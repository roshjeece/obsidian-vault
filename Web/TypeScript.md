
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

## Related
- [[JavaScript]] — TypeScript is a typed superset of JavaScript
- [[JavaScript - Strings, Arrays, Objects]] — JS fundamentals apply in TypeScript
- [[Beginning Web Programming]] — course overview
- [[Spring Framework]] — TypeScript frontend pairs with Spring Boot backend

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

