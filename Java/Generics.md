# Generics

**BLUF:** Generics let you write reusable code that works across multiple data types without sacrificing type safety. Instead of overloading the same method for every type, you define the logic once and let the caller supply the type.

---

## The Problem Generics Solve

Without generics, supporting multiple types requires overloaded methods that are identical except for their parameter types:
```java
public static void func1(int i, int j) {
    int k = i + j;
}
public static void func1(String a, String b) {
    String c = a + b;
}
```

Generics eliminate this duplication.

---

## Generic Class

Use a type parameter `<T>` on the class declaration. `T` is replaced by the actual type at instantiation.
```java
class Box<T> {
    T value;

    public void set(T i) {
        value = i;
    }

    public T get() {
        return value;
    }
}

class Main {
    public static void main(String[] args) {
        Box<Integer> b = new Box<Integer>();
        b.set(10);
        System.out.println(b.get()); // 10

        Box<Double> b2 = new Box<Double>();
        b2.set(10.2);
        System.out.println(b2.get()); // 10.2
    }
}
```

---

## Generic Method

Type parameters can be scoped to a single method. Declare them before the return type: `<T, K>`.
```java
public static <T, K> void func1(T i, K j) {
    System.out.println(i + "" + j);
}

// Usage
func1(10, 20.5);   // 1020.5
func1("hello", 2); // hello2
```

---

## Bounded Type Parameters

Use `extends` to restrict `T` to a specific type or its subclasses. This is called an upper bound.
```java
// T must be a Number or subclass of Number
public static <T extends Number> void func1(T i) {
    System.out.println(i);
}

func1(10);       // valid — Integer extends Number
func1("hello");  // COMPILE ERROR — String does not extend Number
```

---

## Comparable and Generics

`Comparable<T>` is an interface that requires implementing `compareTo()`. Bounding `T` with `Comparable<T>` lets you write generic algorithms that can compare and sort any type that defines its own ordering.

### Generic Binary Search
```java
public static <T extends Comparable<T>> void binarySearch(T[] array, T target) {
    int lowIndex = 0;
    int highIndex = array.length - 1;

    while (lowIndex <= highIndex) {
        int midIndex = lowIndex + (highIndex - lowIndex) / 2;
        if (array[midIndex].compareTo(target) == 0) {
            System.out.println("Found at index: " + midIndex);
            return;
        } else if (array[midIndex].compareTo(target) > 0) {
            highIndex = midIndex - 1;
        } else {
            lowIndex = midIndex + 1;
        }
    }
    System.out.println("Not found");
}

// Works on any Comparable type
Double[] sortedArray = {1.0, 5.0, 10.0, 12.0, 17.0, 20.0, 24.0, 30.0};
binarySearch(sortedArray, 17.0); // Found at index: 4

String[] strings = {"Volvo", "BMW", "Ford", "Mazda"};
binarySearch(strings, "Ford");   // Found at index: 2
```

> Note: Binary search requires the array to be **sorted** beforehand. String comparison uses lexicographic (alphabetical) ordering.

### Generic Bubble Sort
```java
public static <T extends Comparable<T>> void bubbleSort(T[] array) {
    for (int x = 0; x < array.length - 1; x++) {
        for (int y = 0; y < array.length - 1 - x; y++) {
            if (array[y].compareTo(array[y + 1]) > 0) {
                T temp = array[y];
                array[y] = array[y + 1];
                array[y + 1] = temp;
            }
        }
    }
    System.out.println(Arrays.toString(array));
}

// Works on primitives (boxed) and Strings
Integer[] unsortedArray = {10, 5, 7, 12, 3};
bubbleSort(unsortedArray); // [3, 5, 7, 10, 12]

String[] wordArray = {"Acura", "Toyota", "Nissan", "BMW"};
bubbleSort(wordArray); // [Acura, BMW, Nissan, Toyota]
```

### Sorting Custom Objects with Comparable

To sort your own objects, implement `Comparable<T>` and define `compareTo()`. The method should return:
- **negative** if `this` comes before `obj`
- **zero** if equal
- **positive** if `this` comes after `obj`
```java
class Employee implements Comparable<Employee> {
    int age;
    int hours;

    public Employee(int age, int hours) {
        this.age = age;
        this.hours = hours;
    }

    @Override
    public int compareTo(Employee obj) {
        return age - obj.age; // sort ascending by age
    }

    @Override
    public String toString() {
        return "Employee{age=" + age + ", hours=" + hours + '}';
    }
}

// Usage
Employee ceo = new Employee(20, 40);
Employee loser = new Employee(50, 99);
Employee middleman = new Employee(35, 70);

Employee[] employees = {ceo, loser, middleman};
bubbleSort(employees);
// [Employee{age=20, hours=40}, Employee{age=35, hours=70}, Employee{age=50, hours=99}]
```

---

## Related
- [[Methods, Overloading, and Classes]] — generics solve the same reuse problem as overloading but more elegantly; overloading is the before, generics is the after
- [[ArrayList]] — ArrayList is itself a generic class (`ArrayList<T>`); understanding generics explains why you specify a type in angle brackets
- [[Sorting Algorithms]] — bubble sort is implemented here as a generic method; the sorting logic is identical, generics make it type-agnostic
- [[Loop Practice and Binary Search]] — binary search is implemented here as a generic method using Comparable; companion note with the non-generic version
- [[Inheritance]] — bounded type parameters use `extends` for both classes and interfaces; understanding the inheritance hierarchy clarifies what bounds are valid
- [[Polymorphism]] — generics and polymorphism both enable code reuse across types; generics do it at compile time, polymorphism at runtime
- [[Abstract Classes and Abstraction]] — `Comparable` is an interface that enforces a contract, similar to abstract methods; implementing `compareTo()` is the same pattern as implementing abstract methods

