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

## Array-Based Circular Queue

A queue can also be implemented using a fixed-size array. The challenge with a naive array queue is that `dequeue()` leaves empty slots at the front that can't be reused without shifting every element. A **circular queue** solves this with modulo arithmetic — when a pointer reaches the end of the array, it wraps back to index 0.

### Key Fields

| Field | Purpose |
|---|---|
| `queueArray` | The fixed-size backing array |
| `front` | Index of the next element to dequeue |
| `rear` | Index where the next element will be enqueued |
| `size` | Current number of elements |
| `capacity` | Maximum number of elements |

`front` and `rear` start at 0 and advance independently using `(pointer + 1) % capacity` to wrap around.

### Implementation

```java
public class QueueArray {
    private int[] queueArray;
    private int front;
    private int rear;
    private int size;
    private int capacity;

    public QueueArray(int capacity) {
        size = 0;
        this.capacity = capacity;
        queueArray = new int[capacity];
        this.front = 0;
        this.rear = 0;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public boolean isFull() {
        return size == capacity;
    }

    // Add to rear, then advance rear with wrap-around
    public void enqueue(int data) {
        if (isFull()) {
            System.out.println("Queue is full.");
            return;
        }
        queueArray[rear] = data;
        rear = (rear + 1) % capacity; // wrap rear back to 0 when it hits capacity
        size++;
    }

    // View front without removing
    public int peek() {
        if (isEmpty()) {
            System.out.println("Empty queue");
            return -1;
        }
        return queueArray[front];
    }

    // Remove from front, then advance front with wrap-around
    public int dequeue() {
        if (isEmpty()) {
            System.out.println("Empty queue");
            return -1;
        }
        int data = queueArray[front];
        front = (front + 1) % capacity; // same wrap-around logic as enqueue
        size--;
        return data;
    }

    // Traverse size elements starting from front, wrapping as needed
    public void display() {
        if (isEmpty()) return;
        int temp = front;
        for (int i = 0; i < size; i++) {
            System.out.println(queueArray[temp]);
            temp = (temp + 1) % capacity;
        }
        System.out.println("-----");
    }
}
```

### The Wrap-Around Mechanic

```java
rear = (rear + 1) % capacity;
```

When `rear` reaches the end of the array, `% capacity` resets it to 0 — reusing slots freed by previous dequeues. Without this, the rear pointer would eventually run off the end of the array even if space exists at the front.

Example with capacity 4:

| Step | Action | front | rear | Contents |
|---|---|---|---|---|
| Start | — | 0 | 0 | `[ _, _, _, _ ]` |
| enqueue(1) | — | 0 | 1 | `[ 1, _, _, _ ]` |
| enqueue(2) | — | 0 | 2 | `[ 1, 2, _, _ ]` |
| dequeue() | returns 1 | 1 | 2 | `[ _, 2, _, _ ]` |
| enqueue(3) | — | 1 | 3 | `[ _, 2, 3, _ ]` |
| enqueue(4) | — | 1 | 0 | `[ _, 2, 3, 4 ]` |
| enqueue(5) | rear wraps to 0 | 1 | 1 | `[ 5, 2, 3, 4 ]` |

### Linked List Queue vs. Circular Array Queue

| | Linked List Queue | Circular Array Queue |
|---|---|---|
| **Capacity** | Unbounded | Fixed at construction |
| **Memory** | Allocates per node | Pre-allocates full array |
| **Wrap-around** | Not needed | Required — modulo arithmetic |
| **Overhead** | Node objects + pointers | None beyond the array |
| **Use when** | Size is unknown | Size is known and bounded |

---

## Related
- [[Stacks and Deques]] — LIFO counterpart; ArrayDeque supports both stack and queue operations from the same class
- [[Linked Lists]] — queue is implemented as a linked list here; Node structure and traversal pattern are identical
- [[Loops]] — queue traversal in `display()` uses the same while loop pointer pattern as linked list traversal
- [[Sorting Algorithms]] — queues appear in breadth-first search and certain sorting algorithms as the underlying data structure
- [[Arrays]] — the circular queue uses a fixed-size array as its backing structure; modulo arithmetic replaces pointer traversal for wrap-around
- [[Stacks and Deques]] — LIFO counterpart; ArrayDeque supports both stack and queue operations from the same class
