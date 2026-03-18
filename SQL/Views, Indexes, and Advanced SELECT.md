---

---
SQL Joins

Day 9: Views

- A view is a named query stored in the PostgreSQL database server
- A view is defined based on one or more tables
- Can be used like any table

```sql
CREATE VIEW contact AS
SELECT
	first_name,
	last_name,
	email
FROM
	customer;
```

Best if you don’t create the VIEW before testing the SQL statement

What is a VIEW in SQL, and how does it differ from SELECT?

A **VIEW** is a named, saved query that acts like a virtual table in the database. It's based on one or more tables and can be used just like a regular table.

The key differences from SELECT:

- **Persistence**: A VIEW is stored permanently in the database, while a SELECT statement is a one-time query that isn't saved.
- **Reusability**: Once created, a VIEW can be queried multiple times without rewriting the query. A SELECT must be written out each time you need it.
- **Abstraction**: A VIEW can simplify complex queries by hiding joins, filters, or calculations behind a simple name. Users can query the VIEW without knowing the underlying complexity.

For example, the `contact` VIEW shown on this pagestores a query that selects specific columns from the customer table. Instead of writing that SELECT statement repeatedly, you can simply query the VIEW.

Creating and Managing Indexes

- B-tree
- GiST
- SP-GiST
- GIN
- BRIN
[postgresql.org/docs/current/indexes-types.html](http://postgresql.org/docs/current/indexes-types.html)

Advanced SELECT Queries

- Using aggregate functions (SUM, AVG, COUNT)

Group Functions

- `COUNT()`
    - Instead of displaying the rows, just count them
    - SELECT COUNT(*) FROM observer
- `AVG()`
    - Calculate the average of a column
- `MAX()`
    - Maximum of the column
- `MIN()`
    - Minimum of that column
- `SUM()`
    - Calculate the sum of a column

Grouping Data with GROUP BY

- The GROUP BY clause divides the rows returned from the SELECT statement into groups
- Group by type or whatever column you want
- For each group, you can apply an aggregate function
    - SUM() to calculate the sum of items
    - COUNT() to get the number of items in the groups

```sql
SELECT
	column_1,
	column_2,
	...,
	aggregate_function(column_3)
FROM
	table_name
GROUP BY
	column_1,
	column_2,
```

```sql
SELECT brand COUNT(*)
FROM product
GROUP BY brand;
```

Filtering grouped data with HAVING

```sql
SELECT brand, COUNT(*)
FROM product
GROUP BY brand
HAVING COUNT(*) > 1;
```

SQL Joins

- INNER JOIN
    - Only matched rows from both tables
- LEFT JOIN
    - All rows from left table and matched rows from the right
- RIGHT JOIN
    - All rows from right table and matched rows from left
- FULL JOIN
    - All rows from both tables, with NULLS where there is no match
- CROSS JOIN
    - Cartesian product of both tables
- SELF JOIN
    - A table joined with itself
- NATURAL JOIN
    - Automatically joins tables on columns with the same name
- JOIN with USING:
    - Joins tables on a specified column, assuming the column names are identical


Masking PII:

```sql
CREATE OR REPLACE VIEW customer_secure
AS SELECT customer_id, first_name, last_name, 'XXXX-XXXX-XXXX-' || right(license, 4) from customer;
```

```sql
select * FROM customer_secure;
```


## Related
- [[Views, Indexes, and Advanced SELECT]] — views and aggregates introduced in Day 7
- [[Spring JPA Overview - Annotations]] — views in SQL parallel the abstraction Spring repositories provide
- [[Final Project Part 1 Code Space]] — masking PII and views applied in project