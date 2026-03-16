---

---
### Agenda

- Why we test and what a “test” is
- How unit tests run (IDE + Gradle) and where they live in the project
- The TDD cycle and the Three Laws of TDD
- Test structure: Arrange–Act–Assert (AAA)
- JUnit basics (annotations, assertions, failures)
- Clean naming basics (variables, methods, constants)
- Quick intro: what an API is

---

### 1) Test overview / discussion

**What is a test?**

- A test is code that checks whether other code behaves the way we expect.
- Most of the time in Java we mean **automated unit tests** (fast checks of small pieces of behavior).

**Why test even if the code “works”?**

- To prevent regressions when you change code later.
- To document expected behavior.
- To support refactoring by giving you confidence.
- To catch edge cases you did not think about while coding.

**How writing tests differs from production code**

- Tests focus on *behavior* and *examples*.
- Production code focuses on implementing the behavior in a maintainable way.

**Important project setup note**

- Test classes must be in the **same package path** as the class under test, but under the test source folder.
- Typical layout:
    - `src/main/java/...` (production)
    - `src/test/java/...` (tests)

> [!note] ⌨️
> **Instructor note (Curt):** learn the shortcut way in IntelliJ for creating packages/classes/tests.

---

### 2) How to run tests

- **IntelliJ**
    - Run a single test method (green play icon next to the method)
    - Run a whole test class
    - Run all tests in a module
- **Gradle**
    - Run via the Gradle tool window, or from the terminal (command depends on your project).

---

### 3) The Three Laws of TDD (Test-Driven Development)

1. <u>**Do not write production code unless it is to make a failing unit test pass.**</u>
    - Write a failing test first.
    - Then write the smallest amount of production code to pass it.
2. <u>**Do not write more of a unit test than is sufficient to fail (and compilation failures count as failures).**</u>
    - “Failing” can be an assertion failure *or* a compile error.
    - Example: if your test references a class/method that does not exist yet, that is enough to stop and go write the production code.
3. <u>**Do not write more production code than is sufficient to pass the one failing test.**</u>
    - Keep it lean.
    - Let tests **drive design** in small steps instead of building everything up front.

**TDD loop (common wording):** Red → Green → Refactor

![[image 1.png]]

---

### 4) Test format: Arrange – Act – Assert (AAA)

- **Arrange**
    - Create the system under test.
    - Set up any needed objects, test fixtures, or test doubles.
- **Act**
    - Perform the action you are testing.
- **Assert**
    - Verify the result using assertions (what you expected vs what actually happened).

---

### 5) Creating a class + creating a test (IntelliJ)

4. Create the class under `src/main/java` in the correct package.
5. Generate or create the corresponding test under `src/test/java` in the same package.

Screenshot from class:

![[Screenshot_2026-02-06_at_9.53.14_AM.png]]

---

### 6) JUnit basics

- `@Test`
    - Marks a method as a test.
- `@BeforeAll` / `@AfterAll`
    - Run once before/after all tests in the class.
- `@BeforeEach` / `@AfterEach`
    - Run before/after each test.
- `@DisplayName`
    - Gives a nicer name in test output.
- `@Disabled`
    - Temporarily skips a test.

- `assertEquals(expected, actual)`
- `assertTrue(condition)` / `assertFalse(condition)`
- `assertNull(value)` / `assertNotNull(value)`
- `assertThrows(ExceptionType.class, () -> { ... })`

**Helpful failure messages**

Most assertions accept an optional message:

```java
assertEquals(expected, actual, "The calculation result was incorrect");
```

---

### 7) Example: Calculator class + tests (AAA style)

```java
// Calc.java
package mil.army.moda.tdd.calculator;

public class Calc {
	public int add(int firstInt, int secondInt) {
		return firstInt + secondInt;
	}

	public int multiply(int firstInt, int secondInt) {
		return firstInt * secondInt;
	}

	public float divide(float firstNum, float secondNum) {
		if (secondNum == 0) {
			throw new IllegalArgumentException("Cannot divide by zero");
		}
		return firstNum / secondNum;
	}
}
```

