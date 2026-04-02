---

---
# Methods and Overloading

**BLUF:** Methods are named, reusable blocks of code that accept inputs, execute logic, and optionally return a value. Overloading lets you define multiple methods with the same name as long as their parameter signatures differ.

---

## Method Structure
```java
public static void display(String message) {
    System.out.println(message);
}
```

| Part | Meaning |
|---|---|
| `public` | Accessible from anywhere |
| `private` | Accessible only within the same class |
| `static` | Belongs to the class, not an object instance |
| `void` | Returns no value |
| `display` | Method name |
| `String message` | Parameter — typed variable that receives the argument |

- **Method header** = declaration (name, return type, parameters)
- **Method body** = implementation (the logic inside the braces)
- **Implementation hiding** — the caller only needs to know what the method does, not how. This is encapsulation applied to methods.

---

## Calling a Method
```java
public class Main {
    public static void main(String[] args) {
        int x = 10;
        System.out.println(x);

        display("This is message 1");
        System.out.println("I am back!");
        display("This is message 2");
    }

    private static void display(String message) {
        System.out.println(message);
    }
}
```

Output:
```
10
This is message 1
I am back!
This is message 2
```

---

## Parameters vs. Arguments

- **Parameter** — the named variable in the method signature that receives a value: `sum(int a, int b)` — `a` and `b` are parameters
- **Argument** — the actual value passed when calling the method: `sum(x, y)` — `x` and `y` are arguments

---

## Local Variables and Scope

A variable declared inside a method is a **local variable** — it only exists within that method and is destroyed when the method returns. It does not affect variables of the same name outside:
```java
public class Main {
    public static void main(String[] args) {
        int x = 10;
        func1();
        System.out.println(x); // still 10 — x inside func1 is a different variable
    }

    private static void func1() {
        int x = 20; // local to func1, invisible outside
    }
}
```

---

## Passing Values
```java
public class Main {
    public static void main(String[] args) {
        int x = 10;
        int y = 20;
        sum(x, y);
    }

    private static void sum(int a, int b) {
        int c = a + b;
        System.out.println(c); // 30
    }
}
```

---

## Return Values

Declare the return type in the method header. Use `return` to send a value back to the caller:
```java
public class Main {
    public static void main(String[] args) {
        int x = 10;
        int y = 20;
        int z = sum(x, y); // z receives the returned value
        System.out.println(z); // 30
    }

    private static int sum(int a, int b) {
        int c = a + b;
        return c;
    }
}
```

> **Unreachable code:** Any statement after a `return` inside the same block will not execute and will cause a compile error.
```java
private static int sum(int a, int b) {
    return a + b;
    int x = 10; // COMPILE ERROR — unreachable
}
```

---

## Overloading

Overloading lets you define multiple methods with the same name, differentiated by their **parameter signature** (number and types of parameters). The compiler selects the correct version at compile time:
```java
public class Main {
    public static void main(String[] args) {
        sum(10, 20);    // calls sum(int, int)
        sum(10.0, 20.0); // calls sum(double, double)
        sum(40);        // calls sum(int)
    }

    private static void sum(int a, int b) {
        System.out.println(a + b); // 30
    }

    private static void sum(double a, double b) {
        System.out.println(a + b); // 30.0
    }

    private static void sum(int c) {
        System.out.println(c); // 40
    }
}
```

> The compiler will error if two methods have identical names and parameter types — it cannot distinguish between them.

---

## Related
- [[Classes, Objects, and Encapsulation]] — methods live inside classes; class structure, fields, and access modifiers are prerequisite context
- [[Static Fields, Constructors, and this Keyword]] — static vs. nonstatic methods determine whether a method belongs to the class or an object instance
- [[Generics]] — generics are the type-safe alternative to overloading the same method for different data types
- [[Inheritance]] — overriding in subclasses follows similar rules to overloading but operates at runtime instead of compile time
- [[Interfaces]] — interface method signatures define contracts using the same header structure covered here
- [[Recursion]] — recursive methods call themselves; understanding method call mechanics is prerequisite