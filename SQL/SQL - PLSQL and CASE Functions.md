---

---
PL SQL Example:

```sql
CREATE OR REPLACE FUNCTION get_grade_description (grade_in IN CHAR)
RETURN VARCHAR2
IS
	v_description VARCHAR2(50)
BEGIN
	CASE grade_in
		WHEN 'A' THEN
			v_description := 'Excellent';
		WHEN 'B' THEN
			v_description := 'Very Good'
		WHEN 'A' THEN
			v_description := 'Good'
		WHEN 'A' THEN
			v_description := 'Pass'
		WHEN 'A' THEN
			v_description := 'Fail'
		ELSE
			v_description := 'Invalid Grade' -- Default case if no WHEN matches
	END CASE;
	
	RETURN v_description;
	
END;
/

-- PL SQL
```


## Related
- [[SQL Course]] — course overview
- [[Case Statements & more]] — CASE expressions covered the same week
- [[SQL - Basic Queries and SQL Commands]] — foundational SQL concepts applied here
- [[Conditionals and Switch Statements]] — SQL CASE is the direct equivalent of Java switch statements