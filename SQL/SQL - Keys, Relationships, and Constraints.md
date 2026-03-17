---

---
Key Terms:

- Unique Key:
    - Whenever I need to use something for control
- Relational database
    - digital system that **organizes data into structured tables**
- Table
    - where data is organized, made up of **rows and columns**
- Column
    - attribute/field within table (vertical)
- Row
    - unique record (tuple) within table (horizontal)
- Cell
    - Intersection of a single row and single column within a table
    - Smallest unit of data
- Primary key
    - specific column in a database table that uniquely identifies each record
    - no two rows can have the same primary key value
    - cannot be NULL
    - should be immutable (shouldn’t ever change)
    - ex: VINs
- Composite primary key
    - primary key that consists of 2+ columns to uniquely identify single record
    - appropriate when no single unique field is enough to ensure a unique record (common names, dates, etc)
    - common for many-to-many relationships
- Non-primary key (unique key)
    - similar to primary key, but less constraints
    - while there can only be one primary key, you can have multiple unique keys for a given table (Username, Email, Phone #)
    - Primary keys can’t be null, unique keys can be null
    - Not generally used for linking tables, more used as a safety net
- Index
    - Like a book’s table of contents, it guides queries through pointers directly to the data that you need
- Foreign Key
    - A column in one table that references the primary key of another table, creating a link between related data across tables
- Referential integrity
- One-to-one relationship
- One-to-many relationship
- Many-to-many relationship

Database system: organization of components that define and regulate the collection, storage, management, and use of data within a database environment

- Hardware
- Software
- People
- Procedures
- Data


![[image.png|ONE TO MANY]]

**Basic SQL Operations**

- SELECT
- INSERT
- UPDATE
- DELETE


## Related
- [[SQL - Foundations, Datatypes, and ERD]] — foundational concepts
- [[SQL Course]] — course overview
- [[SQL - Basic Queries and SQL Commands]] — applies keys and relationships in SELECT queries
- [[Final Project Part 1 Code Space]] — foreign keys and referential integrity applied in project
- [[Spring JPA Overview - Annotations]] — @Entity and @Id map directly to primary keys