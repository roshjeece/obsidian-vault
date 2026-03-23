# Spring Boot - Testing Strategy

BLUF: Your project uses three distinct testing approaches — unit tests with mocks, slice tests for individual layers, and integration tests for the full stack. Each serves a different purpose. The selection of which test type to write is as important as writing the test itself.

---

## The Three Test Types in Your Project

```
Speed        ←──────────────────────────────────→ Realism
Fast                                               Slow

@ExtendWith          @WebMvcTest       @DataJpaTest       @SpringBootTest
(MockitoExtension)   (web layer only)  (JPA layer only)   (full stack)

TaskServiceTest      TaskControllerTest  TaskRepository   TaskControllerIntegrationTest
CategoryServiceTest  CategoryController  CategoryRepo     TodoApplicationTests
                     Test                Test
```

**The tradeoff:** Faster tests use more mocks (fake dependencies), which means they test less of the real system. Slower tests use real dependencies, which means they're more realistic but take longer and are harder to set up.

---

## Unit Tests — Service Layer

### Pattern: `@ExtendWith(MockitoExtension.class)`

```java
// TaskServiceTest.java
@ExtendWith(MockitoExtension.class)
class TaskServiceTest {

    @Mock
    private TaskRepository taskRepository;      // fake — does nothing unless told to

    @Mock
    private CategoryService categoryService;    // fake

    @InjectMocks
    TaskService taskService;                    // real — gets the fakes injected

    @BeforeEach
    void setUp() {
        started = new Category("started");
        learnMock = new Task("Learn about MOCKS", "Learn about Inject mocks", false, started);
        learnMock.setId(1L);
    }

    @Test
    void shouldSaveNewTask() {
        // Arrange: tell the fake what to return when called
        when(taskRepository.save(learnMock)).thenReturn(learnMock);

        // Act: call the real service
        Task result = taskService.saveTask(learnMock);

        // Assert: check result and verify interactions
        assertThat(result.getTitle()).isEqualTo("Learn about MOCKS");
        verify(taskRepository, only()).save(learnMock);
        verify(categoryService, only()).findCategoryByLabel("started");
    }
}
```

**What `@Mock` does:** Creates a fake version of the class. By default, all methods return null, 0, or empty. You use `when(...).thenReturn(...)` to specify what the fake should return for specific inputs.

**What `@InjectMocks` does:** Creates the *real* `TaskService` using its constructor, and automatically passes in all `@Mock` fields as arguments.

**What `verify()` does:** Asserts that a method was called (or not called) on a mock, with specific arguments, a specific number of times.

```java
verify(taskRepository, only()).save(learnMock);         // was called exactly once, with learnMock
verify(categoryService, only()).findCategoryByLabel("started"); // was called exactly once
verify(categoryRepository, never()).save(any());        // was NEVER called
verify(categoryRepository, times(2)).findById(any());  // was called exactly twice
```

**No Spring context. No database. No HTTP.** This is the fastest possible test.

---

## Slice Tests — Controller Layer

### Pattern: `@WebMvcTest`

```java
// TaskControllerTest.java
@WebMvcTest(TaskController.class)
class TaskControllerTest {

    @Autowired
    private MockMvc mockMvc;           // fake HTTP layer — sends requests without a real server

    @Autowired
    private ObjectMapper objectMapper; // Jackson — converts objects to/from JSON

    @MockitoBean
    TaskService taskService;           // fake service — controller's dependency

    @Test
    void shouldSaveNewTask() throws Exception {
        when(taskService.saveTask(any(Task.class))).thenReturn(learnHttpMethods);

        mockMvc.perform(post("/api/v1/task")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(learnHttpMethods)))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.title").value(matchesPattern("Learn about.*request/response")))
            .andExpect(jsonPath("$.category.label").value("enablement"))
            .andDo(print());

        verify(taskService, times(1)).saveTask(any(Task.class));
    }
}
```

**What `MockMvc` is:** A fake HTTP client that fires requests through the Spring MVC framework (routing, serialization, status codes) without starting a real Tomcat server. You test the HTTP contract — does this URL exist? Does it return the right status? Is the JSON correct?

**What `@MockitoBean` does:** Registers a Mockito mock as a Spring bean in the test's application context. The controller gets the fake service injected instead of a real one.

**`jsonPath` matchers — reading them:**
```java
.andExpect(jsonPath("$.title").value("Learn TDD"))
// $         = root of the JSON response
// $.title   = the "title" field at the root
// $.category.label = nested field

.andExpect(jsonPath("$", hasSize(2)))
// $ is the root — used when the response is a JSON array
// hasSize(2) asserts the array has 2 elements

.andExpect(jsonPath("$[0].title").value("First Task"))
// $[0] = first element of the root array
```

---

## Slice Tests — Repository Layer

### Pattern: `@DataJpaTest`

