# INDEX - Spring

BLUF: This folder covers the full Spring Boot stack — framework concepts, every application layer, testing strategy, and a from-scratch build checklist. Notes are grounded in the cohort11-Todo project (`mil.t2com.moda.todo`).

---

## Conceptual Foundation

Start here if you're new to Spring or need to re-anchor the big picture.

- [[Spring Framework]] — IoC, Dependency Injection, the ApplicationContext, HTTP verb mapping, and the full Controller → Service → Repository → DB flow
- [[Spring JPA Overview - Annotations]] — JPA vs Hibernate, ORM concepts, persistence annotations, application.yaml datasource config
- [[Flyway]] — database migration tool, versioned SQL files, naming conventions, common failure modes

---

## Application Layers (bottom-up)

Follow this order when building a new feature.

- [[Spring Boot - Project Structure and Startup]] — folder layout, build.gradle dependencies, application.yaml, compose.yaml, startup sequence
- [[Spring Boot - Entities and JPA]] — `@Entity`, `@ManyToOne`, `@GeneratedValue`, JPA field mapping, the fluent setter pattern
- [[Spring Boot - Repositories and Queries]] — `JpaRepository`, derived query naming convention, `Optional<T>`, `save()` insert vs update behavior
- [[Spring Boot - Services]] — business logic layer, constructor injection, singleton gotchas, find-or-create pattern
- [[Spring Boot - Controllers and REST]] — REST verb/URL design, `@RequestBody`, `@PathVariable`, `ResponseEntity` vs `@ResponseStatus`, Jackson serialization

---

## Cross-Cutting

- [[Spring Boot - The Request Lifecycle]] — traces a single HTTP request through all four layers with your actual code
- [[Spring Boot - Annotations Reference]] — every `@` annotation in the project documented: what it does, why it exists, when to use it
- [[Spring Boot - Testing Strategy]] — unit tests, `@WebMvcTest`, `@DataJpaTest`, `@SpringBootTest` integration tests, `ArgumentCaptor`, `@Transactional` rollback

---

## Build Reference

- [[Spring Boot - How to Build This Unassisted]] — step-by-step checklist from `start.spring.io` to a working tested endpoint; boilerplate for every layer; common mistakes table

---

## Related (outside Spring/)

- [[TDD/Introduction to TDD Arrange]] — testing philosophy behind every test in this stack
- [[ADR-001-postgresql-over-h2]] — decision record explaining the PostgreSQL datasource choice
- [[Projects/cohort11-Todo]] — the active project these notes are grounded in
- [[SQL/Database Creation and Schema Design]] — Flyway migrations are versioned SQL; understanding schema design is prerequisite knowledge