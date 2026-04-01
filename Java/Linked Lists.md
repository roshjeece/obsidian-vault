
###### Basic Linked List
```Java
import java.util.LinkedList;  
  
public class Main {  
    public static void main(String[] args) {  
        LinkedList<String> cars = new LinkedList<>();  
        cars.add("Volvo");  
        cars.add("BMW");  
        cars.add("Ford");  
        cars.add("Mazda");  
        System.out.println(cars);  
    }  
}
```

This is a **collection**
- can contain many objects of the **same type**
- same methods as ArrayList
	- add, change, remove, clear

What's the difference between this and an ArrayList?
- Stores elements in containers
- Each container has a link to the next container in the list

![[Pasted image 20260401141933.png]]

Behaviors of Java
- Java will reassign pointers automatically when you remove or add elements in the middle of the linked list

```Java
import java.util.LinkedList;  
  
public class Main {  
    public static void main(String[] args) {  
        LinkedList<String> cars = new LinkedList<>();  
        cars.add("Volvo");  
        cars.add("BMW");  
        cars.add("Ford");  
        cars.add("Mazda");  
        System.out.println(cars);  
  
        cars.set(2, "TEST");  
        System.out.println(cars);  
  
        cars.remove(2);  
        System.out.println(cars);  
  
    }  
}
```

Output:
```bash
[Volvo, BMW, Ford, Mazda]
[Volvo, BMW, TEST, Mazda]
[Volvo, BMW, Mazda]
```

\