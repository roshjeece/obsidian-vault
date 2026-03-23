# Spring Boot - The Request Lifecycle

BLUF: Every HTTP request that hits your app travels through exactly four layers — Controller → Service → Repository → Database — and the response travels back the same way. Understanding this chain is the mental model you need to debug anything and build anything new unassisted.

---

## The Full Chain

```
HTTP Client (Postman, browser, frontend)
        │
        │  POST /api/v1/task  { JSON body }
        ▼
┌─────────────────────┐
│   TaskController    │  ← receives the HTTP request, maps JSON → Java object
└─────────────────────┘
        │
        │  taskService.saveTask(task)
        ▼
┌─────────────────────┐
│    TaskService      │  ← business logic lives here
└─────────────────────┘
        │
        │  taskRepository.save(task)
        ▼
┌─────────────────────┐
│  TaskRepository     │  ← speaks to the database via JPA/Hibernate
└─────────────────────┘
        │
        │  INSERT INTO task ...
        ▼
┌─────────────────────┐
│    PostgreSQL DB    │  ← actual data storage
└─────────────────────┘
        │
        │  returns saved row
        ▼  (response travels back up the chain)
HTTP Client receives  { id: 1, title: "Learn TDD", ... }
```

---

## Layer 1: Controller — The Front Door

```java
// TaskController.java
@RestController
@RequestMapping("/api/v1/task")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {  // Spring injects this
        this.taskService = taskService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Task saveNewTask(@RequestBody Task task) {
        return taskService.saveTask(task);       // hands off to service
    }

    @GetMapping()
    public List<Task> findAllTasks() {
        return taskService.findAllTasks();
    }

    @GetMapping("/{id}")
    public Task findTaskById(@PathVariable Long id) {
        return taskService.findTaskById(id);
    }
}
```

**The controller's only job:**
- Accept the incoming HTTP request
- Deserialize JSON → Java object (`@RequestBody`)
- Call the service
- Return the result (Spring serializes it back to JSON automatically)

**The controller knows nothing about the database.** It doesn't touch `TaskRepository` directly. This is intentional — separation of concerns.

---

## Layer 2: Service — The Brain

```java
// TaskService.java
@Service
public class TaskService {

    private final TaskRepository taskRepository;
    private final CategoryService categoryService;

    public TaskService(TaskRepository taskRepository, CategoryService categoryService) {
        this.categoryService = categoryService;
        this.taskRepository = taskRepository;
    }

    public Task saveTask(Task task) {
        // Business logic: check if category already exists before saving
        Optional<Category> existingCategory =
            categoryService.findCategoryByLabel(task.getCategory().getLabel());
        if (existingCategory.isPresent()) {
            // future: reuse the existing category instead of creating a duplicate
        }
        return taskRepository.save(task);
    }

    public List<Task> findAllTasks() {
        return taskRepository.findAll();
    }

    public Task findTaskById(Long id) {
        return taskRepository.findById(id).orElseThrow();
    }
}
```

**The service's job:**
- Contain all business rules ("don't create duplicate categories")
- Orchestrate calls between repositories
- Decide what data gets saved and how

**Note:** `saveTask()` has an incomplete `if` block — the logic to reuse an existing category is stubbed out. The category lookup happens but the result isn't used yet. This is work in progress.

---

## Layer 3: Repository — The Database Interface

```java
// TaskRepository.java
@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
    // No code needed for basic CRUD — JpaRepository provides it
}
```

You write zero SQL for standard operations. `JpaRepository<Task, Long>` gives you:

| Method | SQL it generates |
|---|---|
| `save(task)` | `INSERT INTO task ...` or `UPDATE task ...` |
| `findById(id)` | `SELECT * FROM task WHERE id = ?` |
| `findAll()` | `SELECT * FROM task` |
| `deleteById(id)` | `DELETE FROM task WHERE id = ?` |

Spring Data JPA generates the implementation at runtime. The `@Repository` interface is just a contract — Spring writes the actual JDBC code behind the scenes.

---

## Layer 4: Database — PostgreSQL

Your schema was created by Flyway before the app even accepted its first request:

```sql
-- V1__init.sql
CREATE TABLE task (
    id          BIGINT NOT NULL,
    title       TEXT,
    description TEXT,
    is_complete BOOLEAN,
    category_id BIGINT,
    CONSTRAINT pk_task PRIMARY KEY (id)
);

ALTER TABLE task
    ADD CONSTRAINT FK_TASK_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES category (id);
```

Hibernate translates your Java objects into SQL that matches this schema. If the schema and your entity don't match, the app fails at startup with a mapping error.

---

## A Concrete Request Walk-Through

**Request:** `POST /api/v1/task` with body:
```json
{
  "title": "Learn TDD",
  "description": "Red, green, refactor",
  "isComplete": false,
  "category": { "label": "started" }
}
```

**Step by step:**
1. Tomcat receives the request
2. Spring routes it to `TaskController.saveNewTask()` because of `@PostMapping` on `/api/v1/task`
3. `@RequestBody` deserializes the JSON into a `Task` Java object
4. `saveNewTask()` calls `taskService.saveTask(task)`
5. `TaskService` calls `categoryService.findCategoryByLabel("started")` — checks for existing category
6. `TaskService` calls `taskRepository.save(task)`
7. Hibernate generates: `INSERT INTO task (id, title, description, is_complete, category_id) VALUES (...)`
8. PostgreSQL executes the insert, returns the saved row
9. The saved `Task` object (now with a database-assigned `id`) travels back up to the controller
10. Spring serializes the `Task` back to JSON
11. HTTP response `201 CREATED` with the JSON body is returned to the client

---

## The Cross-Cutting: Dependency Injection

Notice that no layer creates its own dependencies with `new`. Instead:

```java
// TaskController doesn't do this:
TaskService taskService = new TaskService(...); // WRONG

// It does this:
public TaskController(TaskService taskService) {  // Spring provides it
    this.taskService = taskService;
}
```

Spring's ApplicationContext creates all the objects (`@RestController`, `@Service`, `@Repository`) and injects them where needed. This is called **constructor injection** and is the preferred pattern. You never manually instantiate your annotated classes.

---

## Related
- [[Spring Boot - Project Structure and Startup]] — how the app boots before any request arrives
- [[Spring Boot - Controllers and REST]] — deep dive on the controller layer
- [[Spring Boot - Services]] — deep dive on the service layer
- [[Spring Boot - Repositories and Queries]] — deep dive on the repository layer
- [[Spring Boot - Entities and JPA]] — how Java objects map to database rows
- [[Spring Boot - Annotations Reference]] — what every @ symbol in this chain means
- [[Spring JPA Overview - Annotations]] — existing JPA annotation reference

