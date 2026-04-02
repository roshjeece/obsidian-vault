---

---
Review:

```java
import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {

        System.out.println("Enter number of students: ");
        int size = input.nextInt();
        Student[] students = new Student[size];

        addStudents(size, students);
        sortStudents(students);
        binaryAgeSearch(students);

    }

    static void addStudents(int size, Student[] students) {
        int count = 0;

        while (count < size) {
            System.out.println("Enter age: ");
            int age = input.nextInt();

            System.out.println("Enter GPA: ");
            double gpa = input.nextDouble();
            input.nextLine();

            students[count++] = new Student(age, gpa);
        }

    }

    static void sortStudents(Student[] students) {


        for (int pass = 0; pass < students.length - 1; pass++) {
            for (int i = 0; i < students.length - 1 - pass; i++) {
                if (students[i].getAge() > students[i+1].getAge()) {
                    Student temp = students[i];
                    students[i] = students[i+1];
                    students[i+1] = temp;
                }
            }
        }
        System.out.println(Arrays.toString(students));
    }

    static void binaryAgeSearch(Student[] students) {
        System.out.println("What age do you want to search for: ");
        int targetAge = input.nextInt();

        int lowIndex = 0;
        int highIndex = students.length - 1;

        while (lowIndex <= highIndex) {
            int midIndex = lowIndex + (highIndex - lowIndex) / 2;
            int guessNumber = students[midIndex].getAge();

            if (guessNumber == targetAge) {
                System.out.println("Found at index: " + midIndex);
                return;
            }

            else if (guessNumber > targetAge) {
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

New ArrayList:

```java
ArrayList<Student> students = new ArrayList<Student>();
```

Using ArrayList, Collections, and Comparable interface to simplify the sorting:

```java
// Main.Java

import java.util.ArrayList;
import java.util.Collections;

public class Main {

    public static void main(String[] args) {

        /*
        create an array list for students
        add some objects to it
        then sort based on age
         */

        ArrayList<Student> students = new ArrayList<Student>();
        // Creation of ArrayList

        Student stud1 = new Student(22, 4.00);
        Student stud2 = new Student(18, 4.2);
        Student stud3 = new Student(20, 2.33);

        students.add(stud1);
        students.add(stud2);
        students.add(stud3);

        Collections.sort(students);
        // This does the sorting work automatically

        System.out.println(students);

    }

}

// Student.java

public class Student implements Comparable<Student>{
    private int age;
    private double gpa;

    public Student(int age, double gpa) {
        this.age = age;
        this.gpa = gpa;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    @Override
    public String toString() {
        return "Student{" +
                "age=" + age +
                ", gpa=" + gpa +
                '}';
    }

    public int compareTo(Student obj){
        return this.age - obj.age;
    }
}

```

**arrayList.add inserts at the index specified and then shifts everything right!**

---

## Related
- [[Arrays]] — ArrayList is the dynamic alternative to fixed arrays
- [[Sorting Algorithms]] — ArrayLists can be sorted using Collections utility
- [[Spring Framework]] — Spring repositories return Lists of entities
- [[Linked Lists]] — direct structural and performance contrast; reinforces when to choose each collection type