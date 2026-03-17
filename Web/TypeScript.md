# TypeScript

## BLUF
TypeScript is a typed superset of JavaScript. You write `.ts` files, compile them to `.js` with `npx tsc`, then run the output with Node. Type annotations catch errors at compile time rather than runtime.

---

## Project Setup

### Step-by-Step
1. Create a parent directory
2. Create a `src/` folder with an `index.ts` file inside it
3. Run `npm init -y` → generates `package.json` (the project blueprint)
4. Install TypeScript as a **local dev dependency** (not global — global installs cause version conflicts across projects):
```bash
   npm install --save-dev typescript
```
5. Create `tsconfig.json` (see below)
6. Compile and run:
```bash
   npx tsc
   node build/index.js
```

---

## Configuration Files

### package.json
```json
{
  "name": "demo1",
  "version": "1.0.0",
  "description": "",
  "main": "build/index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "type": "commonjs",
  "devDependencies": {
    "typescript": "^5.x.x"
  }
}
```
> Note: `main` points to `build/index.js` — Node runs the compiled JS output, not the TS source.

### tsconfig.json
```json
{
  "compilerOptions": {
    "module": "CommonJS",
    "target": "ES2022",
    "outDir": "./build",
    "removeComments": true
  },
  "include": ["./src/**/*.ts", "./utils/"]
}
```

| Key | Purpose |
|---|---|
| `module` | `CommonJS` for Node.js; use `ESNext` for browser/bundler environments |
| `target` | Which JS generation to compile down to |
| `outDir` | Where compiled `.js` files go — this is what Node actually executes |
| `include` | Which files the compiler picks up — must cover any helper files you create |

---

## Basic Types
```typescript
// Primitives
let dog: string = "woof"
let num: number
let num2: number = 3
let isMarried: boolean = false

// Functions — annotate parameter types and return type
const fullname = (fname: string, lname: string): string => {
    return `${fname} ${lname}`
}
console.log(fullname("Joshua", "Reece"))

// Arrays — two equivalent syntaxes
let names: string[] = ["Atlas", "Ranger", "Bug"]         // preferred for simple types
let newNames: Array<string> = ["ben", "johny", "sue"]    // useful for complex generics
let nums: number[] = [1, 2, 3]
let newNums: Array<number> = [2, 3, 4]
```

> **Avoid `any`** — using `any` disables type checking and defeats the purpose of TypeScript. If you're tempted to use it, look for a proper type or use `unknown` instead.

---

## Import / Export

You can export functions from one file and import them into another.

### src/helpers.ts
```typescript
export const area = (width: number, length: number): number => {
    return width * length
}

export const perimeter = (width: number, length: number): number => {
    return (width * 2) + (length * 2)
}

const FAKE_DATA = [
    { category: "lunch" },
    { category: "dinner" },
    { category: "dessert" },
    { category: "breakfast" },
]

// Note: this is a static filtered array evaluated at import time,
// not a callable function — the filter runs once when the module loads
export const filterCategories = FAKE_DATA.filter(data => {
    let userChosenOption = "breakfast"
    let { category } = data
    return category === userChosenOption
})
```

### src/index.ts
```typescript
import { area, perimeter, filterCategories } from "./helpers"

let result: number = area(4, 5)
console.log("Area: ", result)

let result2: number = perimeter(6, 7)
console.log("Perimeter: ", result2)

console.log(filterCategories)
```

---

## Compile & Run Workflow
```bash
npx tsc          # compiles src/*.ts → build/*.js
node build/index.js   # runs the compiled output
```

> Use `npx tsc` rather than a global `tsc` command so the project uses its own locally installed TypeScript version, avoiding conflicts between projects.

---

## Tips
- Follow install instructions on [npmjs.com](https://www.npmjs.com/) for any new packages
- Add `build/` and `node_modules/` to your `.gitignore`
- Make sure `tsconfig.json` `include` paths cover any helper files you add, or the compiler won't find them

---

## Related
- [[JavaScript]] — TypeScript is a typed superset of JS; understanding JS syntax and behavior is prerequisite knowledge
- [[JavaScript - Strings, Arrays, Objects]] — arrays and string templating shown in TS examples directly mirror JS syntax with added type annotations
- [[JavaScript - DOM]] — DOM manipulation in TS follows same patterns but benefits from typed element references
- [[React]] — React projects commonly use TypeScript for prop and state typing; same tsconfig/npm workflow applies
- [[Web - Forms, Navigation, and DOM Basics]] — TS enforces types on form input values and event handlers
- [[Git]] — version control workflow applies when setting up TS projects; `.gitignore` should exclude `build/` and `node_modules/`