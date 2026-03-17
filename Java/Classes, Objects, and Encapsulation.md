---

---
**Comparing Procedural and Object-Oriented Programming Concepts**

- OOP was used most frequently for two major types of applications
    - Computer simulations
    - GUIs
- OOP differs from traditional procedural programming
    - Polymorphism
    - Inheritance
    - Encapsulation

Understanding Classes, Objects, and Encapsulation

- Class
    - Describes objects with common properties
    - A definition
    - An instance
- Attributes
    - Characteristics that define an object
    - Differentiate objects of the same class
    - The value of attributes is an object’s state
- Objects
    - Specific, concrete instances of a class
- Method
    - A self-contained block of program code that carries out an action
    - Similar to a procedure
- Encapsulation

Features of the Java Programming Language

- Java
    - Developed by Sun Microsystems
    - An object-oriented language
    - General-purpose
    - Advantages
        - Security features
        - Architecturally neutral
    - Can be run on a wide variety of computers
    - Does not execute instructions on the computer directly
    - Runs on a hypothetical computer known as a Java Virtual Machine (JVM)
- Source Code
- Development environment
    - A set of tools used to write programs
- Bytecode


**ENTERING INTELLIJ JAVA WORKSPACE**

Tips:

- Variable names should start with lowercase letters, not capital

```java
public class Main { // Main CLASS. Any public class has to live in a file with the same name.
	
	public static void main(String[] args) { // Main FUNCTION. Must be public to be seen by the OS.
	
	
		int variableName = 1 ; // Semi-colon must be at the end of these statements
		int days_of_the_week = 2 ; // use lowercase letters at beginning of var names
		x = x + 1; /* Don't say obvious things like "incrementing by one." It's more
		useful to say things like "pointing to the next iterm in the array."*/
		
		int y = 1; //declaration and initializing
		
		int z // declaring
		z = 1 // and assigning 
		
		    /* this is a multi
        line comment
         */
	}
}
```

Understanding the First Class

- Requirements for identifiers
    - Can only contain letters, digits, underscores, dollar signs
    - Cannot be a Java reserved keyword
    - Cannot be true, false, or null
- Upper Camel casing (Pascal casing)
    - Each word of an identifier begins with uppercase
- Access specifier

Understand aspects of the first class (public class Main)

Understand aspects of the main Method (pubic static void main)

Indent Style

- Use whitespace to organize code
- For every opening curly brace you need a closing curly brace

Compile from IntelliJ as an IDE

Don’t Do It!

- File’s name must match public class name
- Don’t confuse these terms:
    - parentheses, braces, brackets, curly braces, square brackets, and angle brackets
- Always end block comments
- Java is case sensitive
- End every statement with a semicolon
- Recompile when making changes
- Compiler errors, don’t panic
- Don’t assume program is perfect when all compiler errors are eliminated

## Related
- [[Programming Fundamentals and OOP Introduction]] — procedural vs OOP context that precedes this note
- [[Methods, Overloading, and Classes]] — methods and constructors build directly on class fundamentals
- [[Static Fields, Constructors, and this Keyword]] — extends encapsulation with static fields and constructor patterns
- [[Inheritance]] — inheritance builds on the class/object model established here
- [[Polymorphism]] — polymorphism requires understanding of classes and objects first
- [[Introduction to TDD Arrange]] — encapsulation affects how classes are structured for testability
- [[Java Course]] — course overview
