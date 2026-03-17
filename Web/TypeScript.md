
Node-based application  
  
1) Create a parent directory  
2) Create an index.ts file  
3) npm init [-y] = creates package.json ⇒ recipe or blueprint  
4) install packages ⇒ just means "ready to use"  
5) import/utilize package/modules

Build a node application using TS => DO NOT use the -g

Package.json (Should look like this when steps above are done in correct order):
```JSON
{  
  "name": "demo1",  
  "version": "1.0.0",  
  "description": "",  
  "main": "src/index.ts",  
  "scripts": {  
    "test": "echo \"Error: no test specified\" && exit 1"  },  
  "keywords": [],  
  "author": "",  
  "license": "ISC",  
  "type": "commonjs",  
  "devDependencies": {  
    "typescript": "^5.9.3"  
  }  
}
```



tsconfig.json:
```JSON
{  
  "compilerOptions": {  
    "module": "CommonJS", // different based o module or vanilla  
    "target": "ES2022", // which javascript "generation"  
    "outDir": "./build",  
    "removeComments": true  
  },  
  "include": ["./src/**/*.ts", "./utils/"], // can be as flexible or strict as you need  
}
```

index.js
```TypeScript
let dog: string = "woof"  
console.log(dog)  
dog = 9
```


// I have a comment  
let dog: string = "woof"  
console.log(dog)  
  
let num: number;  
let num2: number = 3;  
  
let isMarried: boolean = false;

Stick with the `npx tsc` → `node build/index.js` workflow as you keep learning.


UPDATE: index.ts

```TypeScript
// I have a comment  
let dog: string = "woof"  
console.log(dog)  
  
let num: number;  
let num2: number = 3;  
  
let isMarried: boolean = false;  
  
// function  
// think about parameter data types and return values  
const fullname= (fname: string, lname: string): string => {  
    return `${fname} ${lname}`  
}  
console.log(fullname("Joshua", "Reece"))  
  
// Array  
// String[]  
let names: string[] = ["Atlas", "Ranger", "Bug"]  
let newNames: Array<string> = ["ben", "johny", "sue"]  
let nums: number[] = [1,2,3]  
let newNums: Array<number> = [2,3,4]
```

Flow:

1. Place index.ts inside of a src folder
2. Optional: create a helpers.ts file inside of src
3. Compile and Run:
	1. `npx tsc` → `node build/index.js`

Basic TypeScript Program:

###### Index.js

```TypeScript
// I have a comment  
let dog: string = "woof"  
console.log(dog)  
  
let num: number;  
let num2: number = 3;  
  
let isMarried: boolean = false;  
  
// function  
// think about parameter data types and return values  
const fullname= (fname: string, lname: string): string => {  
    return `${fname} ${lname}`  
}  
console.log(fullname("Joshua", "Reece"))  
  
// Array  
// String[]  
let names: string[] = ["Atlas", "Ranger", "Bug"]  
let newNames: Array<string> = ["ben", "johny", "sue"]  
let nums: number[] = [1,2,3]  
let newNums: Array<number> = [2,3,4]

```


Import/Export
- You can export functions created in one file and run them in another file
- Example:
###### helpers.ts
```TypeScript
// we need to make this accessible to other files  
export const area = (width: number, length: number): number => {  
    return width * length  
}  
  
export const perimeter = (width: number, length: number): number => {  
    return (width*2) + (length*2)  
}  
  
const FAKE_DATA = [  
    { category: "lunch"},  
    { category: "dinner"},  
    { category: "dessert"},  
    { category: "breakfast"},  
]  
  
export const filterCategories = FAKE_DATA.filter(data => {  
    let userChosenOption = "breakfast"  
    let {category} = data;  
    return category === userChosenOption  
})

```

###### index.ts
```TypeScript
import {area, perimeter, filterCategories} from "./helpers"  
  
  
let result:number = area(4, 5)  
console.log("Area: ", result)  
  
let result2:number = perimeter(6,7)  
console.log("Perimeter: ", result2)  
  
console.log(filterCategories)

```





## Related
- [[JavaScript]] — TypeScript is a typed superset of JavaScript
- [[JavaScript - Strings, Arrays, Objects]] — JS fundamentals apply in TypeScript
- [[Beginning Web Programming]] — course overview
- [[Spring Framework]] — TypeScript frontend pairs with Spring Boot backend