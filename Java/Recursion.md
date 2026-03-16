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

## Related
- [[Sorting Algorithms]] — recursion is the foundation of merge sort and quicksort
- [[Merge Sort]] — direct application of recursive thinking
- [[Java Course]] — course overview