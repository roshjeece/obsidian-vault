---

---
```java
-- Task 1: See Screenshot

-- Task 2: See Screenshot

-- Task 3
SELECT customer.name, customer.email
FROM customer;

-- Task 4
SELECT customer.name, customer.email
FROM customer
WHERE customer.email = 'Darby85@gmail.com';

-- Task 5
SELECT customer.name, customer.phone
FROM customer
WHERE customer.name = 'Nina White';

-- Task 6
SELECT product.description, product.price, product.product_name AS category, vendor.name AS vendor
FROM product
INNER JOIN vendor ON product.vendor_id = vendor.vendor_id
WHERE product.description = 'Tasty Concrete Shoes';

-- Task 7
SELECT product.description, product.product_name, networknumber.net_number
FROM product
INNER JOIN prod_netwrk ON product.product_id = prod_netwrk.product_id
INNER JOIN networknumber ON prod_netwrk.network_id = networknumber.network_id
WHERE networknumber.net_number = '10.1.1.16';

-- Task 8
SELECT SUM(product.price - product.cost) AS Cheese_Profit
FROM product
WHERE product.product_name = 'Cheese';

-- Task 9
ALTER TABLE customer
    ADD COLUMN assigned_employee_id INT;
-- Purpose: This adds the foreign key column to the customer table.

ALTER TABLE customer
ADD CONSTRAINT FK_customers_employee
    FOREIGN KEY (assigned_employee_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL; -- If the employee is removed, the customer isn't deleted. The assignment is just cleared.
-- Purpose: This establishes the formal FK relationship between employee (PK) and customer (FK)

UPDATE customer
SET assigned_employee_id = FLOOR(RANDOM() * 25 + 1)::INT
WHERE assigned_employee_id IS NULL;
-- Purpose: Randomly assign customers to employees.
-- Random decimal value between 0-1, scaled to 0-25, shifted to 1-26, rounded down to 1-25, casts to INT.

-- Task 9 Deliverable
SELECT c.customer_id, c.name AS Customer, c.email, c.phone, c.address, e.employee_id, e.name AS "Assigned Employee"
FROM customer c
JOIN employee e
ON c.assigned_employee_id = e.employee_id
ORDER BY c.customer_id
LIMIT 10;
-- Purpose: Display relationship, limited to 10 rows.
-- I added ORDER BY because customer_id(356) was showing up in those first ten numbers.

-- Task 10 SETUP
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_items (
    order_items_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price NUMERIC (19,4), -- Matches datatype in product table
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO orders (customer_id)
SELECT customer_id
FROM customer
ORDER BY customer_id;



-- Task 10 Solution (MVP)
SELECT c.customer_id, c.name, p.product_id, p.product_name
FROM customer c
         JOIN orders o ON c.customer_id = o.customer_id
         JOIN order_items oi ON o.order_id = oi.order_id
         JOIN product p ON oi.product_id = p.product_id
LIMIT 10;
-- Minimal solution where no information is inserted, this returns zero rows but does force the relationship, as per the question.


-- Task 10 Solution (MMP)
/*
 This is the marketable solution with a properly normalized schema with referential integrity, realistic data,
 and foundation needed for Tasks 11-13. The minimal solution is above.
 */

-- Insert into the four columns, leaving order_item_id to auto-generate
INSERT INTO order_items (order_id, product_id, quantity, price)

-- Select final values: order_id, product_id, random quantity 1-5, and price
SELECT o.order_id, p.product_id, FLOOR(RANDOM() * 5 + 1)::INT, p.price
FROM orders o

-- Join orders to the subquery result, matching on order_id
         JOIN (
    -- Assign each product a random row number within each order
    -- PARTITION BY restarts numbering per order, ORDER BY RANDOM() shuffles products
    SELECT
        order_id,
        product_id,
        price,
        ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY RANDOM()) AS row_num
    FROM (
             -- Generate every possible order-product combination
             SELECT o.order_id, p.product_id, p.price
             FROM orders o
                      CROSS JOIN product p
         ) all_combos
) p ON o.order_id = p.order_id

-- Keep 1-5 randomly numbered products per order
WHERE p.row_num <= FLOOR(RANDOM() * 5 + 1)::INT;

-- Same query to display as in MVP.
SELECT c.customer_id, c.name, p.product_id, p.description
FROM customer c
         JOIN orders o ON c.customer_id = o.customer_id
         JOIN order_items oi ON o.order_id = oi.order_id
         JOIN product p ON oi.product_id = p.product_id
LIMIT 10;


-- Task 11
/*
 Context: IPV4 Location 10.1.1.10
 Task: All products, vendors, and customers at that IPV4 address
 I need to join networknumber, prod_netwrk, product, vendor, order_items, orders, customer
 */

SELECT DISTINCT product.product_name, product.description, vendor.name, customer.name, networknumber.net_number
FROM networknumber
INNER JOIN prod_netwrk ON networknumber.network_id = prod_netwrk.network_id
INNER JOIN product ON prod_netwrk.product_id = product.product_id
INNER JOIN vendor ON product.vendor_id = vendor.vendor_id
INNER JOIN order_items ON product.product_id = order_items.product_id
INNER JOIN orders ON order_items.order_id = orders.order_id
INNER JOIN customer ON orders.customer_id = customer.customer_id
WHERE networknumber.net_number = '10.1.1.10';
-- NOTE: Used SELECT DISTINCT to avoid results multiplication/redundancies.

-- Task 12: Employees Eligible for Special Bonus
/*
 Context: Employees who have:
 1. Sold computer products
    -- Employee > Customer > Orders > Order_Items > Product
 2. Were hired BEFORE 01JAN2000
    -- Within Employee table
 */
-- Employees Eligible for Special Bonus
SELECT DISTINCT employee.name, employee.hire_date, product.product_name AS Product_Type_Sold
FROM employee
JOIN customer ON employee.employee_id = customer.assigned_employee_id
JOIN orders ON customer.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN product ON order_items.product_id = product.product_id
WHERE product.product_name LIKE '%Computer%' AND employee.hire_date < DATE '2000-01-01';

-- Task 13: High-Value Product Analysis
/*
 List the top 5 employee departments that have sold the most products of value >= $127.00
 JOIN LIST: Employee > Customer > Orders > Order_Items > Product
 Explanation: I am showing one row per department, ranked by the total units sold (sum of order_items.quantity)
 where the product price >= 127.00 as a single aggregate column. I am also showing the department itself.
 */
SELECT
    e.department,
    SUM (oi.quantity) AS high_value_products_sold
FROM employee e
JOIN customer c ON e.employee_id = c.assigned_employee_id
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi on o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
WHERE p.price >= 127.00 -- Evaluating only for products of price >= 127.00
GROUP BY e.department --
ORDER BY high_value_products_sold DESC
LIMIT 5;
```