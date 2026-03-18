# SQL Course

**Instructor:** Jon-Mikel (JM)
**Database:** PostgreSQL
**Tool:** IntelliJ IDEA Ultimate + Docker

---

## Course Sequence

| # | Note | Topics Introduced |
|---|---|---|
| 1 | [[Foundations, Datatypes, and ERD]] | ERD, CRUD, relational database model, datatypes (SERIAL, VARCHAR, INT, FLOAT) |
| 2 | [[Keys, Relationships, and Constraints]] | Primary keys, foreign keys, composite keys, relationships (1:1, 1:M, M:M), indexes |
| 3 | [[Basic Queries and SQL Commands]] | DDL, DML, DCL, TCL, SELECT syntax, constraints (NOT NULL, UNIQUE, CHECK) |
| 4 | [[Filtering, Joins, and String Functions]] | Filtering with WHERE, BETWEEN, RegEx, CONCAT_WS, JOINs intro, string functions |
| 5 | [[Database Creation and Schema Design]] | Full database creation — Liquor Store schema, CREATE TABLE, FOREIGN KEY |
| 6 | [[Joins, Views, and Normalization]] | INNER JOIN, multi-table JOINs, CREATE VIEW, normalization (1NF, 2NF, 3NF), referential integrity |
| 7 | [[Views, Indexes, and Advanced SELECT]] | Views, indexes, GROUP BY, HAVING, aggregate functions, JOIN types, masking PII |
| 8 | [[PLSQL and CASE Functions]] | PL/SQL functions, CASE expressions, CHECK constraints |
| 9 | [[Case Statements & more]] | PostgreSQL CASE syntax, conditional data categorization |
| 10 | [[Final Project Part 1 Code Space]] | Multi-table JOINs, aggregates, ALTER TABLE, FK constraints, random data generation |
| 11 | [[Final Project Part 2]] | ERD design, normalization applied to library database |

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
- [[Final Project Part 2]] — ERD design and normalization applied to library database