```java
// CategoryRepositoryTest.java
@DataJpaTest
class CategoryRepositoryTest {

    @Autowired
    CategoryRepository categoryRepository;  // real repository, real JPA, fake H2 database

    @Test
    void shouldFindCategoryByLabel() {
        // Arrange
        Category newCategory = new Category("important");
        categoryRepository.save(newCategory);

        // Act
        Optional<Category> findCategory = categoryRepository.findCategoryByLabel(newCategory.getLabel());

        // Assert
        assertThat(findCategory.get().getLabel()).isEqualTo(newCategory.getLabel());
    }
}
```

**What `@DataJpaTest` does:** Loads only the JPA layer. Uses the H2 in-memory database (not your real PostgreSQL). Runs Flyway or creates schema from your entities automatically. Each test gets a clean database — data doesn't leak between tests.

**Why use this over `@SpringBootTest`:** Faster, no need for Docker/PostgreSQL to be running, isolated to just testing repository logic.

---

## Integration Tests — Full Stack

### Pattern: `@SpringBootTest` + `@AutoConfigureMockMvc` + `@Transactional`

```java
// TaskControllerIntegrationTest.java
@SpringBootTest          // full context — all beans, real JPA
@Transactional           // rolls back all DB changes after each test
@AutoConfigureMockMvc    // injects a real MockMvc tied to full context
public class TaskControllerIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private TaskService taskService;     // real service

    @Autowired
    private CategoryService categoryService; // real service

    @BeforeEach
    void setUp() {
        started = categoryService.saveCategory(new Category("started"));  // real DB insert
        learnTdd = new Task("Learn TDD", "research TDD", false, started);
    }

    @Test
    public void shouldGetAllTasks() throws Exception {
        taskService.saveTask(new Task("First Task", "new task", false, started));
        taskService.saveTask(new Task("Second Task", "another task", false, started));

        mockMvc.perform(get("/api/v1/task"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.*", hasSize(2)))
            .andExpect(jsonPath("$[0].title").value("First Task"))
            .andExpect(jsonPath("$[1].title").value("Second Task"));
    }
}
```

**`@Transactional` on a test class:** Every test method runs inside a transaction that is rolled back when the method finishes. Your `@BeforeEach` inserts data — that data exists during the test — then disappears. The database stays clean with no manual cleanup.

**This requires Docker running** (PostgreSQL via `compose.yaml`). It's the most realistic test but the slowest.

---

## ArgumentCaptor — What You're Capturing

```java
// CategoryControllerTest.java
@Captor
ArgumentCaptor<Category> captor = ArgumentCaptor.forClass(Category.class);

// In the test:
verify(categoryService, only()).saveCategory(captor.capture());
assertThat(captor.getValue()).usingRecursiveComparison().isEqualTo(newCategory);
```

**The problem `Captor` solves:** `verify(service).saveCategory(any())` tells you the method was called, but not what it was called *with*. `Captor` intercepts the actual argument and lets you make assertions on it.

`usingRecursiveComparison()` compares all fields of the object recursively, not just reference equality. Two different `Category` objects with the same `label` and `id` will pass this assertion.

---

## Arrange / Act / Assert

Every test in your project follows this structure:
```java
// Arrange — set up test data and mock behavior
Category newCategory = new Category("Normal");
when(categoryService.saveCategory(any())).thenReturn(newCategory);

// Act — call the thing being tested
mockMvc.perform(post("/api/v1/category")...);

// Assert — verify the outcome
verify(categoryService).saveCategory(captor.capture());
assertThat(captor.getValue().getLabel()).isEqualTo("Normal");
```

This maps directly to the TDD pattern: you know what the test should assert before you write the implementation.

---

## Which Test Type to Write When

| What you're testing | Test type | Annotation |
|---|---|---|
| Business logic in a service | Unit test | `@ExtendWith(MockitoExtension.class)` |
| HTTP routing, status codes, JSON shape | Controller slice | `@WebMvcTest` |
| Custom repository query methods | Repository slice | `@DataJpaTest` |
| Full request from HTTP to DB and back | Integration | `@SpringBootTest` + `@AutoConfigureMockMvc` |
| App starts without crashing | Smoke test | `@SpringBootTest` alone |

---

## Related
- [[Spring Boot - Annotations Reference]] — all test annotations explained in detail
- [[Spring Boot - Controllers and REST]] — `@WebMvcTest` tests the controller layer
- [[Spring Boot - Services]] — `@ExtendWith` unit tests target the service layer
- [[Spring Boot - Repositories and Queries]] — `@DataJpaTest` tests the repository layer
- [[TDD/Introduction to TDD Arrange]] — the Arrange/Act/Assert pattern every test uses
- [[Spring Boot - The Request Lifecycle]] — integration tests exercise the full lifecycle

