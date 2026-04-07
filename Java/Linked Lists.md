**BLUF:** A linked list is a collection where each element lives in a node that holds both its data and a pointer to the next node. Java's `LinkedList` class handles pointer management automatically. You can also build one manually to understand the underlying mechanics.

---

## Java's Built-In LinkedList
```java
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) {
        LinkedList<String> cars = new LinkedList<>();
        cars.add("Volvo");
        cars.add("BMW");
        cars.add("Ford");
        cars.add("Mazda");
        System.out.println(cars); // [Volvo, BMW, Ford, Mazda]
    }
}
```

- A collection — holds many objects of the same type
- Shares the same core methods as `ArrayList`: `add()`, `set()`, `remove()`, `clear()`

---

## LinkedList vs. ArrayList

| | ArrayList | LinkedList |
|---|---|---|
| **Storage** | Contiguous block in memory | Nodes scattered in memory, connected by pointers |
| **Random access** | Fast — direct index lookup | Slow — must traverse from head |
| **Insert/remove (middle)** | Slow — elements must shift | Fast — only pointers are updated |
| **Insert/remove (ends)** | Fast (end); slow (front) | Fast at both head and tail |

Java reassigns pointers automatically when you add or remove elements — you don't manage the links manually when using the built-in class.

---

## Common Operations
```java
LinkedList<String> cars = new LinkedList<>();
cars.add("Volvo");
cars.add("BMW");
cars.add("Ford");
cars.add("Mazda");
System.out.println(cars); // [Volvo, BMW, Ford, Mazda]

cars.set(2, "TEST");
System.out.println(cars); // [Volvo, BMW, TEST, Mazda]

cars.remove(2);
System.out.println(cars); // [Volvo, BMW, Mazda]
```

![[Pasted image 20260401141933.png]]

---

## Manual Implementation (WIP)

Building a linked list from scratch makes the pointer mechanics visible. Each `Node` holds its data and a reference to the next node. The `LinkedList` class holds only a reference to the `head` node — everything else is reached by traversal.
```java
public class Main {
    public static void main(String[] args) {
        Node a = new Node(1);

        LinkedList list = new LinkedList(a);
        list.addLast(2);  // list: 1 -> 2
        list.addFirst(3); // list: 3 -> 1 -> 2

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
        return "Node{data=" + data + '}';
    }

    public int getData() { return data; }
    public void setData(int data) { this.data = data; }
    public Node getNext() { return next; }
    public void setNext(Node next) { this.next = next; }
}

class LinkedList {
    private Node head;

    public LinkedList(Node head) {
        this.head = head;
    }

    // Points new node to current head, then makes new node the head
    void addFirst(int data) {
        Node new_node = new Node(data);
        new_node.setNext(head);
        head = new_node;
    }
    
    // Removes first node by reassigning the head to the node at index 1
    void removeFirst() {  
    if (head == null) return;  
    head = head.getNext();  
	}

    // Traverses to the last node, then appends
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
    
    // 
    void removeLast() {  
    if (head == null) return;  
    else if (head.getNext() == null) {  
        head = null;  
    }  
    else {  
        Node pointer = head;  
        Node previous = null;  
        while(pointer.getNext() != null) {  
            previous = pointer;  
            pointer = pointer.getNext();  
        }  
        previous.setNext(null);  
    }  
}

    // Traverses from head, prints each node
    void display() {
        if (head == null) return;
        Node tempHead = head;
        while (tempHead != null) {
            System.out.println(tempHead);
            tempHead = tempHead.getNext();
        }
    }
}
```

### How addFirst() works
1. Create a new node
2. Point the new node's `next` to the current `head`
3. Reassign `head` to the new node

### How addLast() works
1. Create a new node
2. If the list is empty, the new node becomes `head`
3. Otherwise, traverse until `getNext() == null` (end of list)
4. Set the last node's `next` to the new node

### How removeFirst() works
1. Checks to see there are any nodes
2. If the list isn't empty, the node at index 1 becomes the new head
3. The original head is dropped

### How removeLast() works
1. Checks if the head is empty
2. Checks if there's only one node
	1. If only one node, removes that node
3. If 2+ nodes, then
4. Create two nodes to traverse with a trailing pointer, then sever the last node

---

## Related
- [[ArrayList]] — shares the same core methods; the key contrast is memory structure and performance tradeoffs
- [[Arrays]] — arrays underpin ArrayList; understanding contiguous memory helps clarify why LinkedList trades access speed for insertion flexibility
- [[Loops]] — traversal in the manual implementation relies on a `while` loop iterating via `getNext()`
- [[Classes, Objects, and Encapsulation]] — the manual implementation is a direct application of class design, encapsulation, and object references
- [[Static Fields, Constructors, and this Keyword]] — `Node` and `LinkedList` constructors and use of `this` follow patterns established here
- [[Recursion]] — linked list traversal has a natural recursive structure; `display()` and search operations are common recursion examples
- [[Stacks and Deques]] — stack-based bracket validator uses the same push/pop/traverse pattern as linked list pointer manipulation
- [[Queues]] — queue implemented as a linked list; same Node structure, different pointer semantics (front/rear vs. head)