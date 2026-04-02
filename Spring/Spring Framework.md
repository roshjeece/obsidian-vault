---

---
# Spring Framework

BLUF: Spring is a Java framework that removes the work of manually creating and connecting objects. You write business logic; Spring handles wiring, HTTP routing, database access, and lifecycle management. The core mechanic is Dependency Injection — Spring builds your objects and provides them where needed so you never call `new` on a managed class.

---

## Inversion of Control and Dependency Injection

These two terms describe the same mechanic from different angles.

**Inversion of Control (IoC):** Normally, your code controls when objects are created. With IoC, you give that control to the framework. Spring decides when to create your `TaskService`, not you.

**Dependency Injection (DI):** Spring _provides_ the objects a class needs rather than the class creating them itself.

```java
// Without DI — you control construction
public class TaskController {
    private TaskService taskService = new TaskService(new TaskRepository());
}

// With DI — Spring controls construction
public class TaskController {
    private final TaskService taskService;

    public TaskController(TaskService taskService) {  // Spring provides this
        this.taskService = taskService;
    }
}
```

**Why this matters:** The DI version is easier to test (you can pass in a fake `TaskService`), easier to swap (change the implementation without touching the controller), and impossible to misconfigure (Spring fails fast at startup if a dependency can't be satisfied).

---

## The Spring Container (ApplicationContext)

The ApplicationContext is Spring's central object registry. At startup it:

1. Scans your packages for annotated classes (`@RestController`, `@Service`, `@Repository`, `@Component`)
2. Creates one instance of each (called a **bean**)
3. Injects dependencies via constructors
4. Manages the lifecycle of every bean for the life of the application

You never interact with the ApplicationContext directly in normal development. It runs in the background. The result is a fully wired application where every class has its dependencies provided before the first request arrives.

---

## The Four Layers

Every feature in a Spring Boot app follows this structure:

```
HTTP Client
    │
    ▼
@RestController    ← HTTP in/out. Maps requests to methods. Returns JSON.
    │
    ▼
@Service           ← Business logic. The only place decisions get made.
    │
    ▼
@Repository        ← Database access. Runs queries. Returns entities.
    │
    ▼
Database
```

**Controller** — receives the HTTP request, deserializes JSON to Java, calls the service, serializes the result back to JSON. Contains zero business logic. If your controller is making decisions, move that code to the service.

**Service** — owns all business rules. Orchestrates calls between repositories. The only layer that's allowed to call a repository. Annotated with `@Service`.

**Repository** — the only layer that touches the database. Spring Data JPA generates the implementation automatically from an interface. Annotated with `@Repository`.

**Entity** — a Java class that maps to a database table. Not a layer that processes requests — it's the data structure that moves between layers. Annotated with `@Entity`.

---

## Common Annotations

### Component Registration

|Annotation|What it marks|Effect|
|---|---|---|
|`@SpringBootApplication`|Main class|Enables component scan, auto-config, and boot config|
|`@RestController`|Controller class|Registers as HTTP handler; return values auto-serialized to JSON|
|`@Service`|Service class|Registers as a business logic bean|
|`@Repository`|Repository interface|Registers as a data access bean; enables exception translation|
|`@Component`|Any class|Generic registration — use the specific annotations above when applicable|

### HTTP Routing

|Annotation|HTTP Verb|Common use|
|---|---|---|
|`@RequestMapping("/path")`|—|Base path prefix for all methods in a controller|
|`@GetMapping`|GET|Read/retrieve|
|`@PostMapping`|POST|Create|
|`@PutMapping`|PUT|Full replace|
|`@PatchMapping`|PATCH|Partial update|
|`@DeleteMapping`|DELETE|Remove|

### Method Parameters

|Annotation|What it does|
|---|---|
|`@RequestBody`|Deserializes the HTTP request body (JSON) into a Java object|
|`@PathVariable`|Extracts a value from the URL path (e.g. `/tasks/42` → `id = 42`)|
|`@RequestParam`|Extracts a query parameter (e.g. `/tasks?complete=true`)|
|`@ResponseStatus`|Sets the HTTP response status code (e.g. `HttpStatus.CREATED` → 201)|
|`@Valid`|Triggers Bean Validation on the annotated parameter — checks `@NotNull`, `@Size`, etc. defined on the object's fields. Requires `spring-boot-starter-validation` dependency.|
|`@AuthenticationPrincipal`|Injects the currently authenticated user's principal object. Requires Spring Security. Used to access the logged-in user's identity inside a controller method.|

---

## Constructor Injection — The Right Pattern

```java
@RestController
@RequestMapping("/api/v1/task")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/{id}")
    public Task findTaskById(@PathVariable Long id) {
        return taskService.findTaskById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Task saveNewTask(@RequestBody Task task) {
        return taskService.saveTask(task);
    }
}
```

**Why constructor injection over `@Autowired` on the field:**

- Fields are `final` — dependency cannot be accidentally reassigned
- The class explicitly declares what it needs — visible at a glance
- Easier to test — you can construct the class manually with a mock argument
- Spring's own documentation recommends this pattern

**You don't need to annotate the constructor.** Spring detects a single constructor and uses it automatically.

---

## HTTP Methods and CRUD

|HTTP Verb|CRUD operation|Typical response code|
|---|---|---|
|GET|Read|200 OK|
|POST|Create|201 Created|
|PUT|Update (full replace)|200 OK|
|PATCH|Update (partial)|200 OK|
|DELETE|Delete|204 No Content|

PUT replaces the entire resource. PATCH updates specific fields. In practice, many APIs use PUT for both — be consistent within a project.

---

## `ResponseEntity` — When You Need Control Over the Response

```java
// Fixed status code — use @ResponseStatus
@PostMapping
@ResponseStatus(HttpStatus.CREATED)
public Task saveTask(@RequestBody Task task) {
    return taskService.saveTask(task);
}

// Variable status code — use ResponseEntity
@GetMapping("/{id}")
public ResponseEntity<Task> findById(@PathVariable Long id) {
    return taskService.findById(id)
        .map(ResponseEntity::ok)                    // found → 200
        .orElse(ResponseEntity.notFound().build()); // not found → 404
}
```

Use `@ResponseStatus` when the response code never changes. Use `ResponseEntity` when the code depends on what happened.

---

## JSON and Jackson

Spring uses **Jackson** (bundled in `spring-boot-starter-webmvc`) to convert between Java objects and JSON automatically.

- **Serialization:** Controller returns a `Task` object → Jackson converts it to JSON → sent as HTTP response body
- **Deserialization:** HTTP request body arrives as JSON → `@RequestBody` triggers Jackson → converted to `Task` Java object

Jackson uses your getters to determine JSON field names. `getTitle()` → `"title"`. `getIsComplete()` → `"isComplete"`. This is why getters are required on entities.

---

## Gradle Dependencies (Spring Boot 4.x)

```groovy
// build.gradle
plugins {
    id 'java'
    id 'org.springframework.boot' version '4.0.3'
    id 'io.spring.dependency-management' version '1.1.7'
}

dependencies {
    // Web layer — note: spring-boot-starter-webmvc in Spring Boot 4.x
    // (was spring-boot-starter-web in Spring Boot 3.x)
    implementation 'org.springframework.boot:spring-boot-starter-webmvc'

    // Database layer
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'

    // Migrations
    implementation 'org.springframework.boot:spring-boot-starter-flyway'
    implementation 'org.flywaydb:flyway-core'
    implementation 'org.flywaydb:flyway-database-postgresql'

    // PostgreSQL driver (runtime only — not needed to compile)
    runtimeOnly 'org.postgresql:postgresql'

    // Auto-starts compose.yaml on boot
    runtimeOnly 'org.springframework.boot:spring-boot-docker-compose'

    // Testing
    testRuntimeOnly 'com.h2database:h2'
    testImplementation 'org.springframework.boot:spring-boot-starter-data-jpa-test'
    testImplementation 'org.springframework.boot:spring-boot-starter-webmvc-test'
    testImplementation 'org.mockito:mockito-inline:5.2.0'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
}
```

**Spring Boot 3.x vs 4.x dependency name change:**

|Spring Boot 3.x|Spring Boot 4.x|
|---|---|
|`spring-boot-starter-web`|`spring-boot-starter-webmvc`|
|`spring-boot-starter-test`|`spring-boot-starter-webmvc-test` + `spring-boot-starter-data-jpa-test`|

If you use a 3.x starter name in a 4.x project, the dependency will fail to resolve. Always check which version you're on before copying a dependency block from documentation or Stack Overflow.

---

## Testing — Layer-to-Test-Type Mapping

Each layer has a corresponding test type. Using the wrong one either loads too much (slow, brittle) or too little (misses real integration issues).

|Layer|Test annotation|What loads|What to mock|
|---|---|---|---|
|Service|`@ExtendWith(MockitoExtension.class)`|Nothing — pure unit test|`@Mock` the repository|
|Controller|`@WebMvcTest(Controller.class)`|Web layer only|`@MockitoBean` the service|
|Repository|`@DataJpaTest`|JPA + H2 in-memory DB|Nothing|
|Full stack|`@SpringBootTest` + `@AutoConfigureMockMvc`|Entire application|Nothing (or selective)|

**Common mistake:** using `@SpringBootTest` for everything. It works but is slow, requires the database to be running, and hides layer separation problems. Match the test type to the layer.

---

## Self-Check

**Can you trace a POST request from HTTP to database and back?** Client sends JSON → Controller's `@PostMapping` method receives it → `@RequestBody` deserializes JSON to Java object → Controller calls `service.save(object)` → Service applies business rules → Service calls `repository.save(object)` → Hibernate generates INSERT SQL → PostgreSQL executes it → saved entity (with database-assigned id) returns up the chain → Controller returns it → Jackson serializes to JSON → HTTP 201 response sent to client.

**What is the difference between `@Service` and `@Repository`?** Functionally similar — both register a bean with the ApplicationContext. The distinction is semantic and tooling-based. `@Repository` additionally enables Spring's exception translation, converting database-specific exceptions into Spring's consistent `DataAccessException` hierarchy.

**Why does constructor injection make testing easier?** Because you can construct the class manually in a test: `new TaskService(mockRepository, mockCategoryService)`. With field injection (`@Autowired` on a field), you can't construct the class without a Spring context.

**Why do entities need a no-arg constructor?** JPA (Hibernate) creates entity objects by calling the no-arg constructor, then setting fields via reflection. If the no-arg constructor is missing, Hibernate throws an exception at startup.

---

## Related

- [[Spring Boot - Project Structure and Startup]] — concrete project layout and startup sequence for a real Spring Boot app
- [[Spring Boot - The Request Lifecycle]] — the Controller → Service → Repository flow traced through actual code
- [[Spring Boot - Annotations Reference]] — full reference for every annotation mentioned in this note
- [[Spring Boot - Testing Strategy]] — the test layer table expanded with real examples and patterns
- [[Spring Boot - How to Build This Unassisted]] — step-by-step checklist for standing up everything this note describes
- [[Spring JPA Overview - Annotations]] — the persistence layer that sits beneath the service/repository pattern
- [[Flyway]] — manages the database schema that Spring JPA maps entities to
- [[TDD/Introduction to TDD Arrange]] — the testing philosophy behind the layer-to-test-type mapping
- [[Java/Inheritance]] — Spring relies heavily on interface implementation and class hierarchies
- [[Java/Polymorphism]] — Spring's dependency injection uses polymorphic references
- [[ADR-001-postgresql-over-h2]] — the decision that shapes which datasource this app connects to
- [[React - Implementing Endpoint & APIs]] — demonstrates how the React frontend consumes Spring Boot API endpoints using fetch and axios