---

---
- PostgreSQL CASE expression

```sql
CASE
	WHEN condition_1 THEN result_1
	WHEN condition_2 THEN result_2
	[WHEN ...]
	[ELSE else_result]
END
```

See: [PostgreSQL CASE](https://neon.com/postgresql/postgresql-tutorial/postgresql-case)

```sql
SELECT title,
			 rating,
			 CASE rating
					 WHEN 'G' THEN 'General Audiences'
					 WHEN 'PG' THEN 'Parental Guidance Suggested'
           WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
           WHEN 'R' THEN 'Restricted'
           WHEN 'NC-17' THEN 'Adults Only'
       END rating_description
FROM film
ORDER BY title;
					 
```

- Lets us define different outputs based on conditions
- Categorize data on the fly without changing the original table
- Perfect for creating reports or segmenting data
- See above for examples

See: [Conditional Expressions - Functions and Operators](https://www.postgresql.org/docs/current/functions-conditional.html)

---

CHECK

- A rule you apply to a table column to ensure data meets a specific condition before it’s inserted or updated
- For data integrity. It prevents invalid data from ever entering your database, such as negative prices or impossible data.

```sql
-- Pseudocode
CREATE TABLE product (
	
```

```sql
ALTER TABLE product
ADD CONSTRAINT check_positive_cost
CHECK (cost >= 0);
```

See: [PostgreSQL CHECK Constraints](https://neon.com/postgresql/postgresql-tutorial/postgresql-check-constraint)

## Related
- [[PLSQL and CASE Functions]] — same week, related SQL concepts
- [[Basic Queries and SQL Commands]] — foundational SQL syntax
- [[Final Project Part 1 Code Space]] — conditional logic applied in project queries