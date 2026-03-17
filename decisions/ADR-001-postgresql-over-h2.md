# ADR-001: PostgreSQL over H2 for Persistence

## Status
Accepted

## Date
2026-03-17

## Context
The cohort11-Todo Spring Boot application needed a persistent data store. Spring Boot defaults to H2 — an in-memory database that requires zero configuration and works out of the box with `@DataJpaTest`. However, H2 does not persist data between application restarts and behaves differently from production-grade databases in subtle ways.

The application is also using Flyway for schema migrations, which works better against a real database that maintains state between runs.

## Decision
Use PostgreSQL as the primary database, managed locally via Docker, with Flyway handling all schema migrations.

## Consequences

**Positive:**
- Data persists between application restarts
- Flyway migrations run against a real PostgreSQL instance, matching production behavior
- Integration tests run against actual PostgreSQL rather than an H2 approximation
- Closer parity between development and any future deployment environment

**Negative:**
- Docker must be running locally before the application or integration tests can start
- Integration tests require `@AutoConfigureTestDatabase(replace = NONE)` and a running PostgreSQL instance
- Slightly more complex initial setup compared to H2

## Notes
The Flyway/PostgreSQL dependency issue previously encountered was caused by a missing `flyway-database-postgresql` dependency in `build.gradle`. Resolution: add both `flyway-core` and `flyway-database-postgresql` to dependencies.

## Related
- [[Flyway]] — migration tool used alongside PostgreSQL
- [[Spring JPA Overview - Annotations]] — JPA configuration for PostgreSQL
- [[cohort11-Todo]] — the project this decision applies to
- [[To Do Study - Self Learning]] — integration test fixes still in progress
