
### Catching a divide by zero error:
```Java
public class Main {  
    public static void main(String[] args) {  
        try {  
            int x = 3;  
            int y = 0;  
            int z = x / y;  
        } catch (Exception e) {  
            System.out.print("can't be serious");  
        }  
  
        System.out.println("I am still in control");  
    }  
}
```
Output: `can't be seriousI am still in control`

###### Another example:
```Java
public class Main {  
    public static void main(String[] args) {  
        int[] x = {1,2,3};  
        try {  
            System.out.println(x[10]);  
        } catch (Exception e) {  
            System.out.println("can't be serious");  
        }  
  
        System.out.println("I am still in control");  
    }  
}
```
Output: cant be serious I am still in control


### Finally statement
```java
public class Main {
  public static void main(String[] args) {
    try {
      int[] myNumbers = {1, 2, 3};
      System.out.println(myNumbers[10]);
    } catch (Exception e) {
      System.out.println("Something went wrong.");
    } finally {
      System.out.println("The 'try catch' is finished.");
    }
  }
}
```

### Throwing Exceptions
```Java
public class Main {  
    public static void main(String[] args) {  
  
        throw new IndexOutOfBoundsException("Just for fun");  
    }  
}
```
Output: error as indexoutofboundsexception
### Catching Thrown Exceptions
```Java
public class Main {  
    public static void main(String[] args) {  
  
        try {  
            throw new IndexOutOfBoundsException("Just for fun");  
        } catch (Exception e) {  
            System.out.println(e.getMessage());  
        }  
    }  
}
```
Output (graceful): "Just for fun"

Another example:
```Java
public class Main {  
    public static void main(String[] args) {  
  
        try {  
            int x = 3;  
            int y = 0;  
            int z = x / y;  
        } catch (Exception e) {  
            System.out.println(e.getMessage());  
        }  
    }  
}
```
Output (graceful): "/ by zero"


##### Specifying Exception Types
```Java
public class Main {  
    public static void main(String[] args) {  
  
        try {  
            int x = 3;  
            int y = 0;  
            int z = x / y;  
        } catch (ArithmeticException e) {  
            System.out.println("Arithmetic exception");  
        }  
    }  
}
```
Output: "Arithmetic exception"

##### Multiple Catches
```Java
public class Main {  
    public static void main(String[] args) {  
  
        try {  
            int[] arr = {1,2,3};  
            System.out.println(arr[10]);  
  
            int x = 3;  
            int y = 0;  
            int z = x / y;  
        } catch (ArithmeticException e) {  
            System.out.println("Arithmetic exception");  
        } catch (ArrayIndexOutOfBoundsException e) {  
            System.out.println("Array out of bounds exception");  
        }  
  
    }  
}
```


Important: Children catches must be before Parent catches
See more: https://rollbar.com/blog/java-exceptions-hierarchy-explained/
![[Pasted image 20260317145211.png]]