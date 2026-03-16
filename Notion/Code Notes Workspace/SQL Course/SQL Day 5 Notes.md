---
notion-id: 2fc4a3bf-1151-809b-a029-dd6b8114f411
---
```sql
CREATE TABLE customer (
	cID SERIAL PRIMARY KEY,
	fName VARCHAR(20),
	lName VARHCAR(20),
	dob DATE NOT NULL,
	license VARCHAR(16),
	phone_number VARCHAR(10),
	email VARCHAR(255)
```

I am a CUSTOMER.

I want to make an ORDER.

To make that ORDER I will place items in a CART.

That CART is filled from the INVENTORY.


Full Liquor Store Database Creation Code:

```sql
CREATE DATABASE liquor_store;

-- Select Schema

CREATE TABLE location (
    location_id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip VARCHAR(10)
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    dob DATE NOT NULL,
    license VARCHAR(16) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(10),
    location_id INT, -- Alt: location_ID INT REFERENCES location(location_id)
    FOREIGN KEY (location_id) REFERENCES location(location_id)
    -- FOREIGN KEY call only necessary for composite keys
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    upc VARCHAR(16),
    brand VARCHAR(255),
    mfg varchar(255),
    distributor VARCHAR(255),
    quantity INT,
    cost float
);

CREATE TABLE order_ (
    order_id SERIAL PRIMARY KEY,
    customer_id INT, -- Alt: customer_iid INT REFERENCES customer(customer_id)
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    -- FOREIGN KEY call only necessary for composite keys
    order_date DATE
);

CREATE TABLE order_items (
    order_items_id SERIAL PRIMARY KEY,
    order_id INT, -- Alt: order_id INT REFERENCES order_(order_id)
    product_id INT, -- Alt: product_id INT REFERENCES product(product_id)
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES order_(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
		-- FOREIGN KEY call only necessary for composite keys
);
```

