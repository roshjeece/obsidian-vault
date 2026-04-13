# React - TDD Front-End for Spring Boot

BLUF: This note covers building a React front-end for the cohort11-Todo Spring Boot API using a TDD-first approach. The stack is React + TypeScript + react-hook-form + Yup validation + Axios, tested with Vitest, React Testing Library, and MSW. Every component was written test-first — structure reflects that build order.

---

## Project Structure

```
src/todo/
├── TaskType.ts          ← shared type definitions (Task, Category)
├── TaskService.ts       ← all HTTP calls to the Spring Boot API
├── TaskItem.tsx         ← renders a single task as a list item
├── TaskForm.tsx         ← form to create a new task
├── TaskPage.tsx         ← page component: fetches tasks, renders list + form
└── __tests__/
    ├── TaskService.test.ts
    ├── TaskItem.test.tsx
    ├── TaskForm.test.tsx
    └── TaskPage.test.tsx
```

`App.tsx` simply renders `<TaskPage />` — the entry point delegates immediately to the feature component.

---

## TaskType.ts — Shared Type Definitions

```typescript
// TaskType.ts
export type Task = {
  id?: number | null;   // optional — null before database assigns it
  title: string;
  description: string;
  category: Category;
};

export type Category = {
  id: number;
  label: string;
};
```

`Task` and `Category` are plain TypeScript types — no classes, no decorators. They mirror the JSON shape returned by the Spring Boot API. `id` is optional (`?`) because a new task doesn't have one until the backend assigns it after saving.

Every other file imports from here. Change the shape of the API response, change it here first.

---

## TaskService.ts — HTTP Layer

```typescript
// TaskService.ts
import axios, { type AxiosResponse } from 'axios';
import type { Task } from './TaskType.ts';

// Type aliases — make function signatures explicit and readable
type GetTasks     = () => Promise<Task[]>;
type AxiosGetTasks = () => Promise<Task[]>;
type AxiosSaveTask = (task: Task) => Promise<Task>;

// Original fetch-based implementation (kept for comparison)
export const getAllTasks: GetTasks = async () => {
  return fetch('/api/v1/task', { method: 'GET' })
    .then((Response) => Response.json());
};

// Axios GET — returns the response body directly
export const axiosGetAllTasks: AxiosGetTasks = async () =>
  axios
    .get('/api/v1/task')
    .then((r: AxiosResponse<Task[]>) => r.data)
    .catch();

// Axios POST — sends task JSON, returns saved task with database-assigned id
export const axiosSaveTask: AxiosSaveTask = (task: Task) =>
  axios.post('api/v1/task', task)
    .then((r: AxiosResponse<Task>) => r.data)
    .catch((error) => { throw error; });
```

**Why type aliases on the function types?** `type AxiosSaveTask = (task: Task) => Promise<Task>` makes the contract explicit before the implementation exists. You can read the signature and know exactly what the function accepts and returns without reading the body. This is the TypeScript equivalent of writing a method signature before the implementation in Java.

**`getAllTasks` vs `axiosGetAllTasks`:** Two implementations of the same operation — one using the native `fetch` API, one using Axios. Both are tested. `axiosGetAllTasks` is what the components actually use; `getAllTasks` is kept as a reference/comparison.

**Why `r.data`:** Axios wraps responses in an `AxiosResponse` object. The actual JSON body lives at `.data`. Without `.then((r) => r.data)`, you'd pass the whole Axios wrapper to your component instead of the `Task[]` array.

---

## TaskService.test.ts — MSW (Mock Service Worker)

```typescript
// TaskService.test.ts
import { HttpResponse, http } from 'msw';
import { setupServer } from 'msw/node';

describe('Task Service', () => {
  const server = setupServer();         // intercepts HTTP at the network level
  beforeAll(() => server.listen());     // start before all tests
  afterAll(() => server.close());       // shut down after all tests
  afterEach(() => server.resetHandlers()); // clear handlers between tests

  it('should get all tasks', async () => {
    const expected: Task[] = [
      { id: 1, title: 'First Task', description: '...', category: { id: 0, label: "" } },
      { id: 2, title: 'Second Task', description: '...', category: { id: 0, label: "" } },
    ];

    server.use(
      http.get('/api/v1/task', () => HttpResponse.json(expected, { status: 200 }))
    );

    expect(await axiosGetAllTasks()).toStrictEqual(expected);
    expect(await getAllTasks()).toStrictEqual(expected);
  });

  it('should save a new task', async () => {
    const newTask: Task  = { title: 'Feed dog', description: '...', category: { id: 1, label: 'active' } };
    const savedTask: Task = { id: 1, ...newTask };

    server.use(
      http.post('/api/v1/task', () => HttpResponse.json(savedTask, { status: 201 }))
    );

    expect(await axiosSaveTask(newTask)).toStrictEqual(savedTask);
  });
});
```

