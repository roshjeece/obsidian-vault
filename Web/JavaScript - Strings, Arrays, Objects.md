---

---
```javascript
var examples = ['APPLE', 'Apple Cider', '   applesauce', 'apple pie', 'green apples']

	var test1 = examples.filter(function(data) {
		return data === 'apple';
	})
	
	console.log(test1);
```

Output: `[]`

- `=`
    - Assignment
- `==`
    - Equals
- `===`
    - Strict Equals

Strings - refresher

- Strings are primitive values (like numbers, booleans, etc.)

Creation of Strings, Trim, then Display

```javascript
> let banana = "banana"
undefined
> banana.length
6
> let bananas = "I like bananas"
undefined
> bananas.length
14
> let oranges = "   I like oranges.   "
undefined
> oranges.length
21
> let newOranges = oranges.trim();
undefined
> newOranges.length
15
> oranges
'   I like oranges.   '
> newOranges
'I like oranges.'
```

Slicing of Strings (`String.slice()`)

```javascript
> let words = 'I love talking to animals.'
undefined
> let result = words.slice(7, 14)
undefined
> result
'talking'
```

- Slice is exclusive (up to 14, does not include 14)
    - Inclusive on the min (includes 7)

Indexing Strings (`String.indexof()`)

- Returns position of the first occurrence of a specified value in a string. This method returns -1 if the value to search for never occurs.

```javascript
> let question = "What is my name?"
undefined
> let result = question.indexOf("name")
undefined
> result
11
> let newResult = question.indexOf("George")
undefined
> newResult
-1
```

Convert to Upper Case (`String.toUpperCase()`)

```javascript
> let test = "This is a BUnch of rAndom WoRds!"
undefined
> let result1 = test.toUpperCase()
undefined
> result1
'THIS IS A BUNCH OF RANDOM WORDS!'
```

Note: camelCase is mandatory for these functions. `.toupperCase()` will not work!

— Good Practice: sanitization of data in the front end when received from the user!

String.substring()

- Similar to slice

So how can we pull ‘Apple’ from this data?

NORMALIZE IT

```javascript
> let examples = ['APPLE', 'Apple Cider', '   applesauce', 'apple pie', 'green apples']

> let test1 = examples.map(function(data) {
		return data.trim().toLowerCase();
	})
	.filter(function(data) { 
		return data.substr(0,5) == 'apple';
	})
	.sort();
		
undefined
> test1
[ 'apple', 'apple cider', 'apple pie', 'applesauce' ]
// Did we lose something?
```

Array Manipulation:

```javascript
let animals = ["dog", "cat", "mouse"]
console.log(animals)

// Bob adopted a new cat
// 4 ways to alter an array by adding/deleting the first elements
// append means 'add to end'
// prepend means 'add to beginning'

animals.push("cat2") // adoption, add to end
console.log(animals)

// pop()
let unlovedAnimal = animals.pop() // removes last element
console.log(unlovedAnimal)
animals.unshift("cat2") // readopts animal to beginning of array
console.log(animals)
animals.shift() // removes animal from beginning of array
console.log(animals)
```

```javascript
// Output:

➜  Arrays git:(main) ✗ node script.js
[ 'dog', 'cat', 'mouse' ]
[ 'dog', 'cat', 'mouse', 'cat2' ]
cat2
[ 'cat2', 'dog', 'cat', 'mouse' ]
[ 'dog', 'cat', 'mouse' ]
```

2D Array:

```javascript
// new array
let houses = ["doghouse", "scratching post", "cage"]
animals.push(houses)
console.log(animals)

// Output: [ 'dog', 'cat', 'mouse', [ 'doghouse', 'scratching post', 'cage' ] ]
```

Put Two Existing Arrays Together in 1D Array

```javascript
// spread operator
let newArray = [...animals, ...houses]
console.log(newArray)
// Output: [ 'dog', 'cat', 'mouse', 'doghouse', 'scratching post', 'cage' ]
```

forEach() vs. map()

- map() returns a new array

```javascript
let colors = ["blue", "yellow", "purple"]
let result = colors.map(function(data) {
    return data + "'s"
    }
)
console.log(result)
console.log(result.length)
```

Output:

```javascript
[ "blue's", "yellow's", "purple's" ]
3
```

Filter:

```javascript
let words = ["cat", "house", "mouse"]
result = words.filter(function(kitty){
    return kitty.length > 4
    }
)
console.log(result)
```

Output:

```javascript
[ 'house', 'mouse' ]
```

Filter (different test condition):

```javascript
let words = ["cat", "house", "mouse"]
result = words.filter(function(kitty){
    return kitty.slice(1, kitty.length) === "ouse"
    }
)
console.log(result)
```

Output:

```javascript
[ 'house', 'mouse' ]
```

Functions

- Declare the function
- Then you call (invoke) the function

Example Structure:

```javascript
function nameOfFunction() {
	// The code to be run
}
nameOfFunction(); // this is how we invoke the function
// This function can be called any number of times
```

```javascript
// create a named function
function doggyHorse() {
	// code to be run
	// prints out in console
```

Functions - Parameters 

- Functions can take multiple arguments

Functions - Fat Arrows

- Modern way of writing functions

```javascript
let nameOfFunction = (param1, param2, etc) => {
	return // something
}
```

```javascript
let square = function(num){
    return num ** 2
}
console.log(square(5))
```

```javascript
let square = (num) =>{
    return num ** 2
}
console.log(square(6))
```

Implied Return:

```javascript
let square = num => num ** 2

console.log(square(8))
```

Multiple Variables:

```javascript
let square = (num, age) => {
    return num + age
}
```

## Related
- [[JavaScript - Introduction]] — foundational JS concepts
- [[JavaScript - DOM]] — DOM manipulation uses arrays and objects heavily
- [[Arrays]] — Java arrays parallel JavaScript array methods covered here