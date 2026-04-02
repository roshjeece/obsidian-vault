# Interfaces

**BLUF:** An interface is a contract — it defines methods a class must implement without providing the implementation. Unlike abstract classes, a class can implement multiple interfaces, making interfaces Java's primary tool for achieving multiple inheritance of behavior.

---

## Interface vs. Abstract Class

| | Abstract Class | Interface |
|---|---|---|
| **Purpose** | Share common behavior among related classes | Define a contract any unrelated class can fulfill |
| **Multiple inheritance** | No — a class can only extend one | Yes — a class can implement many |
| **Method bodies** | Can have concrete and abstract methods | Abstract by default; `default` and `static` methods allowed |
| **Fields** | Any access modifier, any mutability | Implicitly `public static final` (constants only) |
| **Use when** | Classes share an is-a relationship | Classes share a can-do capability |

---

## Basic Syntax
```java
interface Animal {
    public void animalSound(); // implicitly public and abstract
    public void run();
}
```

All methods in an interface are implicitly `public abstract` unless marked `default` or `static`. You don't need to write `abstract` explicitly.

---

## Implementing an Interface

A class uses `implements` to fulfill an interface contract. It must provide a body for every abstract method:
```java
interface Animal {
    public void animalSound();
    public void run();
}

class Dog implements Animal {
    public void animalSound() {
        System.out.println("bark");
    }
    public void run() {
        System.out.println("running");
    }
}
```

---

## Extending a Class and Implementing an Interface Simultaneously

A class can do both — `extends` comes before `implements`:
```java
class Numbers extends ABC implements Math {
    public void add() {}
    public void sub() {}
    public void mul() {}
    public void div() {}
}

class ABC {
    private int a;
}
```

---

## Interface Fields — Constants

Fields declared in an interface are implicitly `public static final`. They are constants, not instance variables, and are accessed via the interface name:
```java
interface Math {
    int a = 10; // equivalent to: public static final int a = 10
}

// Access
System.out.println(Math.a); // 10
```

---

## default Methods

`default` methods have a body and are inherited by implementing classes without requiring an override. They were introduced in Java 8 to allow interfaces to evolve without breaking existing implementations:
```java
interface Math {
    default void func1() {
        func2(); // can call other interface methods
    }
}
```

---

## static Methods

Interface `static` methods belong to the interface itself, not to implementing classes. Called via the interface name:
```java
interface Math {
    public static void func2() {
        System.out.println("hello");
    }
}

// Access
Math.func2(); // hello
```

---

## Full Activity Example
```java
public class Interfaces {
    public static void main(String[] args) {
        Math.func2();              // calls static method directly on interface
        System.out.println(Math.a); // accesses interface constant
    }
}

interface Math {
    int a = 10; // public static final

    public void add();
    public void sub();
    public void mul();
    public void div();

    default void func1() {
        func2();
    }

    public static void func2() {
        System.out.println("hello");
    }
}

class ABC {
    private int a;
}

class Numbers extends ABC implements Math {
    public void add() {}
    public void sub() {}
    public void mul() {}
    public void div() {}
}
```

---

## Related
- [[Abstract Classes and Abstraction]] — interfaces and abstract classes are both abstraction mechanisms; the table above captures the key tradeoffs
- [[Inheritance]] — `implements` follows the same contract enforcement logic as `extends`; a class must fulfill the full interface contract the same way a subclass must implement all abstract methods
- [[Polymorphism]] — a reference of an interface type can point to any implementing class, enabling the same runtime polymorphism as abstract class references
- [[Generics]] — `Comparable<T>` is an interface; bounded type parameters (`<T extends Comparable<T>>`) require understanding how interfaces work
- [[Methods and Overloading]] — `default` and `static` interface methods follow the same method declaration rules covered here
- [[Classes, Objects, and Encapsulation]] — interface constants (`public static final`) contrast with instance fields; understanding field access modifiers clarifies why `Math.a` works



