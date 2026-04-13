Prior to course content:
Git: Because I missed some class, utilized GitHub to resync my fork with the instructors to catch up on the ~1.5 hours of material that I missed. Then utilized git in CLI to overwrite my program and catch up to everyone else.

### 1. Define the Form Props Interface
Before building the component, define what data the form accepts as props
This is how a parent component passes data down to a child component

```tsx
import type {Task} from "./TaskType.ts";  
  
interface TaskFormProps {  
    initialTask?: Task;  
}
```
initialTask is optional(?) - this allows the same form to handle both create (no initial data) and edit (pre-populated) use cases

### 2. Creation of Initial Test for Task Form - Should Display Form Heading
```tsx
import {render, screen} from '@testing-library/react';  
import TaskForm from '../TaskForm.tsx';  
  
  
describe('Task Form', () => {  
    it('should display form heading', () => {  
        render(<TaskForm/>);  
        expect(screen.getByRole('heading', {name: /Task Form/i})).toBeInTheDocument();  
    })  
})
```

### Check to See if "Title" is in the Form Heading
```tsx
// TaskForm.tsx
export default function TaskForm({initialTask}: TaskFormProps) {  
    return (  
        <div>
	        <h2>Task Form</h2>  
	        <form>                
		        <label htmlFor={'Title'}>Title  
		            <input id={'Title'} type={'text'}/>  
                </label>
            </form>  
	    </div>  
    );  
};
```

```tsx
import {render, screen} from '@testing-library/react';  
import TaskForm from '../TaskForm.tsx';  
  
  
describe('Task Form', () => {  
    it('should display form heading', () => {  
        render(<TaskForm/>);  
        expect(screen.getByRole('heading', {name: /Task Form/i})).toBeInTheDocument();  
        expect(screen.getByLabelText(/Title/i)).toBeInTheDocument(); 
        expect(screen.getByRole('textbox', {name: /title/i})).toBeInTheDocument() 
    })  
})
```
1) Checking to make sure the heading "Task Form" exists
2) Checking to make sure that the Title label exists
3) Checking to make sure the textbox exists

Need:
1. Submit Button
2. Click Event



Created axiosSaveTask in TaskService.ts
```ts
type AxiosSaveTask = (task: Task) => Promise<Task>;

[...]

export const axiosSaveTask: AxiosSaveTask = (task: Task) => (  
  axios.post('api/v1/task', task)  
      .then((r: AxiosResponse<Task>) => r.data)  
      .catch((error) => { throw error; })  
)
```

Verify Structure of TaskItem in TaskItem.tsx:
```tsx
import type { Task } from './TaskType.ts';  
  
type TaskItemProps = {  
  initialTask: Task;  
};  
  
export const TaskItem = ({ initialTask }: TaskItemProps) => {  
  return (  
    <li      className="p-1"  
      aria-label={`Task ${initialTask.id}`}  
      id={initialTask.id}  
    >      {initialTask.title}: {initialTask.description}  
    </li>  );  
};
```

Build out TaskForm.tsx:
```tsx
import type {Task} from "./TaskType.ts";  
import {yupResolver} from "@hookform/resolvers/yup/src";  
import {useForm} from "react-hook-form";  
import * as yup from "yup"  
import {axiosSaveTask} from "./TaskService.ts";  
  
const { object, string, number } = yup;  
  
const validationSchema = object({  
    id: number(),  
    title: string().required('bad title'),  
    description: string().required('bad description'),  
})  
  
interface TaskFormProps {  
    initialTask?: Task;  
}  
  
function TaskForm({initialTask}: TaskFormProps) {  
    const {  
        register,  
        handleSubmit,  
        formState: {errors}  
    } = useForm<Task>({  
        resolver: yupResolver(validationSchema)  
    });  
  
  
    function onSubmit(data: Task) {  
        axiosSaveTask(data);  
    }  
  
    return (  
        <div>            <h2>Task Form</h2>  
            <form onSubmit={handleSubmit(onSubmit)} method={'POST'}>  
                <label htmlFor={'title'}>Title</label>  
                <input id={'title'} type={'text'} {...register("title")}/>  
  
                <label htmlFor={'description'}>Description</label>  
                <input id={'description'} type={'text'} {...register("description")}/>  
  
  
                <input type={'hidden'} value={1} {...register('category.id')}/>  
                <input type={'hidden'} value={'active'} {...register('category.label')}/>  
  
                <input type={'submit'} value={'Add Task'}/>  
            </form>  
        </div>  
    );  
}  
  
export default TaskForm;
```
Important:
- `initialTask` and `errors` are not yet defined

