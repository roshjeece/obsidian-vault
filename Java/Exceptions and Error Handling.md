
# Exceptions and Error Handling

**BLUF:** Java's exception handling mechanism lets you intercept runtime errors, respond gracefully, and keep the program running — instead of crashing.

---

## try / catch

Wrap risky code in `try`. If an exception is thrown, execution jumps immediately to `catch`. Code after the `try/catch` block continues normally.
```java
public class Main {
    public static void main(String[] args) {
        try {
            int x = 3;
            int y = 0;
            int z = x / y; // throws ArithmeticException
        } catch (Exception e) {
            System.out.print("can't be serious");
        }

        System.out.println("I am still in control");
    }
}
```
Output: `can't be seriousI am still in control`
```java
public class Main {
    public static void main(String[] args) {
        int[] x = {1, 2, 3};
        try {
            System.out.println(x[10]); // throws ArrayIndexOutOfBoundsException
        } catch (Exception e) {
            System.out.println("can't be serious");
        }

        System.out.println("I am still in control");
    }
}
```
Output: `can't be serious` → `I am still in control`

---

## finally

`finally` always executes — whether or not an exception was thrown. Use it for cleanup (closing files, releasing resources).
```java
public class Main {
    public static void main(String[] args) {
        try {
            int[] myNumbers = {1, 2, 3};
            System.out.println(myNumbers[10]);
        } catch (Exception e) {
            System.out.println("Something went wrong.");
        } finally {
            System.out.println("The 'try catch' is finished.");
        }
    }
}
```

---

## Throwing Exceptions

You can manually throw an exception with `throw new ExceptionType("message")`.
```java
// Unhandled — program crashes with stack trace
public class Main {
    public static void main(String[] args) {
        throw new IndexOutOfBoundsException("Just for fun");
    }
}
```
```java
// Handled — caught gracefully
public class Main {
    public static void main(String[] args) {
        try {
            throw new IndexOutOfBoundsException("Just for fun");
        } catch (Exception e) {
            System.out.println(e.getMessage()); // Output: "Just for fun"
        }
    }
}
```

`e.getMessage()` returns the string passed into the exception constructor.
```java
try {
    int z = 3 / 0;
} catch (Exception e) {
    System.out.println(e.getMessage()); // Output: "/ by zero"
}
```

---

## Specifying Exception Types

Catch specific exception types instead of the generic `Exception` parent — better practice, more precise handling.
```java
try {
    int z = 3 / 0;
} catch (ArithmeticException e) {
    System.out.println("Arithmetic exception");
}
```

---

## Multiple Catches

You can chain multiple `catch` blocks. Java executes the **first** matching catch.
```java
try {
    int[] arr = {1, 2, 3};
    System.out.println(arr[10]);   // throws ArrayIndexOutOfBoundsException
    int z = 3 / 0;                  // never reached
} catch (ArithmeticException e) {
    System.out.println("Arithmetic exception");
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Array out of bounds exception"); // this fires
}
```

> **Rule:** Child (more specific) catches must come before parent (more general) catches. If `Exception` is first, it swallows everything and the compiler will flag later catches as unreachable.

---

## Combined Catches

Use `|` to handle multiple exception types with a single catch block.
```java
try {
    int[] arr = {1, 2, 3};
    System.out.println(arr[10]);
    int z = 3 / 0;
} catch (ArithmeticException | ArrayIndexOutOfBoundsException e) {
    System.out.println("Combined exception");
} catch (Exception e) {
    System.out.println("Parent Exception"); // fallback
}
```

---

## NullPointerException

Thrown when you call a method on a `null` reference.
```java
String s = null;
try {
    if (s.equals("gfg")) // NPE thrown here
        System.out.print("Same");
} catch (NullPointerException e) {
    System.out.print("NullPointerException Caught");
}
```

---

## Exceptions vs. Errors

| | Exceptions | Errors |
|---|---|---|
| **Handleable?** | Generally yes | Generally no |
| **Examples** | `NullPointerException`, `ArithmeticException` | `OutOfMemoryError`, `StackOverflowError` |
| **Checked?** | Can be checked or unchecked | Unchecked |

- **Checked exceptions** — compiler forces you to handle them (e.g., `IOException`)
- **Unchecked exceptions** — runtime only, compiler doesn't require handling (e.g., `NullPointerException`, `ArithmeticException`)

Reference: [Java Exceptions Hierarchy](https://rollbar.com/blog/java-exceptions-hierarchy-explained/)

![[Pasted image 20260317150705.png]]

---

## Catching Hierarchy (Call Stack Propagation)

If a method doesn't catch an exception, it propagates up the call stack to the caller. The first `catch` that matches handles it.
```java
public class Main {
    public static void main(String[] args) {
        try {
            func1();
        } catch (Exception e) {
            System.out.println("catch it parent"); // not reached
        }
    }

    public static void func1() {
        try {
            func2();
        } catch (Exception e) {
            System.out.println("by func1"); // this fires — func1 catches it first
        }
    }

    public static void func2() {
        int z = 3 / 0; // throws ArithmeticException, no catch here
    }
}
```
Output: `by func1`

---

## Custom Exceptions

Extend `Exception` to create your own exception type. Call `super(message)` to pass the message up to the parent constructor.
```java
public class Main {
    public static void main(String[] args) throws MyException {
        throw new MyException("This is my exception");
    }

    public static class MyException extends Exception {
        public MyException(String message) {
            super(message);
        }
    }
}
```
Output: `Exception in thread "main" Main$MyException: This is my exception`

> Note: `throws MyException` in the method signature tells the compiler this method may throw a checked exception — required when you don't handle it locally.

---

## Related
- [[File IO in Java]] — File operations throw checked exceptions (e.g., `IOException`) that must be handled with try/catch or declared with `throws`
- [[Methods, Overloading, and Classes]] — Methods declare `throws` in their signature when they propagate checked exceptions to the caller
- [[Inheritance]] — Exception class hierarchy follows standard Java inheritance; child exceptions must be caught before parent exceptions
- [[Polymorphism]] — Catching `Exception` works because all exceptions are subclasses; understanding polymorphism explains why parent catches can swallow child types
- [[Arrays]] — `ArrayIndexOutOfBoundsException` and `NullPointerException` are common array-related exceptions demonstrated in this note
- [[Introduction to TDD Arrange]] — TDD practice includes writing tests that assert exceptions are thrown under expected error conditions
- [[Static Fields, Constructors, and this Keyword]] — Custom exception constructors use `super()` to call the parent `Exception` constructor, same pattern as any class constructor chain