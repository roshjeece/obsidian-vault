---

---
Review:

```java
public class Main {
    public static void main(String[] args) {

        Vehicle v = new Vehicle();
        Car c = new Car();
        Hybrid h = new Hybrid();
        Vehicle n = new Hybrid(); // This will output as hybrid

        h.display();
    }

}

class Vehicle {
    public void display(){
        System.out.println("I am in the parent");
    }
}

class Car extends Vehicle {

    public void display(){
        System.out.println("in the car display");
    }
}

class Hybrid extends Car {
    public void display() {
        System.out.println("I am in the hybrid display");
    }
}
```

Polymorphism is “multiple behaviors”

- Same method (name wise) that will behave differently based on the object that is calling it

Say you make a requirement for hybrid to have a String, and then you call `h.display()`. What will happen?

```java
public class Main {
    public static void main(String[] args) {

        Vehicle v = new Vehicle();
        Car c = new Car();
        Hybrid h = new Hybrid();
        Vehicle n = new Hybrid(); // This will output as hybrid

        h.display();
    }

}

class Vehicle {
    public void display(){
        System.out.println("I am in the parent");
    }
}

class Car extends Vehicle {

    public void display(){
        System.out.println("in the car display");
    }
}

class Hybrid extends Car {
    public void display(String s) {
        System.out.println("I am in the hybrid display");
    }
}
```

**Output: from Car! Defaults to parent that matches signature requirement**

## Related
- [[Inheritance]] — polymorphism depends on inheritance; upcasting requires a parent-child relationship
- [[Java Course]] — course overview
- [[Spring JPA Overview - Annotations]] — Spring uses polymorphism extensively in its repository interfaces
