---

---
**BLUF:** A class is a blueprint; an object is a specific instance of that blueprint. Encapsulation protects an object's internal state by hiding fields behind private access and exposing controlled access through public methods.

---

## OOP vs. Procedural Programming

Traditional procedural programming executes instructions in sequence. OOP organizes code around objects that combine state and behavior. The three pillars of OOP:

- **Encapsulation** — bundling data and methods, restricting direct access to internal state
- **Inheritance** — deriving new classes from existing ones
- **Polymorphism** — one interface, multiple implementations

OOP was historically adopted for two application types: computer simulations and GUIs.

---

## Core Vocabulary

| Term | Definition |
|---|---|
| **Class** | A blueprint describing objects with common properties |
| **Object** | A specific, concrete instance of a class |
| **Attribute / Field** | A characteristic that defines an object; its value is the object's state |
| **Method** | A block of code that carries out an action on or for an object |
| **Encapsulation** | Hiding internal state; exposing behavior through controlled methods |

---

## Class Structure
```java
public class Employee {
    // Fields (attributes) — private to enforce encapsulation
    private String name;
    private double salary;

    // Getters (accessor methods) — read field values
    public String getName() { return name; }
    public double getSalary() { return salary; }

    // Setters (mutator methods) — modify field values
    public void setName(String n) { name = n; }
    public void setSalary(double s) { salary = s; }
}
```

**Why private fields?** If fields were public, any class could read or write them directly — no validation, no control. Private fields force all access through getters and setters, where you can enforce rules (e.g., reject negative salaries).

---

## Constructors

A constructor initializes a new object. It has the same name as the class and no return type. Constructors can be overloaded:
```java
public class Employee {
    private String name;
    private double salary;

    public Employee() {                          // default constructor
        name = "none";
        salary = 0;
    }

    public Employee(String n, double s) {        // name and salary
        setName(n);
        setSalary(s);
    }

    public Employee(String n) {                  // name only
        setName(n);
        setSalary(0);
    }

    public Employee(double s) {                  // salary only
        setName("none");
        setSalary(s);
    }

    public void setName(String n) { name = n; }
    public void setSalary(double s) { salary = s; }
    public String getName() { return name; }
    public double getSalary() { return salary; }
}
```
```java
// Main.java
public class Main {
    public static void main(String[] args) {
        Employee emp1 = new Employee("John-117", 67420.69);
        System.out.println(emp1.getName() + " " + emp1.getSalary()); // John-117 67420.69

        Employee emp2 = new Employee();
        System.out.println(emp2.getName() + " " + emp2.getSalary()); // none 0.0

        Employee emp3 = new Employee("NameOverload");
        System.out.println(emp3.getName() + " " + emp3.getSalary()); // NameOverload 0.0

        Employee emp4 = new Employee(123456.78);
        System.out.println(emp4.getName() + " " + emp4.getSalary()); // none 123456.78
    }
}
```

---

## Static vs. Nonstatic

| | Static | Nonstatic |
|---|---|---|
| **Belongs to** | The class itself | A specific object instance |
| **Called via** | Class name or directly | Must be called on an object |
| **Use case** | Utility methods, shared state | Object behavior, instance data |
```java
// Static — callable without an object
public static void display(String message) {
    System.out.println(message);
}
display("hello"); // valid anywhere in the class

// Nonstatic — requires an object
public void printName() {
    System.out.println(name);
}
Employee emp = new Employee();
emp.printName(); // must call on an instance
```

> **Common error:** `Non-static field 'name' cannot be referenced from a static context` — you're trying to access an instance field from a static method. Static methods don't have a `this` reference, so they can't see instance fields.

---

## Java Basics Reference

| Concept | Note |
|---|---|
| File name | Must match the public class name exactly |
| Statements | End with a semicolon |
| Case sensitivity | Java is case sensitive — `Name` and `name` are different |
| Variable naming | Start with lowercase; use camelCase |
| Identifiers | Letters, digits, `_`, `$` only; no reserved keywords |
| Casing convention | Classes use UpperCamelCase; variables/methods use lowerCamelCase |
| JVM | Java compiles to bytecode, runs on the Java Virtual Machine — not directly on hardware |

---

## Related
- [[Methods and Overloading]] — methods and constructors build directly on class structure; overloaded constructors follow the same rules as overloaded methods
- [[Static Fields, Constructors, and this Keyword]] — extends this note with static fields, this keyword, and constructor chaining patterns
- [[Encapsulation]] — dedicated note on encapsulation principles; this note introduces the concept, that note goes deeper
- [[Inheritance]] — inheritance builds on the class/object model established here
- [[Polymorphism]] — polymorphism requires understanding of classes and objects first
- [[Abstract Classes and Abstraction]] — abstract classes are a specialized form of class; builds directly on this note
- [[Interfaces]] — interfaces define class contracts; understanding class structure is prerequisite
- [[Introduction to TDD Arrange]] — encapsulation affects how classes are structured for testability
- [[Programming Fundamentals and OOP Introduction]] — establishes the procedural vs. OOP framing that motivates class-based design