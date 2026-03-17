---

---
- Day started with review quizzes

Code > Generate > Choose what you want constructed > Auto generates those elements of your code you need

‘address’ keyword may cause confusion when called

```java
        Address address = new Address("123", "avery ranch", "TX", "78717", "Austin");

        //System.out.println(address.getStreetNumber() + " " + address.getStreetName() + " ");

        System.out.print(address); // Memory location of Address object
```

Output will be: Address@5f184fc6


Must add a toString method to prevent this from happening (do this in the [Address.java](http://address.java/) class)

toString makes object not address, but a string


UML Diagrams are essential for explaining between software engineers the ideas and concepts you’re trying to create.

This wraps up the basics of classes and objects

toString()’s default behavior prints the object’s class and hex position in memory. You override it through the toString method


**Sequential Execution**

Executing in order based on conditional statements:

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        if (x > 5){ // When this condition is true, this whole block of code will execute. This is the body of the "if"
            System.out.println("hello");
            System.out.println("another hello");
        }

        System.out.print("world");
    }

}
```

If it was x < 5, if would be bypassed and only “world” would execute

You can skip curly braces after if statement if you only have one “sentence”:

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        if (x > 5)
            System.out.println("hello");

        System.out.print("world");
    }

}
```

Output: hello world

Another example:

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        if (x < 5)
            System.out.println("hello");
            System.out.println("another hello");

        System.out.print("world");
    }

}
```

Output: another hello world

Empty statements are statements!

```java
; // This is a statement, even though it's empty!
```

All statements end at the semi colon:

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        if (x < 5) ;
        System.out.println("hello world");

    }

}
```

Output: hello world

The if statement ends at the semicolon and does not affect the print statement

If/else statements:

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        if (x < 5)
            System.out.print("hello");
        else
            System.out.print("world");

    }

}
```

Output: world

Another example I wrote, trying to test for what grade a certain score receives:

```java
public class Main {
    public static void main(String[] args) {

        int x = 82 ;

        // write a code that will accept a number and return a grade

        if (x >= 90)
            System.out.println("A");
        else if (x >= 80)
            System.out.println("B");
        else if (x >= 70)
            System.out.println("C");
        else if (x >= 60)
            System.out.println("D");
        else
            System.out.println("F");

    }

}
```

Instruction Cycle—FDREW

FETCH

DECODE

READ

EXECUTE

WRITE BACK

This gets complicated with waterfall execution. For example, what if you're executing a function where x is changing while simultaneously reading the value of x? Will you read the old or new value?

The CPU uses prediction to solve these problems.

What is CPU prediction?

**CPU prediction** (also called branch prediction) is a technique where the processor attempts to guess which path of execution a program will take before it's known for certain, allowing it to speculatively execute instructions ahead of time to avoid pipeline stalls and maintain performance during conditional operations.
