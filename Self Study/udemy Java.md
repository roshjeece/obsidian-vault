---

---
Statement in Jshell

```java
System.out.print("Hello World");
// Output: Hello World
```

Failure to end a double quote creates an **Error: unclose string literal**

```java
jshell> System.out.print("Hello, Tim);
|  Error:
|  unclosed string literal
|  System.out.print("Hello, Tim);
|                   ^
```

Failure to use proper quotation marks on a String:

```java
jshell> System.out.print('Hello, Tim');
|  Error:
|  unclosed character literal
|  System.out.print('Hello, Tim');
|                   ^
```

Useful tip: Control+C will get me back to the prompt if a program doesn’t stop running!

Useful tip: /exit or /ex will end JShell if I’m stuck

Keywords:

- it’s a reserved word that has a predefined meaning in the java language
- Ex: 
```java
int // integer
boolean
byte
char
double
float
int
long
short
```

Variables:

- use these to store info in computers. Gets stored in RAM.

Data Type:

- These define our variables (different types of data)

This is an expression:

```java
int myFirstNumber = 5;
// int is the datatype of the variable
// myFirstNumber is the variable itself
// = is assigning the value
// 5 is the value assigned
```

A place has been allocated in memory for myFirstNumber. Java looks for the value, I don’t have to worry about its location.

Challenge: print out myFirstNumber:

```java
System.out.print(myFirstNumber);
// Output: 5
```

Mistake: If I want to produce the result ‘5,’ then don’t utilize the **string literal** of “myFirstNumber”:

```java
System.out.print("myFirstNumber);
// Output: myFirstNumber
```

Reassigning the value of the variable:

```java
jshell> myFirstNumber = 10;
myFirstNumber ==> 10

jshell> System.out.print(myFirstNumber);
10
```

I reassigned the number using an = statement, then printed it.

Command: list out all Java statements you’ve executed in JShell: **/list**

```java
jshell> /list

   1 : System.out.print("Hello World!")
   2 : System.out.print("Hello Tim")
   3 : System.out.print("Hello, Tim")
   4 : System.out.print("Hello, Tim"
       )
   5 : System.out.print("Hello, Tim"
       );
   6 : System.out.print("Hello, Tim");
   7 : int myFirstNumber = 5;
   8 : System.out.print("myFirstNumber");
   9 : System.out.print(myFirstNumber);
  10 : myFirstNumber = 10;
  11 : System.out.print(myFirstNumber);
  12 : myFirstNumber = 1000;
  13 : System.out.print(myFirstNumber);
```

Important to Note: You cannot redeclare a variable in a normal Java code block inside of an IDE. This is only possible inside of JShell (which holds your hand). This would throw an error in IntelliJ.

More complex expressions on the right side of the statement:

```java
jshell> myFirstNumber = 10 + 5;
myFirstNumber ==> 15
```

Java knows this is a mathematical expression and will still act the same

More complex operator statement:

```java
jshell> myFirstNumber = (10 + 5) + (2 * 10);
myFirstNumber ==> 35
```

Correction: **Expression** is the code segment that is on the right side of the equals sign in an assignment or declaration statement

The left side is the **variable declaration**

```java
int integerVariableDeclaration = 67
```

Challenge: Create two more variables in JShell:

```java
jshell> int mySecondNumber = 12
mySecondNumber ==> 12

jshell> int myThirdNumber = 6
myThirdNumber ==> 6
```

**/var** to list out all variables used so far:

```java
jshell> /var
|    int myFirstNumber = 35
|    int mySecondNumber = 12
|    int myThirdNumber = 6
```

Add all of these integers together by adding the variables directly:

```java
jshell> int myTotal = myFirstNumber + mySecondNumber + myThirdNumber;
myTotal ==> 53
```

Further:

```java
jshell> myThirdNumber = myFirstNumber * 2;
myThirdNumber ==> 70
```

Further:

```java
jshell> myTotal = myFirstNumber + mySecondNumber + myThirdNumber;
myTotal ==> 117
```

Challenge:

```java
jshell> int myLastOne = 1000 - myTotal
myLastOne ==> 883

jshell> System.out.println(myLastOne);
883
```

Note: Java is case sensitive. This would not work with ‘**M**yLastOne’

Note: Keywords need to be in lowecases


**Primitive Types**

Whole Number:

- Byte
- Short
- Int
- Long

Real Number (floating point or decimal)

- Float
- Double

Single Character:

- Char

Boolean value:

- Boolean

Note: these are simply placeholders in memory for a value

Wrapper Class (find int min value):

