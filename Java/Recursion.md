---

---
Factorial:

```java
public class Main {

    public static void main(String[] args) {

        System.out.print(fact(5));

    }

    public static int fact(int n) {

        if(n==1)
            return 1; // This is what indicates the bottom of the "stack," recursive call triggers until this is reached

        return n * fact(n-1); // Key recursive call
    }
}
```

Fibonacci (Iterative, not recursive)

```java
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Enter the # of the fibonacci sequence you wish to see: ");

        int seq = input.nextInt();
        int left = 0;
        int right = 1;

        for(int i = 0; i < seq; i++) {
            int next = left + right;
            left = right;
            right = next;
        }

        System.out.println(right);

    }
}
```

Recursive Fibonacci

```java
public class RecursiveFibonacci {
    public static void main (String[] args) {
        System.out.println(fibRec(4));

    }

    public static int fibRec(int n) {
        if (n==0)
            return 1;
        if (n==1)
            return 1;

        return fibRec(n-1)+fibRec(n-2);
    }
}

```



## Practice

**Add Digits** — take an integer and recursively add its digits together
```java
public class RecursiveAddDigits {
    public static void main(String[] args) {
        System.out.println(addDigits(1234));
    }

    public static int addDigits(int num) {
        // BASE CASE
        if (num == 0)
            return 0;
        // RECURSIVE CASE — extract last digit, add remaining
        return num%10 + addDigits(num/10);
    }
}
```

Remember: `% 10` gets the final digit, `/ 10` gets the remaining digits.

---

**Count Up to Target** — print digits from 0 to a target number recursively
```java
public class CountUpTo {
    public static void main (String[] args) {
        int current = 0;
        int target = 5;
        countUp(target, current);
    }

    public static int countUp(int target, int current) {
        // BASE CASE
        if (current > target)
            return target;
        // RECURSIVE CASE
        System.out.println(current);
        return (countUp(target, current + 1));
    }
}
```

## Related
- [[Sorting Algorithms]] — recursion is the foundation of merge sort and quicksort
- [[Linked Lists]] — linked list traversal and search are classic recursion use cases; good cross-reference for applying recursion to data structures
- [[Methods and Overloading]] — recursive methods are self-calling methods; the call mechanics and local variable behavior covered here are foundational
- [[Trees]] — tree structure is inherently recursive; each subtree is itself a tree — classic recursion territory
- [[Binary Search Trees]] — BST recursive insertion is a clean real-world application of the public/private recursive caller pattern