# To Do Study — Self Learning

Active gaps and study priorities. Update as you close them.

---

## Priority 1 — MVC (CRITICAL)

> "Lucas failed this part of the interview" — do not let this be you.

**Model-View-Controller** is the architectural pattern Spring Boot uses. You need to be able to explain it clearly and confidently.

### What is MVC?

| Layer | Role | Spring Annotation |
|---|---|---|
| **Model** | Data and business logic | `@Entity`, `@Service` |
| **View** | What the user sees | JSON response / React frontend |
| **Controller** | Handles requests, routes to service | `@RestController` |

### The full request flow — be able to draw this from memory:

```
Client → HTTP Request → Controller → Service → Repository → Database
                                                          ↓
Client ← HTTP Response ← Controller ← Service ← Repository
```

### How to explain it in an interview:

"MVC separates concerns into three layers. The Controller receives the HTTP request and delegates to the Service. The Service contains the business logic and calls the Repository for data access. The Repository talks to the database. The Controller then returns the response to the client. Each layer only knows about the layer directly below it."

---

## Priority 2 — HTTP Methods

| Method | CRUD Operation | When to Use |
|---|---|---|
| `GET` | Read | Retrieve a resource, no body |
| `POST` | Create | Send data to create a new resource |
| `PUT` | Update (full) | Replace entire resource |
| `PATCH` | Update (partial) | Update specific fields only |
| `DELETE` | Delete | Remove a resource |

### HTTP Response Codes to know:

| Code | Meaning |
|---|---|
| `200 OK` | Success |
| `201 Created` | Resource created (use with POST) |
| `400 Bad Request` | Client sent invalid data |
| `404 Not Found` | Resource doesn't exist |
| `500 Internal Server Error` | Something broke on the server |

---

## Priority 3 — Testing Layers in Spring

Know which test type belongs to which layer — this comes up in interviews and in your todo app:

| Layer | Test Type | Annotation | What it Does |
|---|---|---|---|
| Controller | Web layer test | `@WebMvcTest` | Tests HTTP request/response, mocks service |
| Service | Unit test | `@ExtendWith(MockitoExtension.class)` | Tests business logic, mocks repository |
| Repository | Data layer test | `@DataJpaTest` | Tests DB queries against in-memory DB |
| Full stack | Integration test | `@SpringBootTest` | Loads full context, tests everything together |

---

## Priority 4 — Todo App

Apply everything above to `cohort11-Todo`:

- [ ] Controller layer clean and skinny
- [ ] Service layer contains all business logic
- [ ] Repository uses Spring Data JPA
- [ ] Integration tests passing in `TaskControllerIntegrationTest`
- [ ] Flyway migrations in sync with JPA entities

---

## Status

| Topic | Status |
|---|---|
| MVC architecture | Learning |
| HTTP methods | Learning |
| Spring testing layers | Learning |
| Todo app integration tests | In progress |

---

## Related
- [[Spring Framework]] — MVC is the core pattern Spring implements
- [[Spring JPA Overview - Annotations]] — JPA is the repository layer
- [[Introduction to TDD Arrange]] — testing layers map directly to TDD principles
- [[Self Study]] — parent note