```java
jshell> int myMinIntValue = Integer.MIN_VALUE;
myMinIntValue ==> -2147483648
// Integer.MIN_VALUE is the "wrapper class"
jshell> int myMinIntValue = Integer.MAX_VALUE;
myMinIntValue ==> 2147483647
```

You can use either a variable or a wrapper class to produce the same output:

```java
jshell> int myMinIntValue = Integer.MIN_VALUE;
myMinIntValue ==> -2147483648

jshell> System.out.print("Integer Minimum Value = " + Integer.MIN_VALUE);
Integer Minimum Value = -2147483648
```

More Complex (print out the whole range):

```java
jshell> System.out.print("Integer Value Range (" + Integer.MIN_VALUE + " to " + Integer.MAX_VALUE + ")");
Integer Value Range (-2147483648 to 2147483647)
```

Doing the same thing over multiple lines:

```java
jshell> System.out.print(
   ...> "Integer Value Range ("
   ...> +
   ...> Integer.MIN_VALUE
   ...> +
   ...> " to "
   ...> +
   ...> Integer.MAX_VALUE
   ...> +
   ...> ")"
   ...> );
Integer Value Range (-2147483648 to 2147483647)
```

What’s a class?

- building block for OOP, allows us to build custom data types

Wrapper Classes are used for all eight primitive data types

- provides simple operations and basic info about primitive data type, which cannot be stored on the primitive itself
- Ex: MIN_VALUE, MAX_VALUE

Most wrapper classes have the same spelling, just uppercase first letter for the following:

- byte = Byte
- short = Short
- long = Long
- float = Float
- double = Double
- boolean = Boolean

Only ones different:

- char = Character
- int = Integer

Over/underflow: Busting the max value:

```java
jshell> System.out.print("Busted Max Value = " + (Integer.MAX_VALUE + 1));
Busted Max Value = -2147483648
// This output is OVERFLOW
jshell> System.out.print("Busted Min Value = " + (Integer.MIN_VALUE - 1));
Busted Min Value = 2147483647
// This output is UNDERFLOW
```

AKA integer wraparounds

Error for going over max value:

```java
jshell> System.out.print("Integer Max Value = " + Integer.MAX_VALUE);
Integer Max Value = 2147483647
jshell> int myMaxIntTest = 2147483648;
|  Error:
|  integer number too large
|  int myMaxIntTest = 2147483648;
|                     ^
```

When will you get an overflow vs when do you get an error?

- Integer wraparound (over/underflow) happens when you are using expressions that are NOT. simple literal value
    - The java compiler doesn’t attempt to evaluate the expression to determine its value, so it DOES NOT give you an error

WILL compile:

```java
int willThisCompile = (Integer.MAX_VALUE + 1);
int willThisCompile = (2147483647 + 1);
```

WILL NOT compile:

```java
int willThisCompile = 2147483648;
```

You can use underscores (not commas) in numeric literals:

```java
jshell> int myMaxIntTest = 2_147_483_647;
myMaxIntTest ==> 2147483647
// This still holds the same value, just makes it easier to read
```

Skipping info on size of different data types

---

Longs

```java
jshell> long myLongValue = 100;
myLongValue ==> 100
// accepted, but Java will still treat this as an int
// Better to do:
jshell> long myLongValue = 100L;
myLongValue ==> 100
```

What’s the width of a long?

```java
jshell> System.out.print("A long has a width of " + Long.SIZE);
A long has a width of 64
```

Long range:

```java
jshell> System.out.print("Long range = " + Long.MIN_VALUE + " to " + Long.MAX_VALUE);
Long range = -9223372036854775808 to 9223372036854775807
```

Proving an Int put in without the L will be treated as an Int:

```java
jshell> long bigLongLiteralValue = 2_147_483_647
bigLongLiteralValue ==> 2147483647

jshell> long bigLongLiteralValue = 2_147_483_647_234;
|  Error:
|  integer number too large
|  long bigLongLiteralValue = 2_147_483_647_234;
|                             ^

```

What happens if overload Short value?

```java
jshell> System.out.print(Short.MAX_VALUE);
32767
jshell> short myShortValue = 32768
|  Error:
|  incompatible types: possible lossy conversion from int to short
|  short myShortValue = 32768;
|                       ^---^
```

Can’t.


---

Declare multiple variables on same line:

```java
jshell> short myMinShortValue = Short.MIN_VALUE; int myMinIntValue = Integer.MIN_VALUE;
myMinShortValue ==> -32768
myMinIntValue ==> -2147483648
```

Declare multiple variables in same statement of identical data type:

```java
jshell> byte myMinByteValue = Byte.MIN_VALUE, myMaxByteValue = Byte.MAX_VALUE;
myMinByteValue ==> -128
myMaxByteValue ==> 127
```