**What MSW does:** Mock Service Worker intercepts actual HTTP requests at the network level — not at the function level like Mockito or `vi.mock()`. This means Axios fires a real request, MSW intercepts it before it leaves the process, returns the configured response, and Axios processes it normally. You're testing the full Axios pipeline, not a stub.

**Compare to Spring Boot testing:**

|Spring Boot|React/MSW|
|---|---|
|`@WebMvcTest` mocks the service|`vi.mock('../TaskService.ts')` mocks the service module|
|`MockMvc` fires fake HTTP through the web layer|`MSW` intercepts real HTTP at the network layer|
|`@DataJpaTest` uses H2 instead of real DB|MSW replaces the real API server|

**`server.resetHandlers()` in `afterEach`:** Clears any handlers registered inside individual tests so they don't bleed into the next test. Same purpose as `@Transactional` rollback in your Spring integration tests.

---

## TaskItem.tsx — Single Task Display

```tsx
// TaskItem.tsx
import type { Task } from './TaskType.ts';

type TaskItemProps = {
  initialTask: Task;
};

export const TaskItem = ({ initialTask }: TaskItemProps) => {
  return (
    <li
      className="p-1"
      aria-label={`Task ${initialTask.id}`}  // enables getByLabelText('Task 1') in tests
      id={initialTask.id}
    >
      {initialTask.title}: {initialTask.description}
    </li>
  );
};
```

`aria-label` on the `<li>` serves two purposes: accessibility (screen readers announce "Task 1") and testability (`getByLabelText('Task 1')` finds this element). This is the React equivalent of giving a Spring endpoint a specific URL path — it makes the element addressable.

**TaskItem.test.tsx:**

```tsx
it('should display single task item', () => {
  const task1: Task = { id: 1, title: 'First Task', description: 'get task component built.' };
  render(<TaskItem initialTask={task1} />);

  expect(screen.getByRole('listitem', { name: /task/i })).toBeInTheDocument();
  expect(screen.getByText('First Task: get', { exact: false })).toBeInTheDocument();
});
```

`exact: false` on `getByText` matches partial text — useful when the full rendered string (`"First Task: get task component built."`) is long and you only want to assert a key portion is present.

---

## TaskForm.tsx — Create Task Form

```tsx
// TaskForm.tsx
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup/src";
import * as yup from "yup";
import { axiosSaveTask } from "./TaskService.ts";
import type { Task } from "./TaskType.ts";

const { object, string, number } = yup;

// Validation schema — runs before onSubmit is called
const validationSchema = object({
  id: number(),
  title: string().required('bad title'),
  description: string().required('bad description'),
});

interface TaskFormProps {
  initialTask?: Task;   // optional — same form handles create (no task) and edit (existing task)
}

function TaskForm({ initialTask }: TaskFormProps) {
  const {
    register,           // connects an input to react-hook-form
    handleSubmit,       // wraps onSubmit — runs validation first, then calls onSubmit if valid
    formState: { errors }  // validation error messages — not yet displayed in the UI
  } = useForm<Task>({
    resolver: yupResolver(validationSchema),
    defaultValues: {
      category: { id: 1, label: "active" }  // hardcoded category — hidden from user
    }
  });

  function onSubmit(data: Task) {
    axiosSaveTask(data);  // fires POST to /api/v1/task
  }

  return (
    <div>
      <h2>Task Form</h2>
      <form onSubmit={handleSubmit(onSubmit)} method={'POST'}>
        <label htmlFor={'title'}>Title</label>
        <input id={'title'} type={'text'} {...register("title")}/>

        <label htmlFor={'description'}>Description</label>
        <input id={'description'} type={'text'} {...register("description")}/>

        <input type={'submit'} value={'Add Task'}/>
      </form>
    </div>
  );
}

export default TaskForm;
```

