---

---
---

**Example 1 — Basic Inheritance**

```java
public class Main {
    public static void main (String[] args) {
        Car c = new Car();
        c.func1();
    }
}

class Vehicle { // Superclass (Parent class)

    public void func1(){
        System.out.print("func1 in Vehicle");
    }
}

class Car extends Vehicle { // Subclass (Child class) — inherits all members from the superclass

}
```

---

**Example 2 — Overloading (NOT overwriting)**

```java
public class Main {
    public static void main (String[] args) {
        Car c = new Car();
        c.func1(); // No int argument passed — resolves to Vehicle's func1()
    }
}

class Vehicle { // Superclass

    public void func1(){
        System.out.print("func1 in Vehicle");
    }
}

class Car extends Vehicle { // Subclass

    public void func1(int x){
        System.out.print("func1 from car"); // OVERLOAD — different signature, both methods exist
    }
}
```

> `func1()` and `func1(int x)` are two separate methods. This is **method overloading**, not overriding. The parent's `func1()` is still accessible.

---

**Example 3 — Overloaded version called**

```java
public class Main {
    public static void main (String[] args) {
        Car c = new Car();
        c.func1(10); // int argument passed — resolves to Car's func1(int x)
    }
}

class Vehicle { // Superclass

    public void func1(){
        System.out.print("func1 in Vehicle");
    }
}

class Car extends Vehicle { // Subclass

    public void func1(int x){
        System.out.print("func1 from car"); // OVERLOAD — called when int argument is provided
    }
}
```

---

**Example 4 — Polymorphism / Upcasting**

```java
public class Main {
    public static void main (String[] args) {
        Vehicle c = new Car(); // Upcasting — reference type is superclass, object type is subclass
        c.func1(); // Calls Car's func1() — runtime (dynamic) dispatch
    }
}

class Vehicle { // Superclass

    public void func1(){
        System.out.print("func1 in Vehicle");
    }
}

class Car extends Vehicle { // Subclass

    public void func1(){
        System.out.print("func1 from car"); // Method OVERRIDE — same signature, replaces superclass version
    }
}
```

> This is **polymorphism**. The variable `c` is declared as type `Vehicle`, but the actual object at runtime is a `Car`. Java uses **dynamic dispatch** to call `Car`'s version of `func1()`. Your analogy holds: *"An ASF student IS-A ACC student"* — the subclass satisfies the superclass type.

---

**Key terms to lock in:**

| Your original wording | Correct term |
| --- | --- |
| "overwrites" | **overrides** (same signature) or **overloads** (different signature) |
| "Child Priority (Overload)" | **Method Overloading** — both methods coexist, resolved by signature |
| "instantiate a child to a parent" | **Upcasting** / **Polymorphism** |
| "parent priority" | Still **inheritance** — parent method is simply inherited and called |

Key Note: using “protected,” not private, in the parent class to make it so only the child classes can see it:

```java
public class Main {
    public static void main (String[] args) {
        Vehicle c = new Car();
        c.func1();
    }
}

class Vehicle { // Superclass

    protected void func1(){ // accessible to subclasses AND any class in the same package — not exclusively to Car
        System.out.print("func1 in Vehicle");
    }
}

class Car extends Vehicle { // Subclass

    public void func1(){
        System.out.print("func1 from car"); // OVERRIDES Vehicle's func1()
    }
}
```

“final” makes it so that no one can inherit that class

Java does not allow multiple inheritance

Multi-sub class:

```java
public class Main {
    public static void main (String[] args) {
        Car c = new Hybrid();
    }
}

class Vehicle { // Parent class or Superclass

    public Vehicle(){
        System.out.println("in vehicle");
    }

}

class Car extends Vehicle{ // Child class or Subclass, inherits all from the parent class

    public Car(){
        System.out.println("in the car");
    }
}

class Hybrid extends Car{

    public Hybrid(){
        System.out.println("in hybrid");
    }
}
// Output: in vehicle | in the car | in hybrid
```

instanceof:

```java
public class Main {
    public static void main (String[] args) {
        Vehicle v = new Vehicle();
        Car c = new Car();
        Hybrid h = new Hybrid();

        System.out.println(v instanceof Vehicle);
        System.out.println(v instanceof Hybrid);

    }
}

class Vehicle { // Parent class or Superclass


}

class Car extends Vehicle{ // Child class or Subclass, inherits all from the parent class


}

class Hybrid extends Car{


}

// Output: true
// Output: false
```

## Related
- [[Polymorphism]] — method overriding and upcasting build directly on inheritance
- [[Java Course]] — course overview
- [[Spring Framework]] — Spring beans use inheritance and interface implementation patterns
---

## Access Modifiers

| Modifier | Same Class | Same Package | Subclass | Everywhere |
|---|---|---|---|---|
| `public` | ✓ | ✓ | ✓ | ✓ |
| `protected` | ✓ | ✓ | ✓ | ✗ |
| *(none)* | ✓ | ✓ | ✗ | ✗ |
| `private` | ✓ | ✗ | ✗ | ✗ |

**Common pattern:** make fields `private`, expose them via `public` getters/setters. Use `protected` when a subclass needs direct access to a parent field without a getter.
