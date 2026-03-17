---

---
- Spend some time to get familiarized with IntelliJ, initiating a new SQL database from scratch with Docker

“Services” button — double clicking will show you a table. Hit “services” and it’ll show you how exactly it produced the results

```sql
SELECT t.*
FROM public.customer t
LIMIT 501
```

Sort customer names and list only those between A and L

```sql
SELECT customer.last_name
FROM customer
WHERE last_name BETWEEN 'A' AND 'L';
```

Also possible with a RegEx

```sql
SELECT customer.last_name
FROM table_name
WHERE column_name ~ '^[A-L]';
```

You cannot combine null and not null statements

Combine address into one fluid output:

```sql
SELECT CONCAT_WS( ', ', address1, address2, city, state, zipcode)
AS "Full Address"
FROM addresses
WHERE state = 'CA';
```

VIEW

Look at the “text” statement:

```sql
SELECT customer.first_name,
       customer.last_name,
       customer.phone,
       concat_ws(', '::text, addresses.address1, addresses.address2, addresses.city, addresses.state,
                 addresses.zipcode) AS address
FROM customer
         JOIN addresses ON customer.aid = addresses.aid
```

That text is the preferred version for this data output for encoding. Why?

This is the way we grab all the information and make it better for our programs to understand it.

This put all the address information in one column (fancy!)

Figure out how to update just one name (Steve Job —> Steve Jobs)


Tables

```sql
SELECT customer.first_name, customer.last_name, customer.phone, addresses.city, addresses.state
FROM customer
JOIN addresses ON customer.aid = addresses.aid
WHERE state = 'CA';
```

String Concatenation


```sql
SELECT orders.customer_num, count(orders.order_num) AS total_orders
FROM orders
GROUP BY customer_num;
```
## Related
- [[Day 3 Notes - Basic SQL Queries]] — basic SELECT syntax used here
- [[SQL Day 5 Notes]] — full database creation builds on Day 4 queries
- [[SQL Day 6.md]] — JOINs and views extend Day 4 concepts
- [[SQL Course]] — course overview