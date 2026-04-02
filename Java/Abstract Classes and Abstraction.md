**BLUF:** Abstraction hides implementation details and exposes only what's necessary. Abstract classes define a contract — methods that subclasses *must* implement — while still allowing shared concrete behavior. You cannot instantiate an abstract class directly; it exists to be inherited.

---

## Data Abstraction

- The process of hiding certain details and showing only essential information to the user
- Accomplished with either **abstract classes** or **interfaces**
- Identifies essential details and disregards non-essential information
- Does **not** break a problem into smaller tasks — that's decomposition

---

## Abstract Class Basics

- Declared with the `abstract` keyword
- Cannot be instantiated directly — must be subclassed
- Can contain both abstract methods (no body) and regular methods (with body)
- Can have constructors
- A class can be abstract without containing any abstract methods
- A class **cannot** inherit from multiple abstract classes

**Abstract method:** A method with no body, declared with `abstract`. The subclass is responsible for providing the implementation.

### Basic Example
```java
abstract class Animal {
    public abstract void animalSound(); // no body — subclass must implement
    public void sleep() {
        System.out.println("Zzz"); // concrete method — inherited as-is
    }
}

class Pig extends Animal {
    public void animalSound() {
        System.out.println("The pig says: wee wee");
    }
}

class Main {
    public static void main(String[] args) {
        Pig myPig = new Pig();
        myPig.animalSound();
        myPig.sleep();
    }
}
```

### What Won't Work
```java
abstract class Base {
    public void func1() {
        System.out.println("hello");
    }
}

class Main {
    public static void main(String[] args) {
        Base b = new Base(); // COMPILE ERROR — cannot instantiate abstract class
    }
}
```

### What Will Work

A reference type can be abstract as long as the object type is concrete:
```java
abstract class Base {
    public void func1() {
        System.out.println("hello");
    }
}

class Child extends Base {}

class Main {
    public static void main(String[] args) {
        Base b = new Child(); // valid — object type is concrete
        b.func1();
    }
}
```

> **Reference type vs. object type:** The reference type (`Base b`) determines what methods are accessible at compile time. The object type (`new Child()`) drives which implementation executes at runtime.

---

## Inheriting Methods

Subclasses inherit concrete methods automatically. Abstract methods must be implemented:
```java
abstract class Animal {
    abstract public void sound();
}

class Dog extends Animal {
    public void sound() {
        System.out.println("bark");
    }
}

class Main {
    public static void main(String[] args) {
        Animal dog = new Dog();
        dog.sound(); // Output: bark
    }
}
```

---

## Abstract Classes Can Extend Other Abstract Classes

An abstract class can extend another abstract class without implementing its abstract methods — the first concrete subclass must fulfill the full contract:
```java
abstract class Animal {
    abstract public void sound();
}

abstract class Dog extends Animal {
    public void sound() {
        System.out.println("bark");
    }
}

class WildDog extends Dog {
    public void sound() {
        // overrides Dog's implementation
    }
}

class Main {
    public static void main(String[] args) {
        Animal dog = new WildDog();
        dog.sound();
    }
}
```

---

## Constructors in Abstract Classes

Abstract classes can have constructors. When a subclass is instantiated, the abstract parent's constructor runs via the implicit `super()` call:
```java
abstract class Vehicle {
    private int model;
    private int vin;

    public Vehicle() {
        System.out.println("Constructor of the base"); // runs when SUV is created
    }
}

class SUV extends Vehicle {}

class Main {
    public static void main(String[] args) {
        Vehicle v = new SUV(); // Output: Constructor of the base
    }
}
```

---

## Inheriting Abstract Methods — The Contract Rule

**Rule:** A class must be declared `abstract` if it inherits abstract methods it does not fully implement. The first non-abstract class in the chain must have all abstract methods implemented — either by itself or by its abstract ancestors.

### Valid — contract fulfilled across the chain
```java
abstract class Base {
    abstract public void func1();
    abstract public void func2();
    abstract public void func3();
}

abstract class Child extends Base {
    public void func1() {} // implements func1
    // func2, func3 still abstract
}

class GrandChild extends Child {
    public void func2() {} // implements func2
    public void func3() {} // implements func3
    // GrandChild is concrete — all methods accounted for
}
```

### Valid — chain extended further
```java
abstract class Child extends Base {
    public void func1() {}
}

abstract class GrandChild extends Child {
    public void func2() {}
}

class GreatGrandChild extends GrandChild {
    public void func3() {} // final method implemented — can now be concrete
}
```

### Invalid — concrete class with unimplemented abstract methods
```java
abstract class Child extends Base {
    public void func1() {}
}

class GrandChild extends Child { // COMPILE ERROR — func2 and func3 not implemented
    public void func2() {}
    // func3 missing
}
```

---

## super() Behavior in Abstract Class Chains

- `super()` is implicitly inserted at the top of a child constructor if not explicitly written
- `super()` always calls the **no-arg** parent constructor unless specified otherwise
- **Object type** (`= new Child()`) drives which implementation executes at runtime
- **Reference type** (`Base b =`) determines compile-time accessibility — must be a parent or the same type as the object, never a child type relative to the object

---

## Related
- [[Inheritance]] — abstract classes use `extends` and follow the same inheritance chain rules; abstract method resolution depends on understanding inheritance hierarchy
- [[Polymorphism]] — abstract classes enable polymorphism; a reference of the abstract parent type can point to any concrete subclass
- [[Classes, Objects, and Encapsulation]] — abstract classes are a specialized form of class; base class structure is prerequisite context
- [[Encapsulation]] — abstraction and encapsulation are complementary OOP pillars; both control what is exposed to the user
- [[Static Fields, Constructors, and this Keyword]] — abstract classes can have constructors; implicit super() behavior in abstract chains connects to constructor chaining mechanics
- [[Exceptions and Error Handling]] — abstract method signatures and throws declarations both define contracts without providing implementation
- [[Interfaces]] — the other abstraction mechanism in Java; the interface vs. abstract class tradeoff is a core design decision