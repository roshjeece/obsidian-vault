## Data Abstraction
- The process of hiding certain details and showing only essential information to the user
- Can be accomplished with either **abstract classes or interfaces**

## Abstract Class
- Key Note: You cannot create an object of the abstract class directly. To access the class, it must be inherited from another class.

### Valid Example
```java
// Abstract class
abstract class Animal {
  // Abstract method (does not have a body)
  public abstract void animalSound();
  // Regular method
  public void sleep() {
    System.out.println("Zzz");
  }
}

// Subclass (inherit from Animal)
class Pig extends Animal {
  public void animalSound() {
    // The body of animalSound() is provided here
    System.out.println("The pig says: wee wee");
  }
}

class Main {
  public static void main(String[] args) {
    Pig myPig = new Pig(); // Create a Pig object
    myPig.animalSound();
    myPig.sleep();
  }
}
```

## Another Example
```java
public class Main {  
    public static void main(String[] args) {  
        Base b = new Child();  
        Child c = new Child();  
        b.func1();  
        c.func1();  
    }  
}  
  
abstract class Base {  
    public void func1(){  
        System.out.println("hello");  
    }  
}  
  
class Child extends Base {  
  
}
```

## What Won't Work
```java
public class Main {  
    public static void main(String[] args) {  
        Base b = new Base();  // WILL NOT WORK
        b.func1();  
    }  
}  
  
abstract class Base {  
    public void func1(){  
        System.out.println("hello");  
    }  
}  
  
class Child extends Base {  
  
}
```


## Inheriting Methods
```java
public class Main {  
    public static void main(String[] args) {  
        Animal dog = new Dog();  
        dog.sound();  
    }  
}  
  
  
abstract class Animal {  
  
    abstract public void sound();  
}  
  
class Dog extends Animal {  
  
    public void sound(){  
        System.out.println("bark");  
    }  
  
}
```

## Abstract Classes Can Extend Other Abstract Classes
```java
public class Main {  
    public static void main(String[] args) {  
        Animal dog = new WildDog();  
        dog.sound();  
    }  
}  
  
  
abstract class Animal {  
  
    abstract public void sound();  
}  
  
abstract class Dog extends Animal {  
  
    public void sound(){  
        System.out.println("bark");  
    }  
  
}  
  
class WildDog extends Dog {  
  
    public void sound() {  
  
    }}
```

## ... can have Constructors
```java
public class Main {  
    public static void main(String[] args) {  
        Vehicle v = new SUV();  
    }  
}  
  
  
abstract class Vehicle {  
    private int model;  
    private int vin;  
  
    public Vehicle () {  
        System.out.println("Constructor of the base");  
    }  
}  
  
class SUV extends Vehicle {  
  
}
```


---
## Inheriting Abstract Methods
- A class must be abstract if it inherits abstract methods it doesn't fully implement:

### Valid:
```java
public class Main {  
    public static void main(String[] args) {  
  
    }}  
  
  
abstract class Base {  
    abstract public void func1();  
    abstract public void func2();  
    abstract public void func3();  
}  
  
abstract class Child extends Base {  
  
    public void func1(){  
  
    }}  
  
class GrandChild extends Child {  
    public void func2(){  
  
    }  
    public void func3(){  
  
    }}
```

### Invalid:
```java
public class Main {  
    public static void main(String[] args) {  
  
    }}  
  
  
abstract class Base {  
    abstract public void func1();  
    abstract public void func2();  
    abstract public void func3();  
}  
  
abstract class Child extends Base {  
  
    public void func1(){  
  
    }}  
  
class GrandChild extends Child {  
    public void func2(){  
  
    }    }
```

To achieve a valid result, all inherited methods must be implemented. The lowest child class can only be non-abstract if it, along with all its parent classes, implements all the methods defined in the highest parent class


Abstraction:
- Identifies essential details
- Disregards non-essential information
- **Does not** break the problem down into smaller tasks

Abstract method:
- A method without a body that is declared with the reserved word **abstract**

Abstract Classes:
- if we derive an abstract class and do not implement all the abstract methods, then the derived class should also be marked as abstract using 'abstract' keyword
- Abstract classes can have constructors
- A class can be made abstract without any abstract method
- A class **cannot** inherit from multiple abstract classes
- Abstract classes are NOT used to create objects
- Abstract classes are design to only act as a base class to be inherited by other classes
- You don't actually need to implement the abstract methods if you never create a class that isn't abstract

Behavior:
- super() is implicitly inserted from the parent within the child
- super() always calls the no-arg parent instructor
- object type ( = new B(3) ) drives execution
- Reference type ( A c = ) does not drive execution, this just has to be proper (i.e. cannot be of a child class relative to the object type)