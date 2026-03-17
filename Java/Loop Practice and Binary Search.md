---

---
Practice previous skills!
Program only accepts numbers between 1 and 4:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Enter # between 1 and 4: ");
        int num = input.nextInt();


        while (num < 1 || num > 4) {
            System.out.println("Invalid input. Try again.");
            num = input.nextInt();
        }

        System.out.println("You entered " + num);
        }

}
```

Less ideal if you:

```java
Scanner input = new Scanner(System.in);
System.out.println("Enter # between 1 and 4: ");
int num = input.nextInt();

while(true){
	System.out.print("please enter number between 1 and 4: ");
	num = input.nextInt();
	if (num >= 1 && num <= 4)
		break;
}

System.out.print("good job");
```

Minimize break points. Reduce number of possible exits from programs.


Binary Search:

- prompt user for low and high limit
- too high, too low, or on point

Good solution: 

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Enter lower limit: ");
        int lowerLimit = input.nextInt();
        System.out.println("Enter upper limit: ");
        int upperLimit = input.nextInt();

        int guessNumber = lowerLimit + (upperLimit - lowerLimit) / 2;
        char evaluator = 'a'; // alt: boolean found = false;

        while (evaluator != 'c') { // alt: while (!found) {
            System.out.println("The guess number is: " + guessNumber +
                    ". Enter 'h' for high, 'l' for low, or 'c' for correct: ");
            evaluator = input.next().charAt(0); // alt: String answer = input.next();
            if (evaluator == 'h') {
                // I want to set upperLimit to the last guess, then divide by 2
                upperLimit = guessNumber - 1;
                guessNumber = lowerLimit + (upperLimit - lowerLimit) / 2;
            }

            else if (evaluator == 'l') {
                // I want to set lowerLimit to the last guess, then divide by 2
                lowerLimit = guessNumber + 1;
                guessNumber = lowerLimit + (upperLimit - lowerLimit) / 2;

            }

        }
        System.out.println("The correct number is: " + guessNumber);
        
    }
    
}

```
## Related
- [[Loops]] — loop practice builds directly on while and for loop fundamentals
- [[Arrays]] — binary search operates on sorted arrays
- [[Sorting Algorithms]] — binary search requires a sorted array; pairs with sort algorithms
- [[Conditionals and Switch Statements]] — input validation uses conditional logic
- [[_INDEX - Java Course]] — course overview
