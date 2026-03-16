---

---
Learning Objectives:

- Understand Spring JPA and Hibernate
- Hibernate (ORM)
- How do we use Spring JPA?
- Jackson Serialization
- What are the relevant Spring annotations for Spring JPA
- Application.yaml

Annotations:

- `@Repository`
- `@Entity`
- `@Table`
- `@GeneratedValue`
- `@Column`
- What is Flyway? (generates SQL for us)
- What is a migration?

No persistence of any kind without a JPA

Jakarta Persistence API (**JPA**)

- Specification that defines a common API for Object Relational Mapper (**ORM**) frameworks like Hibernate

Object Relational Mapper (ORM)

- Apps depend on the ability to read/write data to a db for almost all functionality. ORMs significantly decrease the complexity of managing records in the db
- Enable you to:
    - Define relationships between tables **in your classes** themselves
    - Update multiple tables and query tables in one command

Spring Jakarta Persistence API:

- How do you access this JPA capability?
    - Add the JPA dependency in build.gradle
- With an existing database connection, update the application.yaml
- Here are some of the relevant Spring annotations for Spring JPA:
    - `@Entity`
    - `@Id`
    - `@GeneratedValue(strategy = GenerationType.IDENTITY)`
    - `@Repository`

How does adding dependencies like JPA, to an existing Spring Boot project, reduce boilerplate?


```markdown
datasource:
	url: jdbc:postgresql://localhost:543*/aircraft
	driver-class-name: org.postgresql.Driver
```
## Related
- [[Spring Framework]] — JPA is the persistence layer of the Spring stack
- [[SQL Course]] — JPA generates SQL under the hood via Hibernate
- [[Introduction to TDD Arrange]] — @DataJpaTest is the test type for the repository layer
- [[Day 3 Notes - Basic SQL Queries]] — understanding raw SQL helps understand what JPA generates