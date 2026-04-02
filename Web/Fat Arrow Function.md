## BLUF
Arrow functions are a shorter syntax for writing functions in JavaScript. They are not just stylistic — they behave differently from traditional functions in one important way: they do not bind their own `this`. In React and modern JS, arrow functions are the default.

---

## Syntax Comparison
```javascript
// Traditional function declaration
function add(a, b) {
    return a + b;
}

// Arrow function — assigned to a variable
const add = (a, b) => {
    return a + b;
}

// Arrow function — implicit return (single expression, no braces needed)
const add = (a, b) => a + b;
```

All three produce the same result. The implicit return form only works when the function body is a single expression.

---

## Parameter Rules
```javascript
// No parameters — empty parens required
const greet = () => "Hello!"

// One parameter — parens optional
const double = n => n * 2

// Multiple parameters — parens required
const multiply = (a, b) => a * b
```

---

## With a Function Body

When you need more than one line, use braces and an explicit `return`:
```javascript
const divide = (a, b) => {
    if (b === 0) throw new Error("Cannot divide by zero")
    return a / b
}
```

---

## In Context: Callbacks and Array Methods

Arrow functions are especially common as inline callbacks — anywhere you'd pass a function as an argument:
```javascript
const numbers = [1, 2, 3, 4, 5]

// Traditional
const doubled = numbers.map(function(n) { return n * 2 })

// Arrow — much cleaner inline
const doubled = numbers.map(n => n * 2)

const evens = numbers.filter(n => n % 2 === 0)
const sum = numbers.reduce((acc, n) => acc + n, 0)
```

---

## In Context: React Components and Handlers

Arrow functions are the standard way to define components and event handlers in React:
```jsx
// Component
const MyComponent = ({ name }) => {
    return <h1>Hello, {name}</h1>
}

// Event handler inside a component
const handleClick = () => {
    console.log("Clicked!")
}
```

---

## In Context: TDD
```javascript
// Traditional
test("adds correctly", function() {
    expect(1 + 1).toBe(2);
})

// Arrow
test("adds correctly", () => {
    expect(1 + 1).toBe(2);
})
```

The arrow version is standard in Jest. The callback passed to `test()` is just a function — arrow syntax keeps it concise.

---

## Key Difference: `this` Binding

Traditional functions create their own `this` context. Arrow functions inherit `this` from the surrounding scope.
```javascript
// Traditional — 'this' refers to the object calling the method
function Timer() {
    this.seconds = 0
    setInterval(function() {
        this.seconds++   // ❌ 'this' is undefined here — wrong context
    }, 1000)
}

// Arrow — 'this' inherited from Timer's scope
function Timer() {
    this.seconds = 0
    setInterval(() => {
        this.seconds++   // ✅ 'this' correctly refers to the Timer instance
    }, 1000)
}
```

> In React functional components, `this` is rarely used — hooks replace the patterns that relied on it. But understanding the distinction matters when reading older code or working in class components.

---

## Related
- [[JavaScript]] — arrow functions are a core JS syntax feature
- [[JavaScript - Strings, Arrays, Objects]] — arrow functions used heavily with array methods like map, filter, reduce
- [[React]] — arrow functions are the standard syntax for components and event handlers
- [[Introduction to TDD Arrange]] — arrow functions are the standard callback syntax in Jest tests
```

---

## Suggested Backlinks

**JavaScript**
```
- [[Fat Arrow Functions]] — dedicated reference for arrow function syntax, implicit returns, and this binding behavior
```

**Introduction to TDD Arrange**
```
- [[Fat Arrow Functions]] — arrow functions are the standard callback syntax passed to Jest's test() and describe() blocks
```

**React**
```
- [[Fat Arrow Functions]] — arrow functions are used for component definitions and event handlers throughout React