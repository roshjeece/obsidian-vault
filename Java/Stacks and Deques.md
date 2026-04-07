FIFO Concep
- First In, First Out

Stacks and Deques are similiar
- Stacks are legacy
- Deques are better

###### Implementation of a Stack/ArrayDeque that works with either
- Classic Stack Problem
- Building a balanced brackets validator

```Java
import java.util.ArrayDeque;  
import java.util.Deque;  
import java.util.Stack;  
  
public class Main {  
    public static void main(String[] args) {  
  
        String valid = "{[(abc)]}";  
        String invalid1 = "{[(])}";  
        String invalid2 = "{[()";  
        String invalid3 = ")(";  
  
        System.out.println(validate(valid) ? "Balanced." : "Not balanced.");  
  
    }  
  
    // Handle all openers in one method  
    static char getExpectedOpener(char closer) {  
        if (closer == ')') return '(';  
        if (closer == '}') return '{';  
        return '[';  
    }  
  
    // separate logic from output, main will handle printing  
    static boolean validate(String entry) {  
        // Legacy Implementation: Stack<Character> valStack = new Stack<>();  
        Deque<Character> valQueue = new ArrayDeque<>();  
  
        // iterating through each character in the string  
        for (int i = 0; i < entry.length(); i++) {  
            char c = entry.charAt(i);  
            // pushing all the different openers to the queue  
            if (c == '(' || c == '{' || c == '[') {  
                valQueue.push(c);  
            } else if (c == ')' || c == '}' || c == ']') {  
                // if there is nothing left in the queue to match, it's unbalanced  
                if (valQueue.isEmpty()) {  
                    return false;  
                }  
                char checked = valQueue.pop();  
                if (checked != getExpectedOpener(c)) {  
                    // if it's the opener and closer don't match, it's unbalanced  
                    return false;  
                }  
            }  
  
        }  
        // if all matched and the queue is now empty, it's balanced  
        return valQueue.isEmpty();  
    }  
}
```

---

### Linked List via Queue

###### MyQueueLinkedList Class:
```Java
public class MyQueueLinkedList {  
  
    private Node front;  
  
    private Node rear;  
  
    public MyQueueLinkedList() {  
        front = null;  
        rear = null;  
    }  
  
    // enqueue  
    void enqueue(int data) {  
        Node new_node = new Node(data);  
        if (rear == null) {  
            rear = new_node;  
            front = new_node;  
        } else {  
            rear.setNext(new_node);  
            rear = new_node;  
        }  
    }  
  
    // dequeue  
    int dequeue() {  
        if (front == null) {  
            System.out.println("Empty queue.");  
            return -1;  
        } else {  
            int removed = front.getData();  
            front = front.getNext();  
            if (front == null) rear = null;  
            return removed;  
        }  
    }  
  
    // peek  
    public int peek() {  
        if (front == null) {  
            System.out.println("Empty queue.");  
            return -1;  
        }  
  
        return front.getData();  
    }  
  
    // isEmpty  
    public boolean isEmpty() {  
        return front == null;  
    }  
  
  
    // display  
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

###### Node Class
```Java
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

##### Main Class
```Java
public class Main {  
    public static void main(String[] args) {  
  
  
        MyQueueLinkedList list = new MyQueueLinkedList();  
  
        list.enqueue(1);  
        list.enqueue(2);  
        list.enqueue(3);  
        System.out.println("Full list: ");  
        list.display();  
  
        int removed = list.dequeue();  
        list.display();  
        System.out.println("Removed: " + removed);  
  
        int peeked = list.peek();  
        System.out.println(peeked);  
  
        boolean emptyCheck = list.isEmpty();  
        System.out.println(emptyCheck);  
  
    }  
}
```