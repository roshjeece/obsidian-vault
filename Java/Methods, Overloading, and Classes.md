---

---
Objects, Methods, Classes

- Main() method executes automatically
- Other methods are called as needed

Header of Function:

```java
public static void display(){
// public means anyone can access it, as opposed to private (only within class)
// static means belongs to a class rather than an object instance
// void means it's not return any value
// display is the name of the method
```

- Method header is also declaration
- Method body is implementation

Invoking? Is it called that?

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;

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

```java
10
This is message 1
I am back!
This is message 2
```

---

Private Method Not Passing Data

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        
        func1();
        System.out.println(x);

    }
    private static void func1() {

        int x = 20 ;
    }
}
```

Output: 10

---

Arguments:

- Data items you use in a call to a method

Parameters:
- Named variables in the method signature that receive the argument values
- Defined in the method header: `private static void sum(int a, int b)`
- `a` and `b` are parameters

Implementation hiding:
- The internal logic of a method is hidden from the caller
- The caller only needs to know what the method does, not how it does it
- This is encapsulation applied to methods

Local Variable:
- A variable declared inside a method
- Only accessible within that method — not visible outside it
- Destroyed when the method returns


Passing Values

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        int y = 20 ;

        sum(x,y);

    }
    private static void sum(int a, int b) { // Name of method, value/type param

        int c = a + b ;
        System.out.println(c);
    }
}
```

Output: 30

Method “signature” needs to be different. This is combination of name of method, value, and parameter types. This is called OVERLOADING the function.

OVERLOADING

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        int y = 20 ;
        int z = 40 ;
        double a = 10.0 ;
        double b = 20.0 ;
        
        sum(x,y);
        sum(a,b);
        sum(z);

    }
    private static void sum(int a, int b) {

        int c = a + b ;
        System.out.println(c);
    }

    private static void sum(int c) { // Need to have unique signature.
        System.out.println(c);
    }

    private static void sum(double a, double b){
        System.out.println(a+b);
    }
}
```

Output: 30, 30.0, 40

- The compiler will be confused if you are passing identical values and parameter types between two methods of the same name.

Review data “promotion”

---

RETURN

```java
public class Main {
    public static void main(String[] args) {

        int x = 10 ;
        int y = 20 ;
        int z = sum(x,y); // 1. x,y --> sum
        // 4. z given returned int
        System.out.println(z);

    }
    private static int sum(int a, int b){ // 2. promise to return int
        int c ;
        c = a + b ;
        return c ; // 3. int returned
    }
}
```

UNREACHABLE CODE

```java
private static int sum(int a, int b){
		int c ;
		c = a + b ;
		return c ;
		
		int x ; // Unreachable code due to return.
		x = 10 ;
```

A char is written like: ‘3’

A String is written like: “3”



---

New Class - Employee.java

```java
public class Employee {

	private String name ;
	
	private double salary ;
```

Why is it important to make all of these private?

Setters and Getters - Template

```java
public class Employee {


    private String name ;

    private double salary ;
    
    public void setName(String n){
        name = n ;
    }
    
    public void setSalary(double s){
        salary = s ;
    }
    public String getName(){
        return name ;
    }
    public double getSalary(){
        return salary ;
    }
}

```

Constructor Method

```java
Employee emp2 = new Employee();
emp2.setName("Joshua Reece");
emp2.setSalary(1000);
System.out.println(emp2.getName() + " " + emp2.getSalary());
```

Utilize debugging tool!!! Learn how to do this in IntelliJ to step through each step of code

Creating new class and overloading, then returning default vs custom parameters:

```java
// Main.java

public class Main {
    public static void main(String[] args) {

        Employee emp1 = new Employee("John-117", 67420.69);

        System.out.println(emp1.getName() + " " + emp1.getSalary());

        Employee emp2 = new Employee();

        System.out.println(emp2.getName() + " " + emp2.getSalary());

    }

}
```

```java
// Employee.java

public class Employee {


    private String name ;

    private double salary ;

    public Employee(String n , double s){

        setName(n) ;
        setSalary(s) ;
    }

    public Employee(){
        name = "none" ;
        salary = 0 ;
    }

    public void setName(String n){
        name = n ;
    }

    public void setSalary(double s){
        salary = s ;
    }
    public String getName(){
        return name ;
    }
    public double getSalary(){
        return salary ;
    }
}

```

Output:

John-117, 67420.69

none 0.0

Constructors: Default, constructors with only one paramater, and both parameters

```java
// Main.Java
public class Main {
    public static void main(String[] args) {

        Employee emp1 = new Employee("John-117", 67420.69);
        System.out.println(emp1.getName() + " " + emp1.getSalary());

        Employee emp2 = new Employee();
        System.out.println(emp2.getName() + " " + emp2.getSalary());

        Employee emp3 = new Employee("NameOverload");
        System.out.println(emp3.getName() + " " + emp3.getSalary());

        Employee emp4 = new Employee(123456.78);
        System.out.println(emp4.getName() + " " + emp4.getSalary());
    }

}

```

```java
// Employee.java
public class Employee { // This is a class I have created
    
    private String name ;
    private double salary ;
    // These are its attributes I am defining

    // Setters and Getters
    public void setName(String n){
        name = n ;
    }
    public void setSalary(double s){
        salary = s ;
    }
    public String getName(){
        return name ;
    }
    public double getSalary(){
        return salary ;
    }

    // Constructors
    public Employee(){ // Default constructor
        name = "none" ;
        salary = 0 ;
    }
    public Employee(String n , double s){ // Constructor, name and salary

        setName(n) ;
        setSalary(s) ;
    }

    public Employee(String n){ // Constructor, only name
        setName(n) ;
        setSalary(0) ;
    }

    public Employee(double s){ // Constructor, only salary
        setName("none");
        setSalary(s);
    }

}
```


Terms to understand:

- Data fields
- Mutator methods
- Accessor methods
- Nonstatic methods (”belong to objects”)
- 

you cannot call a nonstatic method unless you associate it with an object

if it’s a static method, you can always call it

Try to understand this more

You can call display 

Establishing the ACC? Static.

Now everything is within the ACC.

Submit an assignment? Nonstatic. Must belong to something else. Understand this

“Static” is confusing: “Non-static field 'name_of_field' cannot be referenced from a static context”

Field being a data field


If you make “name” static, it belongs to the class. Name, essentially, becomes the “global” variable — class level variable.

It’s a private class level variable.



All of [Employee.java](http://employee.java/) is a class.

Me calling Employee emp1 = new Employee() is the object
