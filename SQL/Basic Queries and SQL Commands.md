---

---
- SELECT
- CREATE
- DROP

**SQL Command**

- Data Definition Language (DDL)
    - CREATE
    - ALTER
    - DROP
    - TRUNCATE
    - COMMENT
    - RENAME
- Data Manipulation Language (DML)
    - SELECT
    - INSERT
    - UPDATE
    - DELETE
    - MERGE
    - CALL
    - EXPLAIN PLAN
    - LOCK TABLE
- Data Control Language (DCL)
    - GRANT
    - REVOKE
- Transaction Control Language (TCL)
    - COMMIT
    - ROLLBACK
    - SAVEPOINT
    - SET TRANSACTION

**Constraints**

- NOT NULL
    - ensures value in a column cannot be null
- UNIQUE
    - ensures the values in a column are unique across the rows within the same table
- PRIMARY KEY
    - define the PK of a table
- FOREIGN KEY
    - ensures values in column from table exist in a column or group of columns in another table
- CHECK
    - ensures data satisfies a boolean expression (ex: value in the price column must be zero or positive)

**Basic SELECT**

- SELECT
    - list of columns to extract
- FROM
    - list of table(s)
- WHERE
    - condition to limit selection
- GROUP BY
    - grouping expression
- HAVING
    - condition to limit grouping
- ORDER BY
    - sort order
- LIMIT
    - number of rows to extract
## Related
- [[Keys, Relationships, and Constraints]] — keys and relationships that queries operate on
- [[_INDEX - SQL Course]] — course overview
- [[Filtering, Joins, and String Functions]] — applies basic queries with JOINs and filters
- [[Spring JPA Overview - Annotations]] — Spring Data generates DDL and DML automatically
- [[Final Project Part 1 Code Space]] — SELECT, JOIN, and aggregate queries used throughout