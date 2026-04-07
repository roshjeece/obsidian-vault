**BLUF:** A queue is a FIFO (First In, First Out) data structure — the first item added is the first item removed. This note covers a manual linked list queue implementation with enqueue, dequeue, peek, and isEmpty operations.

---

## FIFO Concept

**First In, First Out** — think of a line at a checkout. The first person in line is the first person served. New arrivals join the back; removals happen from the front.

| Operation | Description |
|---|---|
| `enqueue(e)` | Add element to the rear |
| `dequeue()` | Remove and return element from the front |
| `peek()` | View front element without removing |
| `isEmpty()` | Check if queue is empty |

---

## Manual Implementation — Linked List Queue

A queue can be implemented using a linked list with two pointers: `front` (removal end) and `rear` (insertion end). This avoids the need to shift elements on removal, unlike an array-based implementation.

> The `Node` class used here is the same structure as in [[Linked Lists]] — `data` field, `next` pointer, getters/setters, and `toString()`. See that note for the full Node explanation.

### Node Class
```java
class Node {
    private final int data;
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
    public Node getNext() { return next; }
    public void setNext(Node next) { this.next = next; }
}
```

### MyQueueLinkedList Class
```java
public class MyQueueLinkedList {
    private Node front; // removal end
    private Node rear;  // insertion end

    public MyQueueLinkedList() {
        front = null;
        rear = null;
    }

    // Add to rear
    void enqueue(int data) {
        Node new_node = new Node(data);
        if (rear == null) {         // empty queue — both pointers set to new node
            rear = new_node;
            front = new_node;
        } else {
            rear.setNext(new_node); // attach to end
            rear = new_node;        // advance rear pointer
        }
    }

    // Remove from front
    int dequeue() {
        if (front == null) {
            System.out.println("Empty queue.");
            return -1;
        }
        int removed = front.getData();
        front = front.getNext();        // advance front pointer
        if (front == null) rear = null; // queue is now empty — reset rear
        return removed;
    }

    // View front without removing
    public int peek() {
        if (front == null) {
            System.out.println("Empty queue.");
            return -1;
        }
        return front.getData();
    }

    public boolean isEmpty() {
        return front == null;
    }

    // Traverse and print all nodes from front to rear
    void display() {
        if (front == null) return;
        Node tempFront = front;
        while (tempFront != null) {
            System.out.println(tempFront);
            tempFront = tempFront.getNext();
        }
    }
}
```

### Main
```java
public class Main {
    public static void main(String[] args) {
        MyQueueLinkedList list = new MyQueueLinkedList();

        list.enqueue(1);
        list.enqueue(2);
        list.enqueue(3);
        System.out.println("Full list:");
        list.display();
        // Node{data=1}
        // Node{data=2}
        // Node{data=3}

        int removed = list.dequeue();
        System.out.println("Removed: " + removed); // Removed: 1
        list.display();
        // Node{data=2}
        // Node{data=3}

        int peeked = list.peek();
        System.out.println(peeked); // 2

        System.out.println(list.isEmpty()); // false
    }
}
```

---

## Why Two Pointers?

`front` and `rear` are tracked separately so both enqueue and dequeue run in **O(1)** time. If only `front` were tracked, finding the rear on every enqueue would require traversing the entire list — O(n).

---

## Related
- [[Stacks and Deques]] — LIFO counterpart; ArrayDeque supports both stack and queue operations from the same class
- [[Linked Lists]] — queue is implemented as a linked list here; Node structure and traversal pattern are identical
- [[Loops]] — queue traversal in `display()` uses the same while loop pointer pattern as linked list traversal
- [[Sorting Algorithms]] — queues appear in breadth-first search and certain sorting algorithms as the underlying data structure
- [[Arrays]] — array-based queue is an alternative implementation; linked list queue avoids element shifting on dequeue
- [[Stacks and Deques]] — LIFO counterpart; ArrayDeque supports both stack and queue operations from the same class