### How react-hook-form Works

`useForm<Task>()` returns a set of utilities that manage form state without re-rendering the component on every keystroke (unlike controlled components with `useState`).

**`register("title")`** spreads four props onto the input: `name`, `ref`, `onChange`, and `onBlur`. This is how react-hook-form tracks the input's value without you managing state manually. The `{...register("title")}` spread is equivalent to writing all four props by hand.

**`handleSubmit(onSubmit)`** is a wrapper. When the form submits, it runs the Yup validation schema first. If validation fails, it populates `errors` and does NOT call `onSubmit`. If validation passes, it calls `onSubmit(data)` with the typed, validated form values.

**`defaultValues`** pre-populates form fields before the user interacts. Here it sets the hidden category — the user never sees it, but it gets included in the submitted data automatically.

**`errors`** is destructured from `formState` but not yet rendered. The validation runs and blocks submission, but the user sees no feedback. This is a known TODO.

### Known TODOs in TaskForm

- `initialTask` is accepted as a prop but never used — the form doesn't pre-populate for edit mode yet
- `errors` is destructured but not rendered — validation messages don't show in the UI
- After a successful save, the form doesn't reset or give user feedback
- `refreshData` in `TaskPage` is not called after a successful submit — the list doesn't update

---

## TaskForm.test.tsx — Three Tests

### Test 1: Structure

```tsx
it('should display form heading', () => {
  render(<TaskForm/>);
  expect(screen.getByRole('heading', { name: /Task Form/i })).toBeInTheDocument();
  expect(screen.getByLabelText(/Title/i)).toBeInTheDocument();
  expect(screen.getByRole('textbox', { name: /title/i })).toBeInTheDocument();
  expect(screen.getByRole('textbox', { name: /description/i })).toBeInTheDocument();
  expect(screen.getByRole('button', { name: /add task/i })).toBeInTheDocument();
});
```

Verifies that the form renders with the correct elements. `getByRole('button')` works here because `<input type="submit">` is given the implicit ARIA role of `button`.

### Test 2: User Interaction

```tsx
it('should be able to input into fields and click submit', async () => {
  vi.mocked(taskApi.axiosSaveTask).mockResolvedValue(mockData);

  render(<TaskForm/>);
  await user.type(title, 'new title');
  await user.type(description, 'new description');
  await user.click(submit);

  expect(taskApi.axiosSaveTask).toHaveBeenCalledOnce();
});
```

Uses `userEvent` (not `fireEvent`) to simulate real browser interaction — `user.type()` fires keydown, keypress, keyup, and change events for each character, the way a real user would. `vi.mocked(taskApi.axiosSaveTask).mockResolvedValue(mockData)` replaces the real Axios call with a resolved promise returning `mockData`.

### Test 3: Payload Assertion

```tsx
it('should save a new task on submit', async () => {
  // ...type into fields, click submit...
  expect(taskApi.axiosSaveTask).toHaveBeenCalledWith({
    title: 'new title',
    description: 'new description',
    category: { id: 1, label: "active" }
  });
});
```

The strongest test — asserts not just that `axiosSaveTask` was called, but exactly what it was called with. Note that `category` is in the assertion even though the user never typed it — it comes from `defaultValues` in `useForm`. This is the React equivalent of `ArgumentCaptor` in your Spring tests.

**Why `vi.mock('../TaskService.ts')` at the top of the file:** This replaces the entire module with auto-mocked stubs before any test runs. Without it, tests would fire real HTTP requests to a server that isn't running. Compare to `@MockitoBean TaskService taskService` in `@WebMvcTest` — same concept, different syntax.

---

## TaskPage.tsx — Page Orchestration

```tsx
// TaskPage.tsx
export const TaskPage = () => {
  const [tasks, setTasks] = useState<Task[]>([]);

  const refreshData = async () => {
    try {
      const data = await axiosGetAllTasks();
      setTasks(data);
    } catch (error) {
      console.error('Failed to fetch tasks:', error);
    }
  };

  useEffect(() => {
    refreshData();
  }, []);   // empty dependency array — runs once on mount, equivalent to componentDidMount

  return (
    <>
      <h1>Task List</h1>
      <TaskForm/>
      <ul>
        {tasks.length > 0
          ? tasks.map((task) => <TaskItem key={task.id} initialTask={task}/>)
          : <li>No Tasks found.</li>
        }
      </ul>
    </>
  );
};
```

