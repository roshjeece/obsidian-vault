# Spring Boot - Project Structure and Startup

BLUF: A Spring Boot project is a Java application with a specific folder layout, a build file that pulls in dependencies, and a single entry point class that boots the entire framework. Understanding what every file does before you write a line of code is the difference between following along and actually understanding.

---

## The Folder Layout

```
cohort11-Todo/
├── build.gradle              ← dependency list + build instructions
├── settings.gradle           ← project name
├── compose.yaml              ← Docker config for your local PostgreSQL
├── gradlew                   ← shell script to run Gradle without installing it
├── src/
│   ├── main/
│   │   ├── java/             ← your application code lives here
│   │   │   └── mil/t2com/moda/todo/
│   │   │       ├── TodoApplication.java     ← entry point
│   │   │       ├── category/                ← one package per feature
│   │   │       │   ├── Category.java
│   │   │       │   ├── CategoryController.java
│   │   │       │   ├── CategoryRepository.java
│   │   │       │   └── CategoryService.java
│   │   │       └── task/
│   │   │           ├── Task.java
│   │   │           ├── TaskController.java
│   │   │           ├── TaskRepository.java
│   │   │           └── TaskService.java
│   │   └── resources/
│   │       ├── application.yaml             ← app configuration
│   │       └── db/migration/
│   │           └── V1__init.sql             ← Flyway database migration
│   └── test/
│       └── java/             ← mirrors main/ structure, test files only
```

**The pattern inside each feature package is always:** Entity → Repository → Service → Controller. That is the stack, bottom to top, from database to HTTP.

---

## build.gradle — What You're Pulling In

```groovy
// build.gradle
plugins {
    id 'java'
    id 'org.springframework.boot' version '4.0.3'        // makes the app runnable as a JAR
    id 'io.spring.dependency-management' version '1.1.7' // manages dependency versions for you
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'   // database layer
    implementation 'org.springframework.boot:spring-boot-starter-webmvc'     // HTTP / REST layer
    implementation 'org.springframework.boot:spring-boot-starter-flyway'     // DB migrations
    implementation 'org.flywaydb:flyway-core'
    implementation 'org.flywaydb:flyway-database-postgresql'

    runtimeOnly 'org.postgresql:postgresql'              // PostgreSQL driver (only needed at runtime)
    runtimeOnly 'org.springframework.boot:spring-boot-docker-compose' // auto-starts compose.yaml

    testRuntimeOnly 'com.h2database:h2'                  // in-memory DB for tests
    testImplementation 'org.springframework.boot:spring-boot-starter-data-jpa-test'
    testImplementation 'org.springframework.boot:spring-boot-starter-webmvc-test'
    testImplementation 'org.mockito:mockito-inline:5.2.0'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
}
```

**What each block means:**
- `implementation` — needed to compile AND run
- `runtimeOnly` — only needed when the app is actually running (not during compile)
- `testImplementation` — only needed for tests
- `testRuntimeOnly` — only needed when tests are running

**The "starters"** are Spring Boot convenience bundles. `spring-boot-starter-data-jpa` pulls in Hibernate, JPA, connection pooling, and everything else you'd need to talk to a database — one line instead of ten.

---

## application.yaml — Your App's Configuration

```yaml
# src/main/resources/application.yaml
spring:
  application:
    name: todo

  datasource:
    url: jdbc:postgresql://localhost:5434/todo  # port 5434 because compose.yaml maps 5434→5432
    driver-class-name: org.postgresql.Driver
    username: todo_dev
    password: todo_dev12

  jpa:
    hibernate:
      ddl-auto: update    # WARNING: let Hibernate try to sync schema — Flyway should own this
    show-sql: true        # prints every SQL query to the console (useful for debugging)

  flyway:
    enabled: true
    locations: classpath:db/migration   # tells Flyway where to find SQL scripts

server:
  port: 8080
```

**`ddl-auto: update` note:** With Flyway managing your schema, this should ideally be `validate` or `none`. `update` lets Hibernate modify your schema, which conflicts with Flyway's purpose of owning all schema changes. Your instructor may address this.

---

## compose.yaml — Your Local Database

```yaml
# compose.yaml
services:
  postgres-db:
    container_name: todo
    image: postgres:18
    environment:
      POSTGRES_USER: todo_dev
      POSTGRES_PASSWORD: todo_dev12
      POSTGRES_DB: todo
    ports:
      - "5434:5432"   # host:container — access on 5434 to avoid conflicts with other Postgres instances
```

Spring Boot detects `compose.yaml` at startup (via the `spring-boot-docker-compose` dependency) and automatically starts the container for you. You don't run `docker compose up` manually in development.

---

## TodoApplication.java — The Entry Point

```java
// src/main/java/mil/t2com/moda/todo/TodoApplication.java
@SpringBootApplication
public class TodoApplication {
    public static void main(String[] args) {
        SpringApplication.run(TodoApplication.class, args);
    }
}
```

This is the only `main()` in the entire project. `@SpringBootApplication` is a shortcut for three annotations:

| Annotation | What it does |
|---|---|
| `@SpringBootConfiguration` | Marks this as a Spring configuration class |
| `@EnableAutoConfiguration` | Tells Spring to auto-configure based on what's on the classpath |
| `@ComponentScan` | Tells Spring to scan this package and all sub-packages for components |

`SpringApplication.run()` starts the embedded Tomcat server, scans for all your `@Component`, `@Service`, `@Repository`, and `@RestController` classes, wires them together (dependency injection), runs Flyway migrations, and begins listening on port 8080.

**Everything else in your project is discovered automatically because it lives in a sub-package of `mil.t2com.moda.todo`.**

---

## How Startup Sequence Works

```
1. main() called
2. Spring scans all sub-packages for annotated classes
3. Spring creates the ApplicationContext (the container that holds all your objects)
4. Flyway runs — checks db/migration/, finds V1__init.sql, creates tables if not exists
5. JPA validates/syncs entities against the schema
6. Embedded Tomcat starts on port 8080
7. Controllers are registered as HTTP endpoints
8. App is ready to receive requests
```

---

## Related
- [[Spring Framework]] — broad overview of the Spring ecosystem this project lives in
- [[Spring JPA Overview - Annotations]] — deep dive on annotations used in entities and repositories
- [[Flyway]] — how V1__init.sql gets executed and why migrations exist
- [[ADR-001-postgresql-over-h2]] — the decision to use PostgreSQL instead of H2
- [[Spring Boot - The Request Lifecycle]] — what happens after startup when a request arrives
- [[Spring Boot - Annotations Reference]] — every @ annotation in this project explained
- [[Spring Boot - Testing Strategy]] — how the test folder mirrors this structure

## Suggested Backlinks
- Add [[Spring Boot - Project Structure and Startup]] to [[Spring Framework]] — grounds the broad framework overview in a concrete project structure
- Add [[Spring Boot - Project Structure and Startup]] to [[Flyway]] — connects migration execution to the startup sequence where it actually runs
