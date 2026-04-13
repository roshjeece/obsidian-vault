- Hierarchical data structure
	- Parent Child Relationship
	- Nodes
	- Top most is the root
	- Every node can have 1+ child nodes
- Non-linear data structure (not stored in linear order)

##### Node within Tree Data Structure
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
  
    public Node getLeft() {  
        return left;  
    }  
  
    public void setLeft(Node left) {  
        this.left = left;  
    }  
  
    public Node getRight() {  
        return right;  
    }  
  
    public void setRight(Node right) {  
        this.right = right;  
    }  
  
    public int getData() {  
        return data;  
    }  
  
    public void setData(int data) {  
        this.data = data;  
    }  
  
    public String toString() {  
        return "Node{" +  
                "left=" + left +  
                ", right=" + right +  
                ", data=" + data +  
                '}';  
    }  
  
}
```

---

### Binary Search Tree
- Data structure
- Efficient search, insertion, deletion
- Big O: O(log n)
- Values cascade from root node based on data/value within that node, you are comparing at each level, going left if the value is smaller than the current node, going right if the value is larger than the current node

###### Binary Search Tree Class and Method to Add Node
```java
public class BST {  
    private Node root;
    // Only one attribute, being the root  
  
    public BST() {  
        root = null; 
        // same for constructor 
    }  
  
    void addNode(Node leaf) {  
        Node pointer = root;  
        Node previous = null;
        // need trailing pointer because once you identify an empty space
        // it's too late to go back up. This structure only flows one way  
        if (root == null) {  
                root = leaf;  
                return;  
            }
            // if the root is null, that leaf becomes the root  
  
        while (pointer != null) {  
            previous = pointer;  
            if (leaf.getData() < pointer.getData()) {  
                pointer = pointer.getLeft();  
            }  
            else if (leaf.getData() > pointer.getData()) {  
                pointer = pointer.getRight();  
            }  
            else {  
                return;  
            }  
        }  
        if (leaf.getData() < previous.getData()) previous.setLeft(leaf);  
        else previous.setRight(leaf);  
    }  
}
```