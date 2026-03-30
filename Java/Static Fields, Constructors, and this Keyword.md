---

---
Exercise:

write a java program that does the following:

- Create a Student class. It has two attributes: name and GPA
- Create all the setters/getters
- create default and non-default constructors
- This class should have a way to keep the number of objects created out of that class
- Create a demo class
- This class will create three objects of type Students
- You need to accept the data for these objects from the keyboard from the user

My solution

```java
// Main.java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

    Scanner scanner = new Scanner(System.in); // Initiate scanner
    String studentName ; // initiate variables
    double studentGpa ;

    System.out.print("Enter student name: ");
    studentName = scanner.nextLine(); // Reads first student name

    System.out.print("Enter student GPA: ");
    studentGpa = scanner.nextDouble(); // reads first student gpa

        scanner.nextLine();
    Student student1 = new Student(studentName, studentGpa);

    System.out.print("Enter student name: ");
    studentName = scanner.nextLine(); // Reads second name

    System.out.print("Enter student GPA: ");
    studentGpa = scanner.nextDouble(); // reads second gpa

    Student student2 = new Student(studentName, studentGpa);

    System.out.println(student1.getName() + " " + student1.getGpa());
    System.out.println(student2.getName() + " " + student2.getGpa());
    System.out.println(Student.getStudentCount());



    }


}

```

```java
// Student.java
public class Student {

    private String name ;
    private double gpa ;

    // Create a way to count number of students created out of this class
    private static int studentCount = 0;

    public void setName(String n){
        name = n;
    }
    public void setGpa(double g){
        gpa = g;
    }
    public String getName(){
        return name;
    }
    public double getGpa(){
        return gpa;
    }


    //Constructors
    public Student(){
        studentCount++;
        name = "none";
        gpa = 0.0;
    }
    public Student(String n, double g){
        studentCount++;
        name = n;
        gpa = g;
    }
    public Student(String n){
        studentCount++;
        name = n;
        gpa = 0.0;
    }
    public Student(double g){
        studentCount++;
        name = "none";
        gpa = g;
    }
    public static int getStudentCount(){
        return studentCount;
    }
}
```

Organizing Classes

- Place data fields in logical order
    - At the beginning of a class
    - List the fields vertically
- Data fields and methods may be placed in any order within a class

It’s like defining key words before going on to write a paragraph!


Declaring objects and using their methods

- Declaring a class does not create any actual objects
- To create an instance of a class:
    - Supply a type and an identifier
    - Allocate computer memory for the object
    - Use the ‘new’ function

Scope and Lifetime of Variables

- Stack

Explaining (this.)

Same as python self

this is the address of the object that you’re in

Implicit reference to the object who called this function

st1

```java
x // attribute
y // attribute
func1
func2
```

st2

```java
x // attribute
y // attribute
func1
func2
```

st3

```java
x // attribute
y // attribute
func1
func2
```

‘This’ is an address (like the address of st1).

Spend time to understand 

```java
public Student(String n, double g){
	name = n ;
	gpa = g ;
	count = count + 1 ;
}

public Student(double g){
	this("none", g);
}

public Student (String n){
	this(n, 0);
}
```

An Introduction to Using Constructors

- Java default constructor
    - auto filled parameters
    - Requires no arguments
    - Created automatically by Java compiler
    - Numeric values set to 0, etc
- A constructor method:
    - Must have the same name as the class it constructs
- Don’t:
    - Place semicolons where you shouldn’t
    - Don’t think “default constructor” means only the automatically supplied constructor
    - Don’t think that a class’s methods must:
        - Accept its own fields’ values as parameters
        - Return values to its own fields
    - Don’t create a class method that has a parameter with the same something?

Anything between {} is a “block of code”

- Can exist within another block of code

You cannot redeclare a variable


Overloading

- Using one term to indicate diverse meanings
- Writing multiple methods with the same name but with different arguments
- The compiler understands the meaning based on the arguments used with the method call
- It is convenient for reducing the number of method names needed — one name handles multiple input types or argument counts.

Automatic Type Promotion in Method Calls

- If an application contains a method call where the argument type does not exactly match the parameter type, Java automatically promotes the smaller type to the larger compatible type (e.g., int → double) before passing it.

Learning About the ‘this’ Reference

- Instantiating an object from a class
- In Java:
- Reference:
    - Reference to an object
    - Passed to any object’s nonstatic class method
    - A reserved word in Java
- You do not need to use ‘this’ reference in methods you write in most situations


Static Fields

Using AutomaticallyImported, Prewritten Constants and Methods

- Many classes are commonly used across an entire application and are imported automatically by Java (e.g., String, System, Math) without needing an explicit import statement.

Composition

- Relationship between classes when an object of one class data field is within another class
- Called a ‘has-a relationship’

Remember to supply values for a contained object if it has no default constructor

UML is Unified Modeling Language

Class diagrams are helpful for showing relationships

UML — Class Relationships:

- Association
- Inheritance
- Realization
- Dependency
- Aggregation
- Composition

Elegant, simple solution that is achieved by using constructor chaining with this() — delegating from simpler constructors to the most complete one, avoiding duplicated initialization logic. 

## Related
- [[Inheritance]] — constructor chaining and this() are essential for understanding inheritance constructors
- [[Polymorphism]] — static vs non-static context matters when working with polymorphic references
- [[Methods, Overloading, and Classes]] — constructors are a specialized form of method overloading
- [[Abstract Classes and Abstraction]] — abstract classes rely on implicit super() calls and can define constructors; reinforces constructor chaining behavior