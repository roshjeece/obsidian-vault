**BLUF:** A stack is a LIFO (Last In, First Out) data structure — the last item pushed is the first item popped. Java's legacy `Stack` class is superseded by `ArrayDeque`, which is faster and more flexible. A classic stack use case is validating balanced brackets.

---

## LIFO Concept

**Last In, First Out** — think of a stack of plates. You add to the top and remove from the top. The last plate placed is the first one taken.

| Operation | Description |
|---|---|
| `push(e)` | Add element to the top |
| `pop()` | Remove and return top element |
| `peek()` | View top element without removing |
| `isEmpty()` | Check if stack is empty |

---

## Stack vs. ArrayDeque

| | `Stack` | `ArrayDeque` |
|---|---|---|
| **Status** | Legacy | Preferred |
| **Performance** | Slower — extends `Vector`, which is synchronized | Faster — no synchronization overhead |
| **Use** | Avoid in new code | Use this instead |
```java
// Legacy — avoid
Stack<Character> valStack = new Stack<>();

// Preferred
Deque<Character> valQueue = new ArrayDeque<>();
```

`ArrayDeque` implements the `Deque` interface, which supports both stack (LIFO) and queue (FIFO) operations. When you call `push()` and `pop()` on it, it behaves as a stack.

---

## Classic Stack Problem — Balanced Brackets Validator

Push every opener onto the stack. When a closer is encountered, pop the stack and verify it matches. If the stack is empty at the end, all brackets were balanced.
```java
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {
    public static void main(String[] args) {
        String valid   = "{[(abc)]}";
        String invalid1 = "{[(])}";
        String invalid2 = "{[()";
        String invalid3 = ")(";

        System.out.println(validate(valid)    ? "Balanced." : "Not balanced.");
        System.out.println(validate(invalid1) ? "Balanced." : "Not balanced.");
        System.out.println(validate(invalid2) ? "Balanced." : "Not balanced.");
        System.out.println(validate(invalid3) ? "Balanced." : "Not balanced.");
    }

    // Maps each closer to its expected opener
    static char getExpectedOpener(char closer) {
        if (closer == ')') return '(';
        if (closer == '}') return '{';
        return '[';
    }

    // Returns true if all brackets in the string are balanced
    static boolean validate(String entry) {
        Deque<Character> stack = new ArrayDeque<>();

        for (int i = 0; i < entry.length(); i++) {
            char c = entry.charAt(i);

            if (c == '(' || c == '{' || c == '[') {
                stack.push(c); // push all openers
            } else if (c == ')' || c == '}' || c == ']') {
                if (stack.isEmpty()) return false; // closer with nothing to match
                char top = stack.pop();
                if (top != getExpectedOpener(c)) return false; // mismatched pair
            }
        }

        return stack.isEmpty(); // unmatched openers remaining = unbalanced
    }
}
```

### How It Works

1. Iterate through every character in the string
2. If it's an opener (`(`, `{`, `[`) — push onto the stack
3. If it's a closer (`)`, `}`, `]`) — pop the stack and verify the pair matches
4. If the stack is empty when a closer is encountered — unbalanced
5. If the stack is not empty at the end — unmatched openers remain, unbalanced

---

## Related
- [[Queues]] — FIFO counterpart to the stack; both use nodes and traversal but differ in insertion/removal order
- [[Linked Lists]] — the queue implementation in the companion note uses the same Node structure; stack traversal follows the same pointer mechanics
- [[Arrays]] — ArrayDeque is backed by a resizable array internally; contrast with the linked list queue implementation
- [[Loops]] — bracket validator iterates via a for loop; stack traversal uses a while loop
- [[Exceptions and Error Handling]] — stack operations on an empty structure are a common source of runtime errors worth defending against
- [[Queues]] — FIFO counterpart to the stack; both notes together cover the core linear data structures
