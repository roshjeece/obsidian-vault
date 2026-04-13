**BLUF:** A tree is a hierarchical, non-linear data structure organized around parent-child relationships. Unlike arrays or linked lists, trees branch — each node can have multiple children, making them efficient for representing hierarchical data and enabling faster search than linear structures.

---

## Core Vocabulary

| Term | Definition |
|---|---|
| **Root** | The topmost node — has no parent |
| **Node** | A single element in the tree; holds data and references to children |
| **Parent** | A node with one or more child nodes below it |
| **Child** | A node directly connected below a parent |
| **Leaf** | A node with no children — endpoints of the tree |
| **Subtree** | Any node and all its descendants |

---

## Key Characteristics

- **Hierarchical** — data is organized by parent-child relationships, not sequential position
- **Non-linear** — nodes are not stored in a straight line; the structure branches
- **One root** — every tree has exactly one root node
- **No cycles** — a node cannot be its own ancestor

---

## Node Structure

A binary tree node holds data and references to at most two children: `left` and `right`.

```java
public class Node {
    private Node left;
    private Node right;
    private int data;

    public Node(int data) {
        this.data = data;
        left = null;
        right = null;
    }

    public Node getLeft() { return left; }
    public void setLeft(Node left) { this.left = left; }
    public Node getRight() { return right; }
    public void setRight(Node right) { this.right = right; }
    public int getData() { return data; }
    public void setData(int data) { this.data = data; }

    @Override
    public String toString() {
        return "Node{data=" + data + '}';
    }
}
```

> **Note on `toString()`:** The original implementation printed `left` and `right` recursively inside `toString()`. On any non-trivial tree this causes a stack overflow — printing a node triggers printing its children, which triggers printing their children, and so on. The version above prints only the node's own data, which is safe for display and debugging.

---

## Trees vs. Linear Data Structures

| | Array / LinkedList | Tree |
|---|---|---|
| **Structure** | Linear — one path through data | Hierarchical — branches |
| **Search** | O(n) — must scan sequentially | O(log n) — eliminate half the tree per step (balanced BST) |
| **Use case** | Ordered sequences | Hierarchical relationships, fast search |

---

## Related
- [[Binary Search Trees]] — a specific type of binary tree with ordering rules that enable O(log n) search and insertion
- [[Linked Lists]] — both use a Node class with pointer references; trees extend this to two child pointers instead of one `next`
- [[Recursion]] — tree traversal and insertion are natural recursion problems; the BST recursive insert is a direct application
- [[Queues]] — breadth-first tree traversal uses a queue to process nodes level by level
- [[Stacks and Deques]] — depth-first tree traversal uses a stack to track the current path



