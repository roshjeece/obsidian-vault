# Flyway

**Flyway** is a database migration tool that manages and versions SQL schema changes. It is used in the todo app to keep the database schema in sync with JPA entities.

---

## What Problem It Solves

Without Flyway, schema changes require manual SQL execution. With Flyway, schema changes are tracked as versioned migration files that run automatically on application startup.

---

## How It Works

1. Migration files live in `src/main/resources/db/migration/`
2. Files are named with a version prefix: `V1__create_task_table.sql`
3. On startup, Flyway checks which migrations have run and applies any new ones
4. Flyway tracks applied migrations in a `flyway_schema_history` table

---

## Naming Convention

```
V{version}__{description}.sql
V1__create_task_table.sql
V2__add_status_column.sql
V3__add_due_date_to_task.sql
```

- `V` — required prefix
- `{version}` — integer, must be sequential
- `__` — double underscore separator
- `{description}` — snake_case description

---

## Example Migration

```sql
-- V1__create_task_table.sql
CREATE TABLE task (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);
```

---

## Common Issues

**Flyway checksum mismatch** — if you edit an already-applied migration file, Flyway will fail on startup. Never edit a migration that has already run. Always create a new migration instead.

**Migration out of order** — if V3 runs before V2, Flyway will error. Keep versions sequential.

**Test datasource conflict** — `@DataJpaTest` spins up H2 by default, which may not run Flyway migrations. Use `@AutoConfigureTestDatabase(replace = NONE)` to force Flyway to run against your test PostgreSQL instance.

---

## Gradle Dependency

```groovy
implementation 'org.flywaydb:flyway-core'
implementation 'org.flywaydb:flyway-database-postgresql'
```

---

## Related
- [[Spring JPA Overview - Annotations]] — JPA entities must stay in sync with Flyway migrations
- [[Spring Framework]] — Flyway is configured as part of the Spring Boot datasource setup
- [[SQL - Database Creation and Schema Design]] — Flyway migrations are versioned SQL CREATE TABLE statements
- [[To Do Study - Self Learning]] — Flyway migration sync is an open todo app task