```java
// CalcTest.java
package mil.army.moda.tdd.calculator;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalcTest {
	static Calc calc;

	@BeforeAll
	static void beforeAll() {
		// Arrange
		calc = new Calc();
	}

	@Test
	void shouldAddTwoIntegers() {
		// Act
		int actual = calc.add(2, 8);
		// Assert
		assertEquals(10, actual);
	}

	@Test
	void shouldAddPositiveAndNegativeIntegers() {
		int actual = calc.add(-5, 9);
		assertEquals(4, actual);
	}

	@Test
	void shouldMultiplyTwoIntegers() {
		int actual = calc.multiply(2, 4);
		assertEquals(8, actual);
	}

	@Test
	void shouldMultiplyPositiveAndNegativeInteger() {
		int actual = calc.multiply(-5, 9);
		assertEquals(-45, actual);
	}

	@Test
	void shouldMultiplyTwoNegativeIntegers() {
		int actual = calc.multiply(-4, -3);
		assertEquals(12, actual);
	}

	@Test
	void shouldMultiplyZeroAndNegativeInteger() {
		int actual = calc.multiply(0, -3);
		assertEquals(0, actual);
	}

	@Test
	void shouldDivideTwoNumbers() {
		float actual = calc.divide(9, 3);
		assertEquals(3.0f, actual);
	}

	@Test
	void negativeDenominatorDividesPositiveNumerator() {
		float actual = calc.divide(10, -2);
		assertEquals(-5.0f, actual);
	}

	@Test
	void positiveDenominatorDividesNegativeNumerator() {
		float actual = calc.divide(-3, 1);
		assertEquals(-3.0f, actual);
	}

	@Test
	void zeroNumeratorDivision() {
		float actual = calc.divide(0, 1);
		assertEquals(0.0f, actual);
	}

	@Test
	void divisionByZeroThrowsException() {
		IllegalArgumentException exception = assertThrows(
				IllegalArgumentException.class,
				() -> calc.divide(1, 0)
		);
		assertEquals("Cannot divide by zero", exception.getMessage());
	}
}
```

---

### 8) Naming: why it matters

We care about naming because:

- We spend more time **reading** code than writing it.
- Code is usually written once and read many times.
- Good names reduce mental load and communicate intent.

- **camelCase** (Java variables + methods)
```java
calculateMonth()
```
- **snake_case** (common in some languages, not typical in Java)
```java
snake_case_example
```
- **PascalCase** (Java class names)
```java
CalculateMonth
```
- **SCREAMING_SNAKE_CASE** (Java constants)
```java
MAX_MONTH
```
- **kebab-case** (common in URLs, not typical in Java identifiers)

Prefer names that match the real domain:

```java
PassengerList passengers = getPassengerList();
```

If your domain has more specific language:

```java
ChalkManifest chalkManifest = getChalkManifest();
```

Prefer specific booleans/method names:

```java
soldier.setAirAssaultStatus(true);
```

(not vague names like `setStatus(true)`.)

Pick one word per concept and use it everywhere.

- Do not mix `get`, `fetch`, and `retrieve` for the same idea.

If you need a comment to explain a variable or method, it often means the name is not doing its job.

```java
// Bad
var x = 0; // time elapsed in milliseconds since the last event

// Better
var millisecondsSinceLastEvent = 0;
```

Some words have strong meanings in Java.

- A `List` implies ordering.
- A `Set` implies uniqueness.

Examples:

```java
// Risky / misleading
int[] userIdList;

// Better
int[] userIds;
```

For booleans, names like `is...` and `has...` are often clearer:

```java
list.isEmpty();
iterator.hasNext();
```

Every word should add meaning.

You will have to say these names out loud when pairing:

```java
// Hard to read
var crDtTm = DateTime.now();

// Easier to read
var currentDateAndTime = DateTime.now();
```

```java
// Bad
if (manifest.length > 20) { ... }

// Better
if (manifest.length > MAX_MANIFEST_LENGTH) { ... }
```

---

### 9) Methods: naming tips

- Method names should describe **what** the method does (not how).

```java
payer.transfer(payee, amount);
```

- Most method names start with a verb.
- Single-word method names can be fine when the meaning is obvious from the call site.

---

### 10) Fluent interfaces (readability vs complexity)

Fluent interfaces can improve readability for the caller.

Examples discussed:

- Java Stream API

```java
products.stream()
		.filter(product -> product.getBrand().equals("SWF"))
		.collect(Collectors.toList());
```

- Assertion APIs (example style)

```java
expect(tableRows).toBeOfLength(10);
expect(button).toBeDisabled();
```

Tradeoff:

- Better readability for API users.
- More complex implementation for API authors.

---

### 11) What is an API?

In this context, an **API (Application Programming Interface)** is the public “contract” a library or piece of code exposes for other developers to use.

- It includes method names, parameters, and return values.
- You use an API without needing to know the internal implementation.

---

### 12) Continued learning topics (from the end of class)

- Test-first vs TDD (differences, benefits, origins)
- Red, Green, Refactor (TDD loop)
- Testing Pyramid

![[image 2.png]]

- Exercise: Spring Web Book TDD

---

### Appendix: Agile (quick reference)

| **Values** | **Principles (summarized)** |
| --- | --- |
| **Individuals and interactions** | Empowered, collaborative, sustainable teams |
| **Working software** | Early, iterative, and frequent releases |
| **Customer collaboration** | A spirit of continuous improvement |
| **Responding to change** | Flexibility, welcome change |

See more: [Agile Manifesto](https://agilemanifesto.org/iso/en/principles.html)

## Related
- [[Spring Framework]] — Spring projects are tested using TDD principles
- [[Spring JPA Overview - Annotations]] — JPA repositories require integration testing
- [[Java Course]] — TDD is practiced throughout the Java curriculum
- [[Git]] — TDD cycle pairs with frequent commits: red, green, refactor, commit
- [[To Do Study - Self Learning]] — todo app is a direct TDD application