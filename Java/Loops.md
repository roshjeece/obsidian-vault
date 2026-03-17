---

---
++ operator

```java
int x = 1;
x++ // Value of x is used FIRST, then for next operation, new value will be used
System.out.print(x)
// Output: 2
```

```java
int x = 1;
++x // Incrementing x first, then it is used
```

So:

```java
int x = 1;
System.out.print(x++);
// x is being used for print
// Output: 1
```

```java
int x = 1;
System.out.print(++x);
// Incrementation of x, then it is printed
// Output: 2
```

++ used after variable, means it won’t be applied until the next operation

++ used BEFORE variable, applied on current operation

LOOPS!

```java
int count = 0 ;

while (count < 5) {
	System.out.println(count);
  count++ ;
  }
```


Keep scanning and adding to sum until a negative number is entered

```java
Scanner obj = new Scanner(System.in);
int total = 0;

System.out.print("Enter a number. Negative to finish: ");
int num = obj.nextInt();

while (num >= 0) {
	total += num
	System.out.print("Enter a number ... negative to quit: ");
	num = object.nextInt();
}
```

Make as few exit points as possible.

Enter a number to define how many entries a program will accept. Prompt user for that number of entries. Release sum at the end. End program if number negative.

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        double sum = 0;
        double currentNumberInput;

        System.out.println("Enter the amount of numbers you want to sum: ");
        double amountOfNumbers = input.nextInt();

        while (amountOfNumbers > 0) {
            System.out.println("Enter your next number. It can't be negative: ");
            currentNumberInput = input.nextDouble();

            if (currentNumberInput >= 0) {
                sum += currentNumberInput;
                amountOfNumbers--;
            }

            else {
                System.out.println("Negative numbers prohibited.");
                return;
            }


        }
        System.out.println("The sum is: " + sum);

    }

}
```

Accept at least one number, can’t be negative. Sum all those numbers together. Negative ends the program:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner obj = new Scanner(System.in);
        int total = 0;
        int num = -1; // Key variable

        while (num < 0) {
            System.out.print("Enter a number. First must be positive: ");
            num = obj.nextInt();
        }
        while (num >= 0) {
            total += num;
            System.out.print("Enter a number ... negative to quit: ");
            num = obj.nextInt();
        }
        System.out.println("Total: " + total);

    }

}
```

Show highest number entered until negative number:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner obj = new Scanner(System.in);
        int highest = 0;
        int num = -1;

        while (num < 0) {
            System.out.print("Enter a number. First must be positive: ");
            num = obj.nextInt();
        }
        while (num >= 0) {
            if (num > highest) {
                highest = num;
                System.out.println("New highest: " + highest);
            }
            System.out.print("Enter a number ... negative to quit: ");
            num = obj.nextInt();
        }

    }

}
```

Find highest number. Important to make sure you handle entries where all are negative.

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Enter # of numbers: ");
        int count = input.nextInt();

        System.out.println("Enter number: ");
        int max = input.nextInt(); // Key: Max isn't initialized to 0 automatically

        while (count > 1) {
            System.out.println("Enter number: ");
            int num = input.nextInt();
            if (max < num) {
                max = num;
            }
            count--;

        }


        System.out.println(max);

        }


}

```

## Related
- [[INDEX - Java Course]] — loops are a core Java concept covered early in the course
- [[Conditionals and Switch Statements]] — conditionals and loops are taught together; while loops depend on boolean conditions
- [[Recursion]] — recursion is an alternative to loops for repeated operations
- [[Variables, Data Types, and Scope]] — foundational Java concepts that precede loops
- [[Sorting Algorithms]] — bubble sort uses nested loops as its core mechanism
- [[udemy Java]] — loops covered in Udemy self-study track as well---

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
