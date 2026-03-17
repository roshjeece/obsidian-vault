# Polymorphism

Polymorphism means "multiple behaviors" — the same method name behaves differently depending on which object is calling it at runtime.

Polymorphism builds directly on [[Inheritance]]. Without a parent-child relationship, there is nothing to dispatch dynamically.

---

## Dynamic Dispatch — Why `Vehicle n = new Hybrid()` outputs as Hybrid

```java
Vehicle n = new Hybrid(); // reference type is Vehicle, object type is Hybrid
n.display();              // outputs: "I am in the hybrid display"
```

The **reference type** (`Vehicle`) is what the compiler sees. The **object type** (`Hybrid`) is what Java uses at runtime to decide which method to call. Java always calls the method on the actual object, not the declared type. This is called **dynamic dispatch**.

Think of it like a rank vs. a person. The rank (reference type) is how you address them. The person (object type) is who actually responds.

---

## Full Example — Three Levels of Inheritance

```java
public class Main {
    public static void main(String[] args) {

        Vehicle v = new Vehicle();  // calls Vehicle.display()
        Car c = new Car();          // calls Car.display()
        Hybrid h = new Hybrid();    // calls Hybrid.display()
        Vehicle n = new Hybrid();   // reference: Vehicle, object: Hybrid → calls Hybrid.display()

        v.display(); // Output: I am in the parent
        c.display(); // Output: in the car display
        h.display(); // Output: I am in the hybrid display
        n.display(); // Output: I am in the hybrid display — dynamic dispatch
    }
}

class Vehicle {
    public void display() {
        System.out.println("I am in the parent");
    }
}

class Car extends Vehicle {
    public void display() {
        System.out.println("in the car display");
    }
}

class Hybrid extends Car {
    public void display() {
        System.out.println("I am in the hybrid display");
    }
}
```

---

## What Happens When You Change the Signature?

If `Hybrid.display()` requires a `String` parameter, it is no longer overriding `display()` — it is overloading it with a different signature. Java resolves `h.display()` by looking for a `display()` with no arguments, finds it in `Car`, and calls that instead.

```java
class Hybrid extends Car {
    public void display(String s) { // OVERLOAD — not an override
        System.out.println("I am in the hybrid display");
    }
}

// h.display() → Output: in the car display
// Java walks UP the hierarchy until it finds a matching signature
```

**Key rule:** Java matches method calls by signature first, then resolves the object type for dispatch.

---

## Overriding vs Overloading — Quick Reference

| | Overriding | Overloading |
|---|---|---|
| Signature | Same | Different |
| Resolved at | Runtime (dynamic) | Compile time (static) |
| Requires inheritance | Yes | No |
| Annotation | `@Override` | None |

---

## Polymorphism in Spring

Spring's dependency injection is built on polymorphism. When you inject a `SoldierRepository` into a service, Spring injects the actual implementation at runtime — you never need to know the concrete class. The reference type is the interface; the object type is Spring's generated proxy.

```java
// Reference type: SoldierRepository (interface)
// Object type: Spring's generated JPA implementation — injected at runtime
private final SoldierRepository soldierRepository;
```

---

## Related
- [[Inheritance]] — polymorphism requires inheritance; overriding requires a parent-child relationship
- [[Conditionals, toString, and CPU Execution]] — if/else and method dispatch share the same sequential execution model
- [[Spring Framework]] — Spring's DI is polymorphism applied at the framework level
- [[Spring JPA Overview - Annotations]] — repository interfaces are polymorphic by design
- [[Introduction to TDD Arrange]] — polymorphic behavior is tested via Mockito mocks
- [[_INDEX - Java Course]] — course overview
