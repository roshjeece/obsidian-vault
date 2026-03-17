---

---
Querying yesterday’s DB:

- See customers by license
- List all product by order items
- List all order items limited to 3
- List orders by location
- List customer by order date in descending order
- Create a view to list customer by orders and display Full name of customer, brand and total revenues purchased

See Customers by License:

```sql
SELECT license FROM customer;
```


INNER JOIN

Work to understand this a bit better! I feel like I’ve struggled with joins in the past.

```sql
SELECT customer.first_name, customer.last_name, order_.order_date
FROM customer
INNER JOIN order_ ON customer.customer_id = order_.customer_id;
```

```sql
SELECT first_name, last_name, order_date
FROM customer
INNER JOIN order_ ON customer.customer_id = order_.customer_id;
```

Both of these do the same thing!

I am selecting the relevant columns, looking at one table (customer) and aligning it to another table (order_) and specifying where we’re matching information (ON).

I want to see customer name, the date of their order, and the location it was shipped:

```sql
SELECT customer.first_name, customer.last_name, order_.order_date, location.address
FROM customer
INNER JOIN order_ ON
    customer.customer_id = order_.customer_id
INNER JOIN location ON
    customer.customer_id = location.customer_id;
```

I want to see orders by full address.

```sql
SELECT order_.order_id, location.address, location.state, location.zip
FROM customer
INNER JOIN order_ ON
    customer.customer_id = order_.customer_id
INNER JOIN location ON
    customer.customer_id = location.customer_id;
```

I want to see customers by order date in descending order

```sql
SELECT customer.first_name, customer.last_name, order_.order_date
FROM customer
INNER JOIN order_ ON customer.customer_id = order_.customer_id
ORDER BY order_.order_date DESC;
```

Create view for a more complex database with math and several inner joins:

```sql
CREATE VIEW view_name AS -- This creates the VIEW
    SELECT customer.first_name, customer.last_name, product.brand, (product.cost * order_items.quantity) AS revenue -- Specifies columns you want to see, revenue column is a math statement
    FROM customer -- Customers was the initial concern, we put this after FROM
    INNER JOIN order_ ON customer.customer_id = order_.customer_id -- Joined CUSTOMER to ORDER_
    INNER JOIN order_items ON order_.order_id = order_items.order_id -- Joined ORDER_ITEMS to ORDER_
    INNER JOIN product ON order_items.product_id = product.product_id; -- Jointed PRODUCT to ORDER_ITEMS
    -- This is done sequentially.
    -- 1. Creating the view
    -- 2. Specifying the information (columns) I want to see
    -- 3. What is the point of focus of what I'm listing out? It is the CUSTOMER. This goes into the FROM column.
    -- 4. CUSTOMER is getting joined to ORDER_ via matching customer_id key
    -- 5. ORDER_ITEMS is getting joined to ORDER_ITEMS via matching order_id key
    -- 6. ORDER_ITEMS is getting joined to PRODUCT via matching product_id key
```

---

**Six Basic Steps for Designing a Data Structure**

1. Identify the data elements
2. Subdivide each element into its smallest useful components (1NF, 2NF, 3NF, 4NF, 5NF)
    1. Ex: Divide names into first_name, last_name
3. Identify the tables and assign columns
4. Identify the primary and foreign keys
5. Review whether the data structure is normalized
6. Identify the indexes

Exercise: Design Data Structure for the Acme Fabrication Invoice:

```sql
vendor_name
vendor_address
vendor_phone
vendor_fax
vendor_web
invoice_number
invoice_date
invoice_terms
item_part_number
item_qty
item_desc
item_price
item_extension
etc!!!
```

**Operations that can Violate Referential Integrity**

- Deleting a row from the primary key table
    - Why? If FK table contains 1+ rows related to deleted PK table row
- Inserting a row in the FK table
    - Why? if FK value doesn’t have a matching PK value in the related table
- Updating value of a FK
    - Why? if the new FK value doesn’t have matching PK value in the related table
- Updating the value of a PK
    - Why? if FK table contains one or more rows related to the row that changed

---

**Normalization of Database**

First Normal Form (1NF):

- Each table has a PK
- Each column has unique values
- Each column contains values of a ingle type
- Each column contains non-divisible values (atomic)
- No repeating groups or arrays
- Example:

```sql

```

Second Normal Form (2NF):

- Must be in 1NF
- Each non-key column is dependent on the primary key
- No partial dependency
- Example:

| fName | lName | score |
| --- | --- | --- |
| Cindy | William | 800 |
| Andy | Jones | 750 |
| Matthew | Richards | 870 |
| Cindy2 | Lou | 780 |

I want to add RANK column. Rank 1: 900-1000, Rank 2: 800-900, Rank 3: 700-800, Rank 4: 600-700

| fName | Rank | Score |
| --- | --- | --- |
| Cindy | 2 | 800 |
| Andy | 3 | 750 |
| Rooster | 2 | 870 |
| Cindy2 | 3 | 780 |

We don’t want this to happen because the rank is dependent on the score. Separate tables for ranking and scores. One column inside of a table should not affect another column inside of that same table.

Third Normal Form (3NF):

- Must be in 2NF
- No transitive dependencies — non-key columns cannot depend on other non-key columns

DB Example:

- Pet Name
- Pet Kind
- Pet QTY
- Temperament
- Breed
- Size
- Location
- Age
- Investment
- Pedigree
- Food Requirements

How do we logically break these up and then consolidate into appropriate tables?

Journal WIP:

SQL - Day 6 - Queries, Joins, and Designing Data Structure, Normalization of Database, Referential Integrity


## Related
- [[Database Creation and Schema Design]] — database schema being queried here
- [[SQL Day 7.md]] — views and aggregates extend Day 6 joins
- [[Basic Queries and SQL Commands]] — JOIN types referenced here
- [[Final Project Part 1 Code Space]] — complex multi-table joins applied in project
- [[Spring JPA Overview - Annotations]] — Spring JPA performs equivalent joins via entity relationships
- [[_INDEX - SQL Course]] — course overview