**BLUF:** A Binary Search Tree (BST) is a binary tree where every node's left subtree contains only smaller values and its right subtree contains only larger values. This ordering enables O(log n) insertion and search by eliminating half the tree at each comparison.

---

## BST Ordering Rule

At every node, the decision is binary:
- Value **less than** current node → go **left**
- Value **greater than** current node → go **right**
- Value **equal** → duplicate, ignore (no insert)

This rule applies recursively at every level of the tree.

---

## BST Class Structure

The BST class holds only one field — a reference to the `root` node. Everything else is reached by traversal.

```java
public class BST {
    private Node root;

    public BST() {
        root = null;
    }
}
```

---

## Insertion — Iterative

Uses a trailing pointer (`previous`) because the tree only flows downward — once you reach a null slot, you need a reference to the parent to attach the new node.

```java
void addNode(Node leaf) {
    Node pointer = root;
    Node previous = null;

    // Empty tree — new node becomes root
    if (root == null) {
        root = leaf;
        return;
    }

    // Traverse until null slot found
    while (pointer != null) {
        previous = pointer;                         // trail one step behind
        if (leaf.getData() < pointer.getData()) {
            pointer = pointer.getLeft();            // go left
        } else if (leaf.getData() > pointer.getData()) {
            pointer = pointer.getRight();           // go right
        } else {
            return;                                 // duplicate — discard
        }
    }

    // Attach to parent using trailing pointer
    if (leaf.getData() < previous.getData()) previous.setLeft(leaf);
    else previous.setRight(leaf);
}
```

### Why a Trailing Pointer?

When `pointer` reaches `null`, you've found the correct empty slot — but `null` has no parent reference. `previous` holds the last non-null node, giving you the parent needed to attach the new leaf.

---

## Insertion — Recursive

The public method is a clean caller. The private overload is the recursive workhorse — it returns the updated subtree root at each level, allowing the parent to reconnect its child pointer.

```java
public class BST {
    private Node root;

    public BST() {
        root = null;
    }

    // Public caller — takes just the value
    public void addNode(int data) {
        root = addNode(root, data);
    }

    // Private recursive workhorse
    private Node addNode(Node root, int data) {
        if (root == null) {
            return new Node(data); // base case — empty slot found, create node
        }

        if (data > root.getData())
            root.setRight(addNode(root.getRight(), data)); // recurse right
        else if (data < root.getData())
            root.setLeft(addNode(root.getLeft(), data));   // recurse left
        // equal — duplicate, no action

        return root; // return current node so parent can reconnect
    }
}
```

### How the Recursive Return Works

Each recursive call returns the root of the subtree it just processed. The parent assigns that return value back to its left or right child pointer. This is what makes the tree reconnect correctly after each insertion — the structure is rebuilt bottom-up on the way back up the call stack.

---

## Iterative vs. Recursive Insertion

| | Iterative | Recursive |
|---|---|---|
| **Pointer management** | Explicit trailing pointer | Handled by call stack |
| **Readability** | More mechanical | Cleaner, mirrors tree structure |
| **Stack usage** | O(1) | O(h) where h = tree height |
| **Prefer when** | Deep trees, stack overflow risk | General use, clarity |

---

## Time Complexity

| Operation | Average Case | Worst Case (unbalanced) |
|---|---|---|
| **Insert** | O(log n) | O(n) |
| **Search** | O(log n) | O(n) |

Worst case occurs when nodes are inserted in sorted order — the tree degenerates into a linked list with no branching.

> Search and deletion are not yet covered — this note covers insertion only.

---

## Related
- [[Trees]] — foundational tree vocabulary and Node structure; this note builds directly on those concepts
- [[Recursion]] — recursive BST insertion is a direct application of the public/private caller pattern and base case design
- [[Loop Practice and Binary Search]] — binary search on a sorted array uses the same halving logic as BST traversal; BST applies it to a dynamic structure
- [[Linked Lists]] — BST traversal and the trailing pointer pattern mirror linked list traversal mechanics
- [[Sorting Algorithms]] — an in-order traversal of a BST produces a sorted sequence; BSTs and sorting are closely related
- [[Generics]] — BST could be made generic using bounded type parameters and Comparable, same pattern as generic binary search
- [[Trees]] — foundational tree vocabulary and Node structure; BST builds directly on these concepts