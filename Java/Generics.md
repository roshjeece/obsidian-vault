Focus: 
- Write code that is **reusable**

Reminder: **overloaded function**
```Java
public class Main {  
    public static void main(String[] args) {  
        func1(10,20);  
        func1("hello", "world");  
          
    }  
    public static void func1(int i, int j) {  
        int k = i + j;  
    }  
    public static void func1(String a, String b) {  
        String c = a + b;  
    }  
}
```

These functions are identical except for the data types. Thus, you can use a generic instead:
```Java
// Generic Class
public class Main {  
    public static void main(String[] args) {  
  
        Box<Integer> b = new Box<Integer>();  
        b.set(10);  
        System.out.println(b.get());  
  
        Box<Double> b2 = new Box<Double>();  
        b2.set(10.2);  
        System.out.println(b2.get());  
    }  
}  
  
class Box <T> {  
    T value;  
  
    public void set(T i){  
        value = i;  
    }  
  
    public T get(){  
        return value;  
    }  
}
```

```Java
// Generic Method
public class Main {  
    public static void main(String[] args) {  
  
        func1(10, 20.5);  
        func1("hello", 2);  
    }  
  
    public static <T, K> void func1(T i, K j){  
        System.out.println(i + "" + j);  
    }  
}
```

###### Bounded Types Parameter
- Limited Generic (ex: limit to only numerical values)

```Java
public class Main {  
    public static void main(String[] args) {  
  
        func1(10);  
        func1("hello");  
    }  
  
    public static <T extends Number> void func1(T i){  
        System.out.println(i);  
    }  
}
```


Implementing Comparable for Binary Search Across Data Types

```Java
public class Main {  
    public static void main(String[] args) {  
  
        Double[] sortedArray = {1.0, 5.0, 10.0, 12.0, 17.0, 20.0, 24.0, 30.0};  
        double numberTarget = 17.0;  
        String[] strings = {"Volvo", "BMW", "Ford", "Mazda"};  
        String stringTarget = "Ford";  
  
        binarySearch(sortedArray, numberTarget);  
        binarySearch(strings, stringTarget);  
    }  
  
    public static <T extends Comparable<T>> void binarySearch(T[] array, T target) {  
        int lowIndex = 0;  
        int highIndex = array.length - 1;  
  
        while (lowIndex <= highIndex) {  
            int midIndex = lowIndex + (highIndex - lowIndex) / 2;  
            if (array[midIndex].compareTo(target) == 0) {  
                System.out.println("Found at index: " + midIndex);  
                return;  
            }  
            else if (array[midIndex].compareTo(target) > 0) {  
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