TaskPage.tsx setup:
```tsx
import {useEffect, useState} from 'react';  
import {TaskItem} from './TaskItem.tsx';  
import {axiosGetAllTasks} from './TaskService.ts';  
import type {Task} from './TaskType.ts';  
import TaskForm from "./TaskForm.tsx";  
  
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
    }, []);  
  
    return (  
        <>  
            <h1>Task List</h1>  
            <TaskForm/>            <ul>                {tasks.length > 0 ? (  
                    tasks.map((task) => <TaskItem key={task.id} initialTask={task}/>)  
                ) : (  
                    <li>No Tasks found.</li>  
                )}  
            </ul>  
        </>  
    );  
};
```

---

### Tests
##### TaskForm.test.tsx:
```tsx
import {render, screen} from '@testing-library/react';  
import TaskForm from '../TaskForm.tsx';  
import {userEvent} from "@testing-library/user-event";  
import * as taskApi from "../TaskService.ts"  
  
vi.mock('../TaskService.ts');  
  
describe('Task Form', () => {  
    let user: ReturnType<typeof userEvent.setup>  
  
    beforeEach(() => {  
        user = userEvent.setup();  
    })  
  
    it('should display form heading', () => {  
        render(<TaskForm/>);  
        expect(screen.getByRole('heading', {name: /Task Form/i})).toBeInTheDocument();  
        expect(screen.getByLabelText(/Title/i)).toBeInTheDocument();  
        expect(screen.getByRole('textbox', {name: /title/i})).toBeInTheDocument()  
        expect(screen.getByRole('textbox', {name: /description/i})).toBeInTheDocument()  
        expect(screen.getByRole('button', {name: /add task/i})).toBeInTheDocument();  
        screen.logTestingPlaygroundURL();  
    });  
  
    describe('Mock Task Form', () => {  
        const mockData =  
            {id: 1, title: 'Feed dog', description: 'Please feed the dog'}  
  
        beforeEach(() => {  
            vi.clearAllMocks();  
        });  
        afterEach(() => {  
            vi.restoreAllMocks()  
        })  
        it('should be able to input into fields and click submit', async () => {  
            vi.mocked(taskApi.axiosSaveTask).mockResolvedValue(mockData);  
  
            render(<TaskForm/>);  
            const title = screen.getByRole('textbox', {name: /title/i});  
            const description = screen.getByRole('textbox', {name: /description/i});  
            const submit = screen.getByRole('button', {name: /add task/i});  
  
            await user.type(title, 'new title');  
            expect(title).toHaveValue('new title');  
  
            await user.type(description, 'new description');  
            expect(description).toHaveValue('new description');  
  
            await user.click(submit);  
            expect(taskApi.axiosSaveTask).toHaveBeenCalledOnce();  
        })  
  
        it('should save a new task on submit', async () => {  
            vi.mocked(taskApi.axiosSaveTask).mockResolvedValue({  
                title: 'new title',  
                description: 'new description',  
                category: {id: "1", label: "active"}  
            });  
  
            render(<TaskForm/>);  
  
            await user.type(screen.getByLabelText(/title/i), 'new title');  
            await user.type(screen.getByLabelText(/description/i), 'new description');  
            await user.click(screen.getByRole('button', {name: /add task/i}));  
  
            expect(taskApi.axiosSaveTask).toHaveBeenCalledWith({  
                title: 'new title',  
                description: 'new description',  
                category: {id: "1", label: "active"}  
            });  
        });  
    })  
})
```