**`useState<Task[]>([])`** — declares a state variable `tasks` initialized to an empty array. When `setTasks(data)` is called, React re-renders the component with the new array. This is how the list appears after the API call completes.

**`useEffect(() => { refreshData(); }, [])`** — runs `refreshData` once after the component mounts. The empty `[]` dependency array means "run this effect once and never again." Without it, the effect would run after every render, causing an infinite loop.

**The component's shape:**

```
TaskPage
├── <TaskForm />              ← creates tasks
└── <ul>
    ├── <TaskItem task={1} /> ← displays task
    ├── <TaskItem task={2} />
    └── ...
```

This is the same layered structure as your Spring Boot backend: `TaskPage` = controller, `axiosGetAllTasks` = service, the API = repository.

### TaskPage.test.tsx — Async Testing Pattern

```tsx
vi.mock('../TaskService.ts');

beforeEach(() => {
  vi.mocked(taskApi.axiosGetAllTasks).mockResolvedValue(mockData);
});

it('should display task heading', async () => {
  render(<TaskPage />);
  await screen.findByText(/First Task/);  // waits for async state update
  expect(screen.getByRole('heading', { name: /Task List/i })).toBeInTheDocument();
});
```

**`findByText` vs `getByText`:** `getByText` queries synchronously — it fails immediately if the element isn't there. `findByText` returns a Promise and polls the DOM until the element appears or a timeout is reached. You need `findByText` (with `await`) any time the DOM depends on an async operation like an API call. Without the `await`, you'd assert before React has finished the state update.

**`within(list).getAllByRole('listitem')`:** Scopes a query to a specific element. Instead of finding all list items on the page (which might include the `<TaskForm>`'s elements), it finds only the ones inside the `<ul>`. Same idea as querying within a specific database table rather than the whole schema.

---

## Testing Tool Comparison

|Tool|Purpose|Spring Boot equivalent|
|---|---|---|
|`vi.mock()`|Replace a module with stubs|`@MockitoBean` / `@Mock`|
|`vi.mocked().mockResolvedValue()`|Tell a stub what to return|`when(...).thenReturn(...)`|
|`userEvent.type()`|Simulate real user typing|`mockMvc.perform(post(...))`|
|`screen.getByRole()`|Find element by ARIA role|`jsonPath("$.field")`|
|`screen.findByText()`|Find element, waiting for async|`@Transactional` + async assertions|
|MSW `server.use(http.get(...))`|Intercept real HTTP calls|`@DataJpaTest` with H2|
|`expect().toHaveBeenCalledWith()`|Assert call arguments|`ArgumentCaptor` + `assertThat`|

---

## What's Not Done Yet

These are explicitly incomplete in the current code:

- **`initialTask` prop in `TaskForm`** — accepted but ignored. Edit mode is not implemented.
- **`errors` from `formState`** — destructured but not rendered. Validation fires but users see no feedback.
- **Post-submit behavior** — form doesn't reset after a successful save; task list doesn't refresh.
- **`refreshData` not passed to `TaskForm`** — `TaskPage` has `refreshData` but doesn't pass it as a prop to `TaskForm.onSubmit`. Saving a task requires a manual page refresh to see it in the list.
- **Category is hardcoded** — `{ id: 1, label: "active" }` is baked into `defaultValues`. No UI for selecting a category.

---

## Related

- [[Spring Boot - Controllers and REST]] — the Spring Boot endpoints this front-end calls (`POST /api/v1/task`, `GET /api/v1/task`)
- [[Spring Boot - Testing Strategy]] — the back-end testing patterns this note mirrors on the front end
- [[React]] — core React concepts (`useState`, `useEffect`, props, components) used throughout this note
- [[TypeScript]] — type aliases, interfaces, and optional fields used in `TaskType.ts` and `TaskService.ts`
- [[TDD/Introduction to TDD Arrange]] — every test in this file follows Arrange/Act/Assert
- [[Web/JavaScript - DOM]] — the browser environment these components run in