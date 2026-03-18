# SQL Course

**Instructor:** Jon-Mikel (JM)
**Database:** PostgreSQL
**Tool:** IntelliJ IDEA Ultimate + Docker

---

## Course Sequence

| # | Note | Topics Introduced |
|---|---|---|
| 1 | [[SQL Day 1 Notes]] | ERD, CRUD, relational database model, datatypes (SERIAL, VARCHAR, INT, FLOAT) |
| 2 | [[SQL Day 2 Notes]] | Primary keys, foreign keys, composite keys, relationships (1:1, 1:M, M:M), indexes |
| 3 | [[Day 3 Notes - Basic SQL Queries]] | DDL, DML, DCL, TCL, SELECT syntax, constraints (NOT NULL, UNIQUE, CHECK) |
| 4 | [[SQL Day 4]] | Filtering with WHERE, BETWEEN, RegEx, CONCAT_WS, JOINs intro, string functions |
| 5 | [[SQL Day 5 Notes]] | Full database creation — Liquor Store schema, CREATE TABLE, FOREIGN KEY |
| 6 | [[SQL Day 6]] | INNER JOIN, multi-table JOINs, CREATE VIEW, normalization (1NF, 2NF, 3NF), referential integrity |
| 7 | [[SQL Day 7]] | GROUP BY, HAVING, aggregate functions (SUM, AVG, COUNT, MAX, MIN), JOIN types |
| 8 | [[SQL Day 8]] | Views, indexes, advanced SELECT, masking PII |
| 9 | [[SQL - PL/SQL and CASE Functions]] | PL/SQL functions, CASE expressions, CHECK constraints |
| 10 | [[Case Statements & more]] | PostgreSQL CASE syntax, conditional data categorization |
| 11 | [[Final Project Part 1 Code Space]] | Multi-table JOINs, aggregates, ALTER TABLE, FK constraints, random data generation |
| 12 | [[Final Project Part 2]] | ERD design, normalization applied to library database |

---

## Key Concepts to Master

- **Normalization:** 1NF → 2NF → 3NF — no partial or transitive dependencies
- **JOIN types:** INNER, LEFT, RIGHT, FULL, CROSS, SELF — know when to use each
- **Referential integrity:** what operations can violate it and why
- **Aggregate functions:** SUM, AVG, COUNT, MAX, MIN with GROUP BY and HAVING
- **Views:** virtual tables that abstract complex queries
- **Indexes:** performance optimization — B-tree is the default in PostgreSQL

---

## Related
- [[Spring JPA Overview - Annotations]] — JPA generates SQL under the hood via Hibernate
- [[Spring Framework]] — Spring Boot connects to SQL databases via JPA
- [[Final Project Part 1 Code Space]] — applied SQL project using joins, constraints, and aggregates
- [[Final Project Part 2]] — ERD and normalization applied to library database