- can’t declare variables of different data types in same statement
- when declaring two variables of same datatype, don’t repeat data type

Math ops with existing variable:

```java
jshell> int myTotal = (myMinIntValue / 2);
myTotal ==> -1073741824
```

Math errors due to dividing non int by int:

```java
jshell> byte myNewByteValue = (myMinByteValue / 2);
|  Error:
|  incompatible types: possible lossy conversion from int to byte
|  byte myNewByteValue = (myMinByteValue / 2);
|                         ^----------------^
```

Solution? Type casting

```java
jshell> byte myNewByteValue = (byte)(myMinByteValue / 2);
myNewByteValue ==> -64
// Added (byte) in front of the value I'm trying to compute
```

Another example:

```java

jshell> short myNewShortValue = (myMinShortValue / 2);
|  Error:
|  incompatible types: possible lossy conversion from int to short
|  short myNewShortValue = (myMinShortValue / 2);
|                           ^-----------------^

jshell> short myNewShortValue = (short) (myMinShortValue / 2);
myNewShortValue ==> -16384
```

The expression needs to be of the correct type! When you see something like (myMinShortValue / 2), the compiler is going to assume (dumbly) that the expression is an int, because it’s not going to seek to parse the data type from the variable.

If you don’t use a variable (only use literal values), it will work:

```java
jshell> short myNewShortValue = (-128 / 2);
myNewShortValue ==> -64
```

Primitive Types Challenge (my way)

```java
jshell> byte myByteVariable = 100; short myShortVariable = 10000; int myIntVariable = 1_000_000_000;
myByteVariable ==> 100
myShortVariable ==> 10000
myIntVariable ==> 1000000000

jshell> long myLongVariable = (long)(50_000 + 10 * (myByteVariable + myShortVariable + myIntVariable));
myLongVariable ==> 1410216408
```

udemy Instructor Solution

```java
long myLongVariable = 50_000L + 10L * (myByteVariable + myShortVariable + myLongVariable);
```

Integer is the best datatype for whole numbers generally (but they take up more space)

Floating Point numbers:

- Float
- Double (default for Java) (more precise)

Double, when compared to float, can represent much smaller and larger decimal values

Double/Float Min/Max Value range

```java
jshell> System.out.print("Float Value Range(" + Float.MIN_VALUE + " to " + Float.MAX_VALUE + ")");
Float Value Range(1.4E-45 to 3.4028235E38)
jshell> System.out.print("Double Value Range(" + Double.MIN_VALUE + " to " + Double.MAX_VALUE + ")");
Double Value Range(4.9E-324 to 1.7976931348623157E308)
```

```java
jshell> int myIntValue = 5; float myFloatValue = 5; double myDoubleValue = 5;
myIntValue ==> 5
myFloatValue ==> 5.0
myDoubleValue ==> 5.0
```

Inclusion of suffixes not required. You can assign integer literals and it’ll be accepted

```java
jshell> myFloatValue = 5f;
myFloatValue ==> 5.0

jshell> myDoubleValue = 5d;
myDoubleValue ==> 5.0
// Works just the same
```

Java will assume values in expression that present as doubles will remain as doubles unless otherwise specified. If you declare a float variable, but don’t specify a float in the expression, you’ll get an error:

```java
jshell> float myOtherFloatValue = 5.25;
|  Error:
|  incompatible types: possible lossy conversion from double to float
|  float myOtherFloatValue = 5.25;
|                            ^--^
```

Challenge: remove this error

Solution 1: use suffix ‘f’

```java
jshell> float myOtherFloatValue = 5.25f;
myOtherFloatValue ==> 5.25
```

Solution 2: type cast

```java
jshell> float myOtherFloatValue = (float) 5.25
myOtherFloatValue ==> 5.25
```

Challenge: convert lbs to kilograms

```java
jshell> double numberOfPounds = 200d;
numberOfPounds ==> 200.0

jshell> double convertedKilograms = n
numberOfPounds   

<press tab again to see all possible completions>
jshell> double convertedKilograms = numberOfPounds * 0.45359237d;
convertedKilograms ==> 90.718474

jshell> System.out.print("Converted kilograms = " + conver
convertPounds        convertedKilograms   convertedKilos       
jshell> System.out.print("Converted kilograms = " + converted
convertedKilograms   convertedKilos       
jshell> System.out.print("Converted kilograms = " + convertedKilograms);
Converted kilograms = 90.718474
```

Can only put one character in char

String supports many

Assignment to a char

```java
jshell> char myChar = 'D';
myChar ==> 'D'

jshell> char myChar = 'DD';
|  Error:
|  unclosed character literal
|  char myChar = 'DD';
|                ^

jshell> char myUnicode = '\u0044';
myUnicode ==> 'D'

jshell> char myDecimalCode = 68;
myDecimalCode ==> 'D'
```

