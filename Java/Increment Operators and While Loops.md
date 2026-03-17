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
- [[Java Course]] — loops are a core Java concept covered early in the course
- [[Conditionals and Switch Statements]] — conditionals and loops are taught together; while loops depend on boolean conditions
- [[Recursion]] — recursion is an alternative to loops for repeated operations
- [[Variables, Data Types, and Scope]] — foundational Java concepts that precede loops
- [[Sorting Algorithms]] — bubble sort uses nested loops as its core mechanism
- [[udemy Java]] — loops covered in Udemy self-study track as well