---
notion-id: 3194a3bf-1151-8093-a717-eb4d49ab01d3
---
Add Digits: Take an integer, add its digits together

```java
public class RecursiveAddDigits {
    public static void main(String[] args) {
//        write a program that will accept a number and then recursively add all its digits
        System.out.println(addDigits(1234));

    }
    public static int addDigits(int num) {

        // BASE CASE -- How do we exit?
        if (num == 0)
            return 0;

        // Recursive Case -- How do we express the problem in terms of itself?
        return num%10 + addDigits(num/10); // extract last digit, add remaining
        
    }
}
```

Remember: Mathematically, you can get the final digit with `% 10`, and then the other digits with `/ 10`

Print Digits from 0 to Target

```java
public class CountUpTo {
    public static void main (String[] args) {

        int current = 0;
        int target = 5;
        countUp(target, current);

    }

    public static int countUp(int target, int current) {

        // BASE CASE
        if (current > target)
            return target;


        // RECURSIVE CASE
        System.out.println(current);
        return (countUp(target, current + 1));
    }

}

```