Java’s Primitives:

- boolean
- byte
- char
- double
- float
- int
- long
- short

Java’s Built-In Classes

- Wrappers (Boolean, Byte, Character, etc.)
- BigDecimal
- String

Your Classes

Somebody Else’s Classes

You can concatenate onto your string simply by:

```java
jshell> String myString = "This is a string";
myString ==> "This is a string"

jshell> myString = myString + ", and htis is more.";
myString ==> "This is a string, and htis is more."

jshell> System.out.print("myString is equal to " + myString);
myString is equal to This is a string, and htis is more.
jshell> 

```

Curly brace to write multiple lines of code in JShell

```java
jshell> {
   ...>     String numberString = "250.55";
   ...>     numberString = numberString + "49.45";
   ...>     System.out.print(numberString);
   ...> }
250.5549.45
```

More string concatenation

Declaring an int and assigning it a string won’t work either

A String + anything gives us a String as a result, concatenating anything after the String as text to the initial String

String supersedes?

```java
jshell> lastString = lastString + myInt;
lastString ==> "1050"

jshell> double doubleNumber = 120.47; lastString = lastString + doubleNumber;
doubleNumber ==> 120.47
lastString ==> "1050120.47"
```

Immutable means it can’t be changed

String class is immutable

StringBuilder class is mutable, but can’t assign it a String literal or use plus operator

String is a class, not a primitive type

---

Operators

Operand is anything manipulated by an operator

```java
+ * - // Operators
12 + 15 // The ints are operands
12 + 15 // The whole thing is an expression
= // assignment operator
```

Vars used to give value to other variables are not affected when another variable changes value even after acting as part of the assignment:

```java
jshell> int result = 1 + 2; // 1 + 2 = 3
result ==> 3

jshell> int previousResult = result;
previousResult ==> 3

jshell> result = result - 1;
result ==> 2

jshell> System.out.print("previousResult = " + previousResult);
previousResult = 3
```

Decimal Values being added across char vars

```java
jshell> char firstChar = 'A'; char secondChar = 'B';
firstChar ==> 'A'
secondChar ==> 'B'

jshell> System.out.print(firstChar + secondChar);
131
```

To resolve, concatenate into string:

```java
jshell> System.out.print("" + firstChar + secondChar);
AB
```

You know the other operators. Remainder is %

Post Fix Increment operator

```java
jshell> {
   ...>     int result = 1;
   ...>     result++;
   ...>     System.out.print("result = " + result);
   ...> }
```

```java
jshell> {
   ...>     int result = 1;
   ...>     result+=;
   ...>     System.out.print("result = " + result);
   ...> }
```

Same goes for minus.

```java
jshell> {
   ...>     int result = 1;
   ...>     result-=1;
   ...>     System.out.print("result = " + result);
   ...> }
```

```java
jshell> {
   ...>     int result = 1;
   ...>     result-=;
   ...>     System.out.print("result = " + result);
   ...> }
```

Challenge: Same thing, but like this:

```java
jshell> {
   ...>     int result = 10;
   ...>     result -= 2;
   ...>     System.out.print(result);
   ...> }
8
jshell> 
```

Weird results:

```java
jshell> {
   ...>     int result = 10;
   ...>     result -= 5.5;
   ...>     System.out.print(result);
   ...> }
4
jshell> {
   ...>     int result = 10;
   ...>     result = result - 5.5;
   ...>     System.out.print(result);
   ...> }
|  Error:
|  incompatible types: possible lossy conversion from double to int
|      result = result - 5.5;
|               ^----------^

jshell> {
   ...>     int result = 10;
   ...>     result = (int) (result - 5.5);
   ...>     System.out.print(result);
   ...> }
4
```

Fix:

```java
jshell> {
   ...>     double result = 10;
   ...>     result -= 5.5;
   ...>     System.out.print(result);
   ...> }
4.5

```

Two more operator types:

```java
jshell> {
   ...>     double result = 10;
   ...>     result *= 1.5;
   ...>     System.out.print(result);
   ...> }
15.0
jshell> {
   ...>     double result = 10;
   ...>     result /= 1.5;
   ...>     System.out.print(result);
   ...> }
6.666666666666667
```
## Related
- [[INDEX - Java Course]] — formal Java course to cross-reference with Udemy content
- [[General Skills]] — parent note
- [[Inheritance]] — OOP concepts covered in both formal and self-study tracks
- [[Polymorphism]] — OOP concepts covered in both formal and self-study tracks
- [[Variables, Data Types, and Scope]] — Udemy covers primitive types and casting in more depth than formal course