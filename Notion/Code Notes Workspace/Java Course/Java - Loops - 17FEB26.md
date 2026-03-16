---
notion-id: 30a4a3bf-1151-80e6-9903-eafcac8de546
---
Sum input of numbers together:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int total = 0;


        System.out.println("Enter the number of numbers you want me to accept: ");

        for (int inputNumber = input.nextInt(); inputNumber > 0; inputNumber--) {

            System.out.println("Enter a number: ");
            int nextNumber = input.nextInt();
            total += nextNumber;

        }

        System.out.println("The total is: " + total);
    }
}
```

Find smallest number of a set of numbers entered:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int smallest = Integer.MAX_VALUE; // Guarantees that the if statement will be true the first time


        System.out.println("Enter the number of numbers you want me to accept: ");

        for (int inputNumber = input.nextInt(); inputNumber > 0; inputNumber--) {

            System.out.println("Enter a number: ");
            int nextNumber = input.nextInt();
            if (smallest > nextNumber)
                smallest = nextNumber;

        }

        System.out.println("The smallest number is: " + smallest);

    }
}
```

Alternative:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.print("How many #s to accept: ");
        int count = input.nextInt();

        System.out.print("Enter a number: ");
        int smallest = input.nextInt();

        for (int i = 1; i < count; i++) {
            System.out.print("Enter a number: ");
            int num = input.nextInt();
            if (num < smallest)
                smallest = num;
        }

        System.out.println("Smallest number: " + smallest);

    }
}
```

Note: Look at strategic utilization of debugger in IntelliJ

Bare Block / Nested Block

Same code as alternative above, but semicolon after the if statement:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.print("How many #s to accept: ");
        int count = input.nextInt();

        System.out.print("Enter a number: ");
        int smallest = input.nextInt();

        for (int i = 1; i < count; i++); // Does nothing but create a delay
        {
            System.out.print("Enter a number: ");
            int num = input.nextInt();
            if (num < smallest)
                smallest = num;
        } // Bare Block/Nested Block, this executes with top down sequence

        System.out.println("Smallest number: " + smallest);

    }
}
```

Do-While Loops

```java
public class Main {
    public static void main(String[] args) {

        int count = 5 ;
        do {
            System.out.println(count);
            count--;
        } while(count > 0);
        
    }
}
```

- Do-While tends to be more elegant

do-while with the “find the smallest entry” code from before:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int smallest = Integer.MAX_VALUE; // Guarantees that the if statement will be true the first time

        System.out.println("Enter the number of numbers you want me to accept: ");
        int numberOfNumbers = input.nextInt();

        do {
            System.out.println("Enter a number: ");
            int nextNumber = input.nextInt();
            if (smallest > nextNumber)
                smallest = nextNumber;
            numberOfNumbers--;
        } while (numberOfNumbers > 0);

        System.out.println("The smallest number is: " + smallest);

    }
}
```

Note: do-while always executes its body at least once before checking the conditions. Because of this, non-valid entries (such as 0, -1, etc.) will still allow the loop to execute once before being checked.

![[Screenshot_2026-02-17_at_2.33.31_PM.png]]

Make user enter a number between 1 and 4:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int userInput;

        do {
            System.out.println("Enter a number between 1 and 4: ");
            userInput = input.nextInt();
        } while (userInput < 1 || userInput > 4);


    }
}
```

Break vs Continue

```java
public class Main {
    public static void main(String[] args) {

        for (int i = 0; i < 6; i++) {
            if (i == 3)
                break;
            System.out.println(i);
        }

    }
}
// Output: 0, 1, 2
```

```java
public class Main {
    public static void main(String[] args) {

        for (int i = 0; i < 6; i++) {
            if (i == 3)
                continue; // Sister command to break (takes outside loop), continue jumps to the for loop and bypasses
            System.out.println(i);
        }

    }
}
// Output: 0, 1, 2, 4, 5
```
