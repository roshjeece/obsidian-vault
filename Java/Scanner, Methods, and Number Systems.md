---

---
**Review:**

- Everything must exist in objects
- Must be a Main.java, this must match the public class Main
- You must have the main function: public class void main
- Layout:

File: Main.java

```java
public class Main {
	public static void main(String[] args){
	....
	}
}
```

As a public class, Main will be capitalized

Study the above again, understand the different components of opening the main class and main function.

Magic Numbers: if you’re defining anything besides -1, 0, 1, and 2, do it like this:

```java
final int DAYS = 7 ; // MAKE THE VAR NAME ALL CAPS
```

Scope: where the variable is defined (just within its curly braces — defined down, not up)

```java
int x = 3 ;
{
	int y = 4 ;
	// x will print here
	// y will print here
}
// x will print here
// y will NOT print here
```

Mixing strings with numbers will concatenate

```java
int x = 3 ;
int y = 4 ;
System.out.println(x + y); // Output: 7
System.out.println(x + " " + y); // Output: 3 4
```

Boolean Conditions

```java
boolean condition = true ;

// //

System.out.println(4 > 3); // Output: true

// //

boolean x = 4 > 3 ;

System.out.println(x); // Output: true
```

Char

```java
char a = 'b' ; // This is a character. Primitive type.
String b = "c" ; // String is a class. Learn this more??? 
```

Ref: ASCII table

New Line

```java
System.out.println("Hello\nWorld!"); //Output: Hello
																		 //        World!
```

Tab

```java
System.out.println("Hello\tWorld!"); //Output: Hello	World!
```

Backspace

```java
System.out.println("Hello\bWorld!"); //Output: HellWorld!
```

Keyboard Input

```java
int x ;
Scanner abc = new Scanner(System.in); // 'abc' is a new Scanner object
// Scanner(System.in) allows you to read from the keyboard
// Scanner is defining the function

// Scanner abc : "A student is coming!" -- Declaration
// = new Scanner(System.in) : this brings the student to life! Committing it to memory
// Scanner is a class!

int x; // variable
Scanner abc // object
```

Keyboard Input Example:

```java
int x ;
Scanner abc = new Scanner(System.in);

System.out.println("Enter a number: ");
x = abc.nextInt(); // Input: 30
int y = abc.nextInt(); // Input: 40
// Alternative! Input: 30 40 will produce same output. It is looking for nextInt twice. 30 was the first integer it found. 40 was the next integer it found.
// Return and space are both ignored, Java is looking for that next integer!

System.out.println(x);
System.out.println(y);
// Output: 30
//         40
```

Unexpected Entries

```java
int x ;
Scanner abc = new Scanner(System.in);

System.out.print("Enter a number: "); // Input: "hello"
x = abc.nextInt();
```

Output: ERROR


```java
        double x ;
        Scanner abc = new Scanner(System.in);

        System.out.print("Enter a number: ");
        x = abc.nextDouble();
```

```java
        Scanner abc = new Scanner(System.in);

        System.out.print("Enter an address: ");
        String address ;
        address = abc.nextLine();

        System.out.println(address);
```

Utilizing Scanner and taking on Int, Double, and a String!

```java
import java.util.Scanner; // This has to be here to use Scanner

public class Main {
    public static void main(String[] args) {

        int x ;
        double y ;
        String z ;

        Scanner xyz = new Scanner(System.in);

        System.out.println("Enter an integer: ");
        x = xyz.nextInt(); xyz.nextLine(); // \n is created when I hit enter. nextLine consumes it.
        System.out.println("Enter a double: ");
        y = xyz.nextDouble(); // \n is created when I hit enter.

        // You must consume the leftover newline character before using nextLine because Java thinks I've already entered an empty line
        xyz.nextLine();

        System.out.println("Enter a string: ");
        z = xyz.nextLine();

        System.out.println(x + " " + y + " " + z);

    }
}
```

Integer Division

```java
        int x = 5 ;
        int y = 4 ;

        int z = x / y ; // Integer division. How many times does top go into bottom?

        int w = x % y ; // This creates the remainder.

        System.out.println(z);
        System.out.println(w);
```

```java
        int x = 3 ;
        int y = 4 ;

        double z = x/y ; // This will not work. Why?
        
        System.out.println(z);
```

Integer Promotion

```java
        double x = 3.0 ;
        int y = 4 ; // Gets promoted to double.

        double z = x/y ; // This will not work. Why?

        System.out.println(z);
```

Remainder / Divisible by 2:

```java
        int x = 5 ;
        System.out.println(x%2);
```

PEMDAS

```java
        System.out.println(10+4*3/2-12/3); // PEMDAS
// Output: 12
```

Java Math Errors: Never use equality with floating point. DO NOT:

```java
        double x = 10.0 ;
        double y = 3.0 ;
        
        double z = x / y ;
        
        double w = z * 3.0 ;
        System.out.println(w); // Never use equality with a floating point.
        // We know this should be 9.9999999999, but it will output 10.
```

NUMBERING SYSTEM — Break from Java, understand how computers read numbers

$$
18 = 8 * 10^0 + 1*10^1
$$

Binary:

$$
1011 = 1*2^0 + 1*2^1 + 0*2^2 + 1*2^3
$$

(1011 = 11 in decimal

Octal

$$
010 = 10 = 0*8^0 + 1*8^1
$$

(010 = 8 in decimal)

Binary, Octal, Decimal, and Hexadecimal are the base-systems natively recognized in Java.

REMINDER:

I am an object.

I am an instance of a class.

An object is a tangible, concrete instance of a class.



METHODS

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;

        System.out.println(x);

        display(); // Invokes the display method
        System.out.println("I am back!");

    }
    public static void display(){ // Always make these names as verbs
        // This defines the method and names it "display"
        System.out.println("I am in display");
        func1();// Action of the display method
    }
    public static void func1(){
        System.out.println("I am in func1");
    }

}

```

Output:

```java
10
I am in display
I am in func1
I am back!
```

- Method
    - A program module
    - Contains a series of statements
    - Carries out a task
- Execute a method
    - Invoke or call from another method
- Calling method (client method)
    - Makes a method call
- Called method
    - Invoked by calling a method
- A method is a function

## Related
- [[Conditionals and Switch Statements]] — boolean conditions and if/else build on Scanner input examples
- [[Loops]] — Scanner is used extensively in loop exercises
- [[Variables, Data Types, and Scope]] — data types and casting covered here apply to Scanner input
- [[Methods, Overloading, and Classes]] — methods introduced in this note are extended next
