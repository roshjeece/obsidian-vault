# Encapsulation

Encapsulation is one of the three pillars of OOP alongside [[Inheritance]] and [[Polymorphism]]. It means bundling data (fields) and the methods that operate on that data together inside a class, and restricting direct access to the internal state from outside.

---

## The Core Idea

Don't let outside code reach into an object and change its data directly. Force all access through controlled methods (getters and setters). This protects data integrity and hides implementation details.

```java
// BAD — direct field access, no protection
public class Employee {
    public String name;
    public double salary;
}

// Somewhere else in the codebase:
emp.salary = -50000; // nothing stops this

// GOOD — encapsulated
public class Employee {
    private String name;
    private double salary;

    public double getSalary() { return salary; }

    public void setSalary(double s) {
        if (s < 0) throw new IllegalArgumentException("Salary cannot be negative");
        salary = s;
    }
}
```

---

## Why It Matters

- **Data integrity** — validation logic in setters prevents invalid state
- **Flexibility** — internal implementation can change without breaking callers
- **Testability** — controlled access makes behavior easier to mock and test
- **Readability** — callers don't need to know how data is stored, only how to access it

---

## Access Modifiers Quick Reference

| Modifier | Same Class | Same Package | Subclass | Everywhere |
|---|---|---|---|---|
| `public` | ✓ | ✓ | ✓ | ✓ |
| `protected` | ✓ | ✓ | ✓ | ✗ |
| *(none)* | ✓ | ✓ | ✗ | ✗ |
| `private` | ✓ | ✗ | ✗ | ✗ |

**Standard pattern:** fields are `private`, getters/setters are `public`.

---

## Encapsulation in Spring

Spring enforces encapsulation at the architecture level. The Controller doesn't reach into the Repository directly — it goes through the Service. Each layer only exposes what the layer above needs to know.

```
Controller → Service → Repository → Database
```

Each layer is encapsulated. The Controller has no idea how data is stored.

---

## Related
- [[Classes, Objects, and Encapsulation]] — encapsulation introduced alongside classes and objects
- [[Inheritance]] — access modifiers control what subclasses can see
- [[Polymorphism]] — encapsulation enables safe polymorphic substitution
- [[Spring Framework]] — Spring's layered architecture is encapsulation at the system level
- [[Introduction to TDD Arrange]] — encapsulated classes are easier to unit test
- [[INDEX - Java Course]] — course overview
