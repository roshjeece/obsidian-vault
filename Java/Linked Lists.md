
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

---
### Manual Creation of Linked Lists (WIP)

```Java
public class Main {  
    public static void main(String[] args) {  
  
        Node a = new Node(1);  
  
        LinkedList list = new LinkedList(a);  
        list.addLast(2);  
        list.addFirst(3);  
  
        list.display();  
  
    }  
}  
  
class Node {  
    private int data;  
    private Node next;  
  
    public Node(int data) {  
        this.data = data;  
        this.next = null;  
    }  
  
    @Override  
    public String toString() {  
        return "Node{" +  
                "data=" + data +  
                '}';  
    }  
  
    public int getData() {  
        return data;  
    }  
  
    public void setData(int data) {  
        this.data = data;  
    }  
  
    public Node getNext() {  
        return next;  
    }  
  
    public void setNext(Node next) {  
        this.next = next;  
    }  
}  
  
class LinkedList {  
    private Node head;  
  
    public LinkedList(Node head) {  
        this.head = head;  
    }  
  
    void addFirst(int data) {  
        Node new_node = new Node(data);  
        new_node.setNext(head);  
        head = new_node;  
    }  
  
    void addLast(int data) {  
        Node new_node = new Node(data);  
  
        if (head == null) {  
            head = new_node;  
        } else {  
            Node last = head;  
            while (last.getNext() != null) {  
                last = last.getNext();  
            }  
  
            last.setNext(new_node);  
        }  
    }  
  
    void display() {  
        if(head == null) return;  
  
        Node tempHead = head;  
        while (tempHead != null) {  
            System.out.println(tempHead);  
            tempHead = tempHead.getNext();  
        }  
    }  
}
```