# Spring Boot - Services

BLUF: The service layer is where business logic lives. It sits between the controller (HTTP) and the repository (database) and is the only place where decisions get made. If you're ever unsure where code belongs, ask: "Is this a rule about the data?" — if yes, it goes in the service.

---

## What a Service Is

A service is a plain Java class annotated with `@Service`. Spring manages it as a singleton bean — one instance created at startup, shared across all requests.

```java
// CategoryService.java
@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;  // injected by Spring
    }

    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    public Optional<Category> findCategoryByLabel(String label) {
        return categoryRepository.findCategoryByLabel(label);
    }

    public Category createCategoryIfNotExist(String label) {
        Optional<Category> queryCategory = categoryRepository.findCategoryByLabel(label);
        if (queryCategory.isEmpty()) {
            return categoryRepository.save(new Category(label));
        }
        return queryCategory.get();
    }
}
```

---

## Why the Service Layer Exists

Without a service layer, your controller would call the repository directly:
```java
// BAD — no service layer
@PostMapping
public Task saveNewTask(@RequestBody Task task) {
    // controller doing business logic — wrong
    if (taskRepository.findByTitle(task.getTitle()).isPresent()) {
        throw new DuplicateException();
    }
    return taskRepository.save(task);
}
```

Problems with this:
- Business rules are buried in HTTP code
- You can't reuse that logic from another controller or a scheduled job
- Testing requires spinning up the whole web layer
- The controller now has two reasons to change (HTTP changes AND business rule changes)

With a service layer, the controller is dumb — it only handles HTTP:
```java
// GOOD — controller delegates to service
@PostMapping
public Task saveNewTask(@RequestBody Task task) {
    return taskService.saveTask(task);  // all logic in the service
}
```

---

## TaskService — A Service With Cross-Domain Logic

```java
// TaskService.java
@Service
public class TaskService {

    private final TaskRepository taskRepository;
    private final CategoryService categoryService;   // service calling another service

    public TaskService(TaskRepository taskRepository, CategoryService categoryService) {
        this.categoryService = categoryService;
        this.taskRepository = taskRepository;
    }

    public Task saveTask(Task task) {
        Optional<Category> existingCategory =
            categoryService.findCategoryByLabel(task.getCategory().getLabel());

        if (existingCategory.isPresent()) {
            // INCOMPLETE: should reassign task.category to the existing one
            // task.setCategory(existingCategory.get());
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

**`TaskService` injects `CategoryService`** — a service can depend on another service. This is fine. What you must never do is have a circular dependency (A depends on B, B depends on A). Spring will fail at startup if it detects a cycle.

**The incomplete `if` block:** `saveTask()` correctly finds the existing category but doesn't use it. The intent is to prevent creating a new `category` row with the same label when one already exists. The fix is one line:
```java
if (existingCategory.isPresent()) {
    task.setCategory(existingCategory.get());  // reuse existing, don't create duplicate
}
```

---

## Constructor Injection — The Right Way

Both services use constructor injection:

```java
public TaskService(TaskRepository taskRepository, CategoryService categoryService) {
    this.categoryService = categoryService;
    this.taskRepository = taskRepository;
}
```

**Why constructor injection over `@Autowired` on the field:**
- Fields are `final` — the dependency can never accidentally be reassigned
- The class is easier to test — you can construct it manually with mock arguments
- Dependencies are explicit — you can see what the class needs by looking at the constructor
- Spring's own documentation recommends this pattern

**You don't annotate the constructor.** Spring detects a single constructor automatically and injects it.

---

## `createCategoryIfNotExist` — An Example of Business Logic

```java
public Category createCategoryIfNotExist(String label) {
    Optional<Category> queryCategory = categoryRepository.findCategoryByLabel(label);

    if (queryCategory.isEmpty()) {
        return categoryRepository.save(new Category(label));
    }

    return queryCategory.get();
}
```

This is a real business rule: "a category with this label should exist exactly once." The rule lives in the service because:
- The controller doesn't care *how* idempotency is enforced, only that it is
- The repository doesn't know about business rules — it just runs queries
- The service is the right place to say "check first, then create"

This pattern (find-or-create) is common in production systems.

---

## Services as Singletons

Spring creates exactly one instance of each `@Service` class at startup and reuses it for every request. This means:

- **Do not store request-specific state in service fields.** If two requests hit simultaneously and your service has a field like `private Task currentTask`, both requests share it and corrupt each other's data.
- **Method-local variables are safe.** Stack variables are per-thread, so `Optional<Category> queryCategory` inside `saveTask()` is safe.
- **Your repositories and other injected services are also singletons** — they're designed to be stateless and thread-safe.

---

## Related
- [[Spring Boot - Controllers and REST]] — controllers call services; the boundary between them is important
- [[Spring Boot - Repositories and Queries]] — services call repositories; this is the only layer that should
- [[Spring Boot - The Request Lifecycle]] — services are layer 2 in the request chain
- [[Spring Boot - Testing Strategy]] — `CategoryServiceTest` and `TaskServiceTest` show how to unit test services in isolation with Mockito
- [[Spring Boot - Annotations Reference]] — `@Service`, `@Mock`, `@InjectMocks` explained
- [[Java/Classes, Objects, and Encapsulation]] — services apply encapsulation principles at the architectural level

## Suggested Backlinks
- Add [[Spring Boot - Services]] to [[Java/Classes, Objects, and Encapsulation]] — the service layer is encapsulation applied at architecture scale
- Add [[Spring Boot - Services]] to [[TDD/Introduction to TDD Arrange]] — service tests are the primary target for unit testing with mocks
