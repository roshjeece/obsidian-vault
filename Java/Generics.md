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
