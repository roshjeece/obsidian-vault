## Conditionals and Switch Statements

Conditional logic controls the flow of a program based on whether a condition is true or false.

---

## Logical Operators

| Operator | Meaning | Example |
|---|---|---|
| `&&` | AND — both must be true | `x > 2 && y < 3` |
| `\|\|` | OR — at least one must be true | `x > 2 \|\| y < 3` |
| `!` | NOT — inverts the condition | `!isComplete` |

```java
int x = 3;
int y = 4;

if ((x > 2) || (y < 3))
    System.out.println("hello"); // Output: hello
```

---

## if / else if / else

```java
int score = 82;

if (score >= 90)
    System.out.println("A");
else if (score >= 80)
    System.out.println("B");
else if (score >= 70)
    System.out.println("C");
else if (score >= 60)
    System.out.println("D");
else
    System.out.println("F");

// Output: B
```

**Key rules:**
- Curly braces are optional for single-statement bodies — but use them anyway for clarity
- Empty statements are valid: `if (x < 5) ;` — the if ends at the semicolon
- Conditions are evaluated top to bottom — first match wins

---

## Switch Statements

Use switch when comparing a single variable against multiple discrete values.

```java
int day = 3;

switch (day) {
    case 1:
        System.out.println("Monday");
        break;
    case 2:
        System.out.println("Tuesday");
        break;
    case 3:
        System.out.println("Wednesday");
        break;
    default:
        System.out.println("Other day");
}

// Output: Wednesday
```

**Key rules:**
- `break` exits the switch — without it, execution falls through to the next case
- `default` runs if no case matches — always include it
- Switch works with: `int`, `char`, `String`, `enum`

**Switch with String:**

```java
String grade = "B";

switch (grade) {
    case "A":
        System.out.println("Excellent");
        break;
    case "B":
        System.out.println("Good");
        break;
    case "C":
        System.out.println("Average");
        break;
    default:
        System.out.println("Below average");
}

// Output: Good
```

---

## Ternary Operator

Compact inline if/else. Use for simple assignments — avoid for complex logic.

```java
// Syntax: condition ? valueIfTrue : valueIfFalse

int age = 29;
String result = age > 21 ? "Legal" : "Too young";
System.out.println(result); // Output: Legal
```

```java
// Equivalent if/else:
String result;
if (age > 21)
    result = "Legal";
else
    result = "Too young";
```

Ternary operators also appear in sorting and array logic:

```java
// From merge sort — compact comparison:
newArray[i + j] = (arr1[i] < arr2[j]) ? arr1[i++] : arr2[j++];
```

---

## When to Use Each

| Situation | Use |
|---|---|
| Single condition, two outcomes | `if/else` |
| Multiple conditions, ranges | `if/else if/else` |
| Single variable, discrete values | `switch` |
| Simple inline assignment | ternary |

---

## Related
- [[Loops]] — loops use conditional logic for their continuation checks
- [[Variables, Data Types, and Scope]] — boolean conditions rely on correct data types
- [[Conditionals, toString, and CPU Execution]] — if/else extended with sequential execution examples
- [[Introduction to TDD Arrange]] — conditionals are tested using assertTrue/assertFalse
