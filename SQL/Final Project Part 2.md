---

---
```mermaid
erDiagram
    LOCATIONS {
        int LocationID PK
        varchar City
        varchar State
    }

    PATRONS {
        int PatronID PK
        date DateOfBirth
        varchar Gender
        int LocationID FK
    }

    BOOKS {
        int BookID PK
        varchar Title
        varchar Author
        varchar Genre
        varchar ISBN
        int Quantity
    }

    CHECKOUTS {
        int CheckoutID PK
        int PatronID FK
        int BookID FK
        date DateBorrowed
        date ReturnDate
    }

    LOCATIONS ||--o{ PATRONS : "resides in"
    PATRONS ||--o{ CHECKOUTS : "borrows"
    BOOKS ||--o{ CHECKOUTS : "checked out in"
```
## Related
- [[SQL Day 6.md]] — normalization principles applied in this ERD
- [[SQL - Foundations, Datatypes, and ERD]] — ERD concept introduced here
- [[SQL - Keys, Relationships, and Constraints]] — primary and foreign key relationships shown in this diagram
- [[Final Project Part 1 Code Space]] — Part 1 and Part 2 are companion projects
- [[SQL Course]] — course overview