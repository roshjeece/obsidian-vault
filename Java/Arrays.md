---

---
What is it?

Array:

- Data structure used to store fixed-size, sequential collection of elements of same data type
- This means they’re:
    - Homogenous
    - Fixed size
    - Indexed (elements can be accessed by their position)
    - Contiguous (touching) in memory

### Ways to declare array:

Declaration only (no allocated memory, just variable declaration)

- `int[] anArray;`
- `String[] names;`

Specified size:

- `anArray = new int[10];`
- `myArray = new String[2];`

Declaration and initialization using array literals:

- `int[] anArray = {100, 200, 300, 400]`
- `String[] names = {"John", "Doe");`

### Accessing elements and length:

Access:

```java
int[] anArray = {100, 200, 300, 400]
System.out.print(anArray[0]);
// Output: 100
```

Modify:

```java
int[] anArray = {100, 200, 300, 400]
anArray[0] = 50;
System.out.println(Arrays.toString(anArray));;
// Output: [50, 200, 300, 400]
```

Length:

```java
int[] anArray = {100, 200, 300, 400]
System.out.print(anArray.length);
// Output: 4
```

In Class Activity:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        // Scanner initialization

        System.out.print("What is the maximum count: ");
        int size = input.nextInt();
        int count = 0;
        // Establish count of employees

        int[] empAge = new int[size];
        // Creation of array to store employee ages

        do{
            displayMenu();
            System.out.print("Enter your choice: ");
            int choice = input.nextInt();

            switch(choice){
                case 1: count = add(empAge, count);
                    break;
                case 2:
                    calcAverage(empAge, count);
                    break;
                case 3:
                    execReport(empAge, count);
                    break;
                case 4:
                    displayAll(empAge);
                    break;
                default: System.out.println("Invalid input...");
            }

        }while(true);
    }

    static void displayMenu() {
        System.out.println("""
                Employee Management
                Enter 1 to add an employee
                Enter 2 to average the age of 1-5 employees
                Enter 3 to find all employees above a specified age
                Enter 4 to display all""");
    }

    public static int add(int[] age, int count) {
        if(count == age.length) {
            System.out.println("You reached the maximum capacity. You can't add...");
            return count; // Important to return count so that you can average or threshold later!
        }

        Scanner input = new Scanner(System.in);
        System.out.println("Enter the age: ");
        age[count++] = input.nextInt(); // First time function is called, array[0] is updated. Count is incremented. Next time function called, next array position is updated.
        return count; // Have to return count because it's a primitive.
        // We don't have to return the array because arrays are PASSED BY REFERENCE (memory address).
    }

    public static void calcAverage(int[] age, int count){
        double total = 0;
        for(int i = 0; i < count; i++)
            total += age[i];
        // Total of all the ages in the array

        System.out.println("Average is: " + total/count);
    }

    public static void execReport(int[] age, int count) {
        Scanner input = new Scanner(System.in);
        System.out.println("Which age do you want to consider: ");
        int threshold = input.nextInt();

        for(int i = 0; i < count; i++)
            if(age[i] >= threshold)
                System.out.println(age[i]);
        // Steps through array, checking if each value is greater than the threshold
    }

    public static void displayAll(int[] age) {
        for (int x : age) { // enhanced for loop. "For each x in array age, do the following."
            System.out.println(x);
        }
    }

}
```

---

# Notes from Slides

- Arrays start at 0, not 1
- A variable with a reference type, such as an array, holds a memory address where a value is stored

Array names:

- Represent computer memory addresses
- Contain references

“new” keyword required to define array

When an application contains an array:

- Use every element of the array in some task

It is convenient to declare a symbolic constant equal to the size of the array

```java
final int ARRAY_SIZE = 10;
```

Enhanced For Loop:

```java
public static void displayAll(int[] age) {
	for (int x : age) { // enhanced for loop. "For each x in array age, do the following."
            System.out.println(x);
}
```

Passing Arrays to and Returning Arrays from Methods

- What I wrote before about arrays being passed by address

Returning an array from function:

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        int[] arr1 ;
        
        arr1 = func1();
        
        for(int x: arr1)
            System.out.println(x);
    }
    
    public static int[] func1(){
        int[] arr = {1,2,3,4};
        return arr;
        
    }
}
```

Accessing array address:

```java
int[] arr1 = new int[0];

        System.out.println(arr1);
```


In Class Activity (My Solution):

```java
// Main.java

import java.util.Scanner;

public class Main {
    
    public static final Scanner input = new Scanner(System.in);
    
    public static void main(String[] args) {
        int count = 0;
        boolean running = true;

        System.out.println("Enter count of employees: ");
        int size = input.nextInt(); // Size of array
        Employee[] employees = new Employee[size];

        do{
            displayMenu();
            System.out.println("Enter your choice: ");
            int choice = input.nextInt();

            switch(choice){
                case 1:
                    count = addEmployees(count, size, employees);
                    break;
                case 2:
                    employeeAverages(employees, count);
                    break;
                    // The limitations of this enhanced for loop is that you can only step through in one direction
                case 3:
                    threshold(employees);
                    break;

                case 4:
                    System.out.println("Quitting!");
                    running = false;
                    break;

                default: System.out.println("Invalid input...");

            }
        }while(running);

    }

    static void displayMenu() {
        System.out.println("""
                Employee Management
                Enter 1 to add all employees
                Enter 2 to average and salary of all employees
                Enter 3 to find all employees above a specified age
                Enter 4 to quit""");
    }

    static int addEmployees(int count, int size, Employee[] employees) {
        Scanner input = new Scanner(System.in);

        while (count < size) {
            System.out.println("Enter age: ");
            int age = input.nextInt();

            System.out.println("Enter salary: ");
            double salary = input.nextDouble();
            input.nextLine();

            employees[count] = new Employee(age, salary);
            count++;
        }
        return count;
    }

    static void employeeAverages(Employee[] employees, int count) {
        double totalAge = 0;
        double totalSalary = 0;
        for(Employee x : employees) { // This declares the loop variable as an Employee (x), and iterates over the array
            totalAge += x.getAge();
            totalSalary += x.getSalary();
        }

        System.out.println("The average age is: " + totalAge / count);
        System.out.println("The average salary is: " + totalSalary / count);
    }

    static void threshold(Employee[] employees) {
        Scanner input = new Scanner(System.in);

        System.out.println("What age do you want to consider?");
        int ageThreshold = input.nextInt();
        System.out.println("What salary do you want to consider?");
        double salaryThreshold = input.nextDouble();
        input.nextLine();

        for(Employee x : employees) {
            if (x.getAge() >= ageThreshold && x.getSalary() >= salaryThreshold)
                System.out.println(x);
        }
    }

}
```

```java
// Employee.java

public class Employee {
    private int age;
    private double salary;

    public Employee(int age, double salary) {
        this.age = age;
        this.salary = salary;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "age=" + age +
                ", salary=" + salary +
                '}';
    }
}

```

Check array for a value:

```java
public class Activity {
    public static void main(String[] args) {
        // create array
        // hard code values within array
        // accept a value from the user
        // check array for that number

        int[] values = {1,2,3,4,5};

        System.out.println("Enter a value to check for that value: ");
        int num = 3;

        for(int x : values)
            if (x == num){
                System.out.print("Found it");
                return ;
            }

        System.out.println("Not found");


    }
}

```

Ideal Solution (smallest Main.java, most object oriented):

```java
import java.util.Scanner;

public class Main {

    public static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        boolean running = true;

        System.out.println("Enter count of employees: ");
        int size = input.nextInt();
        Cohort cohort = new Cohort(size);

        do {
            cohort.displayMenu();
            System.out.println("Enter your choice: ");
            int choice = input.nextInt();

            switch (choice) {
                case 1:
                    cohort.addEmployees();
                    break;
                case 2:
                    cohort.employeeAverages();
                    break;
                case 3:
                    cohort.threshold();
                    break;
                case 4:
                    System.out.println("Quitting!");
                    running = false;
                    break;
                default:
                    System.out.println("Invalid input...");
            }
        } while (running);
    }
}
```

```java
public class Employee {
    private final int age;
    private final double salary;

    public Employee(int age, double salary) {
        this.age = age;
        this.salary = salary;
    }

    public int getAge() {
        return age;
    }

    public double getSalary() {
        return salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "age=" + age +
                ", salary=" + salary +
                '}';
    }
}

```

```java
import java.util.Scanner;

public class Cohort {

    public static final Scanner input = new Scanner(System.in);
    private final Employee[] employees;
    private int count;
    private final int size;

    public Cohort(int size) {
        this.size = size;
        this.employees = new Employee[size];
        this.count = 0;
    }

    public void displayMenu() {
        System.out.println("""
                Employee Management
                Enter 1 to add all employees
                Enter 2 to average age and salary of all employees
                Enter 3 to find all employees above a specified age and salary
                Enter 4 to quit""");
    }

    public void addEmployees() {
        if (count >= size) {
            System.out.println("All employees have already been added.");
            return;
        }
        while (count < size) {
            System.out.println("Enter age: ");
            int age = input.nextInt();

            System.out.println("Enter salary: ");
            double salary = input.nextDouble();
            input.nextLine();

            employees[count++] = new Employee(age, salary);
        }
    }

    public void employeeAverages() {
        if (count == 0) {
            System.out.println("No employees have been added yet.");
            return;
        }
        double totalAge = 0;
        double totalSalary = 0;
        for (int i = 0; i < count; i++) {
            totalAge += employees[i].getAge();
            totalSalary += employees[i].getSalary();
        }
        System.out.println("The average age is: " + totalAge / count);
        System.out.println("The average salary is: " + totalSalary / count);
    }

    public void threshold() {
        if (count == 0) {
            System.out.println("No employees have been added yet.");
            return;
        }
        System.out.println("What age do you want to consider?");
        int ageThreshold = input.nextInt();
        System.out.println("What salary do you want to consider?");
        double salaryThreshold = input.nextDouble();
        input.nextLine();

        for (int i = 0; i < count; i++) {
            if (employees[i].getAge() >= ageThreshold && employees[i].getSalary() >= salaryThreshold)
                System.out.println(employees[i]);
        }
    }
}
```


Speed & Memory Usage —> Complexity

- The faster, and the less memory used, the better
- See: O(n)

Matrixes (Nested Arrays)

```java
public class Main {

    public static void main(String[] args) {

        int[][] matrix = {{1,3,4},{10,20,40}};

        /*
        try to write code that will print the above matrix as below

        1  3  4
        10 20 40
         */

        for (int x = 0; x < matrix.length; x++) {
            for (int y = 0; y < matrix[x].length; y++) {
                System.out.print(matrix[x][y] + " ");
            }
            System.out.println();
        }

        // Alternative:

        for (int[] row : matrix) {
            for (int val : row) {
                System.out.print(val + " ");
            }
            System.out.println();
        }

    }
}
```

Find Minimums of Matrix and put into new Array:

```java
public class Main {

    public static void main(String[] args) {

        int[][] matrix = {{1,3,4},{10,8,40},{300,200}};
        int[] result = new int[matrix.length];

        int min;

        for(int i = 0; i<matrix.length; i++){
            min = matrix[i][0];
            for(int j = 1; j<matrix[i].length;j++){
                if(min > matrix[i][j])
                    min = matrix[i][j];
            }
            result[i] = min;
        }

        for(int i : result)
            System.out.println(i);

    }
}
```

```java
int[] arr = {1, 4, 6, 10, 20, 60, 90};

int l = 0;
int h = arr.length-1;
int value = 20;

while (l <= h) {
	int mid = l + (h-1)/2;
	if(arr[mid] == value) {
		System.out.print("Found it");
		return;
	}
	if(arr[mid]>value)
		h = mid-1;
	else
		l = mid + 1;
	}

System.out.print("Done");
```

Binary Search of an Array: My (Revised) Solution:

```java
public class Main {
    public static void main (String[] args) {
        int[] sortedArray = {1, 5, 10, 12, 17, 20, 24, 30};
        int target = 24; // Better to make your 'target' value a literal, don't hardcode a target

        int lowIndex = 0; // Returns value at first position
        int highIndex = sortedArray.length - 1; // Returns value at final position

        while (lowIndex <= highIndex) { /* This is important because if the target does not exist in the array,
        it is handled cleanly. If lowIndex ever exceeds highIndex, then the value is not in the array. */
            int midIndex = lowIndex + (highIndex - lowIndex) / 2; // No need to pre-compute midIndex or guessNumber
            int guessNumber = sortedArray[midIndex];
            if (guessNumber == target) {
                System.out.println("Found at index: " + midIndex);
                return;
            }
            else if (guessNumber > target) {
                highIndex = midIndex - 1;
            }
            else {
                lowIndex = midIndex + 1;
            }
        }
        System.out.println("Not found");
    }
}
```

WIP: Palindrome — revisit this implementation

```java
Scanner input = new Scanner(System.in);
        System.out.println("Enter a number you want to make into a palindrome");
        int number = input.nextInt();
        // Ex entry: 1331
        
        int x = number % 10; // x = 1
        number /= 10;
        int y = (x * 10) + 
```

Problem: Check for a palindrome: INSTRUCTOR SOLUTION

```java
public class Main {
    public static void main (String[] args) {
        int original = 1331;
        int newOne = 0;
        int value = original;

        while (value > 0){
            int digit = value % 10;
            value = value / 10;
            newOne = newOne * 10 + digit;
        }

        if(newOne == original)
            System.out.print("Palindrome");
        else
            System.out.print("not a palindrome");


        // Use % 10. This will get you the number at the end.
        // 1234 % 10 = 4; 1234 / 10 = 123
        // 123 % 10 = 3; 123 / 10 = 12
        // 12 % 10 = 2; 12 / 10 = 1
        // 1 % 10 = 1; 1 / 10 = 0

    }
}
```
## Related
- [[Sorting Algorithms]] — sorting algorithms operate on arrays
- [[ArrayList]] — ArrayList is the dynamic alternative to fixed arrays
- [[Java Course]] — course overview