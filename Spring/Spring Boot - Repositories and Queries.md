# Spring Boot - Repositories and Queries

BLUF: A repository is the only layer in your app that directly touches the database. Spring Data JPA generates the implementation automatically — you write an interface with method signatures, and Spring writes the SQL. For anything beyond basic CRUD, you use naming conventions or custom queries.

---

## What a Repository Is

```java
// TaskRepository.java
@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
    // nothing here — and it still works
}
```

`JpaRepository<Task, Long>` has two type parameters:
- `Task` — the entity this repository manages
- `Long` — the type of the primary key

By extending `JpaRepository`, your repository **inherits all of this for free:**

| Method | What it does |
|---|---|
| `save(entity)` | INSERT if new, UPDATE if exists |
| `findById(id)` | SELECT WHERE id = ? → returns `Optional<T>` |
| `findAll()` | SELECT * |
| `deleteById(id)` | DELETE WHERE id = ? |
| `existsById(id)` | SELECT EXISTS WHERE id = ? |
| `count()` | SELECT COUNT(*) |

You write zero SQL for any of these.

---

## CategoryRepository — Custom Query Method

```java
// CategoryRepository.java
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    Optional<Category> findCategoryByLabel(String label);
}
```

`findCategoryByLabel(String label)` is a **derived query method** — you write the method name following Spring Data's naming convention and Spring generates the SQL automatically.

**How Spring reads the method name:**

```
findCategoryByLabel(String label)
│     │        │
│     │        └── column: label
│     └── entity: Category (inferred from the repository type)
└── operation: SELECT
```

**Generated SQL:**
```sql
SELECT * FROM category WHERE label = ?
```

**Returns `Optional<Category>`** — this is the correct return type when a record might not exist. Using `Optional` forces the caller to handle the "not found" case explicitly instead of getting a `NullPointerException`.

---

## Naming Convention Reference

Spring Data JPA reads method names to generate queries. Knowing the vocabulary lets you write any basic query without SQL:

| Keyword | Example method name | SQL fragment |
|---|---|---|
| `findBy` | `findByTitle` | `WHERE title = ?` |
| `findBy...And...` | `findByTitleAndIsComplete` | `WHERE title = ? AND is_complete = ?` |
| `findBy...Or...` | `findByCategoryOrId` | `WHERE category_id = ? OR id = ?` |
| `findBy...Containing` | `findByTitleContaining` | `WHERE title LIKE %?%` |
| `findBy...StartingWith` | `findByTitleStartingWith` | `WHERE title LIKE ?%` |
| `findBy...OrderBy...Asc` | `findAllByOrderByTitleAsc` | `ORDER BY title ASC` |
| `existsBy` | `existsByLabel` | `SELECT EXISTS WHERE label = ?` |
| `countBy` | `countByIsComplete` | `SELECT COUNT WHERE is_complete = ?` |
| `deleteBy` | `deleteByCategory` | `DELETE WHERE category_id = ?` |

**Your commented-out example:**
```java
// TaskRepository.java
// Optional<Task> findByCategoryOrId(Category category, Long id);
```
This would generate: `SELECT * FROM task WHERE category_id = ? OR id = ?`

---

## How Optional Works

`Optional<T>` is a container that may or may not hold a value. It forces you to handle the null case.

```java
// CategoryService.java
public Optional<Category> findCategoryByLabel(String label) {
    return categoryRepository.findCategoryByLabel(label);
}

public Category createCategoryIfNotExist(String label) {
    Optional<Category> queryCategory = categoryRepository.findCategoryByLabel(label);

    if (queryCategory.isEmpty()) {
        return categoryRepository.save(new Category(label));  // doesn't exist → create it
    }

    return queryCategory.get();  // exists → return it
}
```

**Key `Optional` methods:**

| Method | What it does |
|---|---|
| `isEmpty()` | true if no value present |
| `isPresent()` | true if value exists |
| `get()` | returns the value (throws if empty — use carefully) |
| `orElseThrow()` | returns value or throws `NoSuchElementException` |
| `orElse(default)` | returns value or a default if empty |

**`orElseThrow()` in TaskService:**
```java
public Task findTaskById(Long id) {
    return taskRepository.findById(id).orElseThrow();
    // if no task with that id exists → throws NoSuchElementException → Spring returns 500
    // better practice: .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND))
}
```

---

## The `save()` Method — Insert vs Update

`save()` does double duty:

```java
Task newTask = new Task(...);           // id is null
taskRepository.save(newTask);          // → INSERT (id is null, so it's new)

existingTask.setTitle("Updated");      // id is set (e.g. 42L)
taskRepository.save(existingTask);     // → UPDATE WHERE id = 42
```

JPA determines INSERT vs UPDATE by whether the entity's `id` field is null. If null → INSERT. If set → UPDATE (called a "merge").

---

## What Happens at Runtime

At startup, Spring scans for all interfaces annotating with `@Repository` that extend `JpaRepository`. For each one, it generates a proxy class — a real Java object that implements the interface and contains the actual JDBC code. You never see that generated code, but it's there.

```
Your interface     Spring generates this at runtime
─────────────      ──────────────────────────────────────────────
TaskRepository  →  SimpleJpaRepository<Task, Long>
                   (contains actual EntityManager calls)
```

---

## Related
- [[Spring Boot - Entities and JPA]] — repositories operate on entities; the two are tightly coupled
- [[Spring Boot - Services]] — services call repositories; the service is the only layer that should access a repository
- [[Spring Boot - The Request Lifecycle]] — repositories are layer 3 in the chain
- [[Spring Boot - Annotations Reference]] — `@Repository` annotation explained
- [[SQL/Basic Queries and SQL Commands]] — the SQL that derived query methods generate
- [[SQL/Filtering, Joins, and String Functions]] — the SQL concepts behind `findBy`, `Containing`, etc.

