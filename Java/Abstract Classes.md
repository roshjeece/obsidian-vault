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