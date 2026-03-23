# Spring Boot - Controllers and REST

BLUF: Controllers are the HTTP interface of your application. They receive requests, hand off to the service layer, and return responses. They should contain zero business logic — a controller that makes decisions is a controller doing the service's job.

---

## What REST Is

REST (Representational State Transfer) is a convention for designing HTTP APIs. Your app follows it:

| HTTP Verb | URL | Action | Status Code |
|---|---|---|---|
| POST | `/api/v1/task` | Create a task | 201 Created |
| GET | `/api/v1/task` | Get all tasks | 200 OK |
| GET | `/api/v1/task/{id}` | Get one task | 200 OK |
| PUT | `/api/v1/task/{id}` | Replace a task | 200 OK |
| DELETE | `/api/v1/task/{id}` | Delete a task | 204 No Content |

Your project implements POST and GET. PUT and DELETE are stubbed as comments — those are your next TODOs.

---

## TaskController — Full Breakdown

```java
// TaskController.java
@RestController                          // registers as HTTP handler, auto-serializes to JSON
@RequestMapping("/api/v1/task")          // all methods in this class start with this path
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {   // Spring injects this
        this.taskService = taskService;
    }

    @PostMapping                          // POST /api/v1/task
    @ResponseStatus(HttpStatus.CREATED)   // returns 201 instead of default 200
    public Task saveNewTask(@RequestBody Task task) {
        return taskService.saveTask(task);
    }

    @GetMapping()                         // GET /api/v1/task
    public List<Task> findAllTasks() {
        return taskService.findAllTasks();
    }

    @GetMapping("/{id}")                  // GET /api/v1/task/42
    public Task findTaskById(@PathVariable Long id) {
        return taskService.findTaskById(id);
    }
}
```

Every method is one or two lines. That's correct. A controller method should: receive input, call service, return result. Nothing else.

---

## CategoryController — Incomplete Implementation

```java
// CategoryController.java
@RestController
@RequestMapping("/api/v1/category")
public class CategoryController {

    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Category saveNewCategory(@RequestBody Category category) {
        return categoryService.saveCategory(category);
    }

    @GetMapping()
    public List<Category> getAllCategories() {
        return null;    // ← BUG: this always returns null / empty JSON array
    }

    // ADD with Tests for: GetById, Put, Delete
}
```

**`getAllCategories()` returns `null`** — this is a known stub. The correct implementation:
```java
@GetMapping()
public List<Category> getAllCategories() {
    return categoryService.findAll();   // need to add findAll() to CategoryService
}
```

---

## ResponseEntity — The Alternative Return Pattern

Your `TaskController` has a commented-out version of `saveNewTask` using `ResponseEntity`:

```java
// Alternative approach — more explicit
@PostMapping
public ResponseEntity<Task> saveNewTask(@RequestBody Task task) {
    return new ResponseEntity<>(taskService.saveTask(task), HttpStatus.CREATED);
}
```

**`@ResponseStatus` vs `ResponseEntity`:**

| Approach | When to use |
|---|---|
| `@ResponseStatus(HttpStatus.CREATED)` | Status code is always the same |
| `ResponseEntity<T>` | Status code needs to vary based on what happened |

Example where `ResponseEntity` is necessary:
```java
@GetMapping("/{id}")
public ResponseEntity<Task> findTaskById(@PathVariable Long id) {
    Optional<Task> task = taskService.findTaskById(id);
    if (task.isPresent()) {
        return ResponseEntity.ok(task.get());           // 200
    }
    return ResponseEntity.notFound().build();            // 404
}
```

With `@ResponseStatus` you can't return different codes from the same method. Use `ResponseEntity` whenever the response status depends on a condition.

---

## How JSON Serialization Works

When your controller returns a `Task` object, Spring uses **Jackson** (included in `spring-boot-starter-webmvc`) to convert it to JSON automatically.

```java
Task task = new Task("Learn TDD", "research TDD", false, category);
// Spring serializes this to:
{
  "id": null,
  "title": "Learn TDD",
  "description": "research TDD",
  "isComplete": false,
  "category": {
    "id": null,
    "label": "started"
  }
}
```

Jackson uses your getters to determine field names. `getTitle()` → `"title"`. `getIsComplete()` → `"isComplete"`. This is why getters are required on entities.

**Incoming requests work in reverse:** Jackson reads JSON keys and calls matching setters (or uses field reflection). `"title": "Learn TDD"` → `setTitle("Learn TDD")`. This is why `@RequestBody` works without any extra code.

---

## URL Design Conventions

Your API uses versioning in the path (`/api/v1/`). This is good practice — if you ever make breaking changes to your API, you add `/api/v2/` instead of breaking existing clients.

**Path variable vs request parameter:**

```java
// Path variable — part of the URL structure — used for resource identity
@GetMapping("/{id}")
public Task findTaskById(@PathVariable Long id) { ... }
// Called as: GET /api/v1/task/42

// Request parameter — optional filter — used for search/filter/sort
@GetMapping
public List<Task> findAllTasks(@RequestParam(required = false) Boolean isComplete) { ... }
// Called as: GET /api/v1/task?isComplete=false
```

Use path variables for IDs (you're fetching a specific resource). Use request parameters for filtering a collection.

---

## What to Build Next (Your TODOs)

Both controllers have this comment:
```java
// ADD with Tests for: GetById, Put, Delete
```

For `CategoryController`, the full REST implementation would be:

```java
// GetById
@GetMapping("/{id}")
public Category getCategoryById(@PathVariable Long id) {
    return categoryService.findById(id);  // add to service
}

// Put (full replace)
@PutMapping("/{id}")
public Category updateCategory(@PathVariable Long id, @RequestBody Category category) {
    return categoryService.updateCategory(id, category);  // add to service
}

// Delete
@DeleteMapping("/{id}")
@ResponseStatus(HttpStatus.NO_CONTENT)
public void deleteCategory(@PathVariable Long id) {
    categoryService.deleteById(id);  // add to service
}
```

**The pattern is always the same:** add the service method first, then the controller method, write the test first (TDD — red/green/refactor).

---

## Related
- [[Spring Boot - Services]] — controllers delegate to services; the boundary is the key design principle
- [[Spring Boot - The Request Lifecycle]] — controllers are layer 1 in the request chain
- [[Spring Boot - Annotations Reference]] — `@RestController`, `@GetMapping`, `@PostMapping`, `@RequestBody`, `@PathVariable` all explained
- [[Spring Boot - Testing Strategy]] — `TaskControllerTest` and `CategoryControllerTest` show how to test controllers in isolation
- [[TDD/Introduction to TDD Arrange]] — all controller TODOs should be built test-first
- [[Web/JavaScript - DOM]] — the frontend that would consume these endpoints

