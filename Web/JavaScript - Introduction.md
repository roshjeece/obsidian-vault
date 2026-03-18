---

---
How to access:

- Chrome > “Inspect” > Console
- IntelliJ > Terminal > “node”

Basic entry:

```javascript
> var kitty = "meow"
undefined
> kitty
'meow'
```

Key Facts:

- Node allows us to run JavaScript outside of the browser
- If we attach a JS file to an HTML file, it can run in the browser
- If you want to run a JS file outside of the browser, you can use node:

```javascript
// script.js
console.log("My first javascript file")
```

```javascript
// Terminal
➜  FirstDemo git:(main) ✗ node script.js 
My first javascript file
```

Running a JS file through an HTML file:

- Same `script.js` file

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JavaScript First Demo</title>
</head>
<body>

<script src="script.js"></script>
</body>
</html> 
```

- Open in Browser > Inspect > Console
- Output: `My first javascript file`

![[Screenshot_2026-03-04_at_9.36.12_AM.png]]

```javascript
{
    var dog = "woof"
    {
        dog = "meow"
    }
    console.log(dog)
}
```

Output: meow

```javascript
{
    let dog = "woof"
    {
        dog = "meow"
    }
    console.log(dog)
}
```

Output: meow

```javascript
{
    let dog = "woof"
    {
        let dog = "meow"
    }
    console.log(dog)
}
```

Output: woof

```javascript
{
    let dog = "woof"
    {
        let dog = "meow"
        console.log("inside: " + dog)
    }
    console.log(dog)
}
```

Output: inside: meow

Output: woof



```javascript
{
    let dog = "woof"
    {
        let dog = "meow"
        console.log("inside: " + dog)
    }
    console.log(dog)
}

let num = 12
let isMarried = true
console.log(typeof isMarried)
```

```javascript
// Output:
➜  FirstDemo git:(main) ✗ node script.js
inside: meow
woof
boolean
```

Browser Only Method:

```javascript
// browser only method: prompt
prompt("What is your name?")
// This will create a pop up prompt in the browser. This can only be run in the browser.
```

Expanded:

```javascript
// browser only method: prompt
let answer = prompt("What is your name?")
// This will create a pop up prompt in the browser. This can only be run in the browser.
console.log("Hello " + answer)
// This will produce a console log that says "Hello Josh"
```

Note: All of these are string outputs, even when it’s a number

```javascript
let answer = prompt("How old are you?")
console.log("You are " + answer + " years old.")
console.log(typeof answer)
// Output: You are 29 years old.
// Output: string
```

Coercion (aka Casting): making this string a number

- JavaScript does not have integers, doubles, floats, longs, etc.
- Use: `Number()`

```javascript
let answer = prompt("How old are you?")
answer = Number(answer)
console.log("You are " + answer + " years old.") // Output: You are 29 years old.
console.log(typeof answer) // Output: number
```

Incorrect Input within `Number()`

```javascript
console.log(Number("blah")) // Output: NaN
// NaN means "Not a Number"
```

You can parse an integer from an incorrect input (if the number comes first):

```javascript
let answer = prompt("How old are you?")
// Input: 29dog
answer = parseInt(answer)
console.log("You are " + answer + " years old.") // Output: You are 29 years old.
console.log(typeof answer) // Output: number
console.log(Number()) // Output: 0
```

… but not the reverse:

```javascript
let answer = prompt("How old are you?")
// Input: 29dog
answer = parseInt(answer)
console.log("You are " + answer + " years old.") // Output: You are NaN years old.
console.log(typeof answer) // Output: number
console.log(Number()) // Output: 0
```

---

“falsey” values (these values are automatically false)

- `False`
- `Null`
- `Undefined`
- `“”`
- `0`

“truthy” values

- `true`
- `1`

---

POSTFIX:

```javascript
let count = 1
count++ // POSTFIX: use count, then add
count = count + 1 // same as above
```

PREFIX:

```javascript
let count = 1
++count // PREFIX: add to count, then use
count += 1 // same as above
```

---

Plus (+) operator

- Concatenation OR summation
- `1 + 2 --> 3`
- `1 + "dog" --> '1dog'`

String Interpolation - Template Literals

```javascript
let result = prompt("What is your favorite food?")
let age = 29
let sentence = `I love ${result} and I am ${age} years old!`
console.log(sentence) // Output: I love pizza and I am 29 years old!

if (age > 21) {
    console.log("Yeah!!!") // Output: Yeah!!!
} else {
    console.log("Booo!!!!")
}

// ternary operators (compact if/else)
console.log(age > 21 ? "Yeah!!!" : "Booo!!!") // Output: Yeah!!!
```
## Related
- [[JavaScript - Strings, Arrays, Objects]] — extends core JS with data structures
- [[JavaScript - DOM]] — DOM manipulation builds on JS fundamentals
- [[Introduction to TDD Arrange]] — TDD principles apply to JavaScript as well as Java