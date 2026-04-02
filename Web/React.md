## BLUF
React is a JavaScript library for building user interfaces using reusable components. Your capstone requires React with MUI (Material UI) — no plain HTML. You write components as functions, compose them together, and let React handle DOM updates.

---

## Setup
```bash
npm create vite@latest [AppFolderName]   # scaffold the project
cd [AppFolderName]
npm install                              # install dependencies
npm run dev                             # start dev server
```

Primary work happens in `src/App.jsx`. Delete the boilerplate Vite content and start fresh.

---

## Core Concepts

| Concept       | What It Is                                                                                      |
| ------------- | ----------------------------------------------------------------------------------------------- |
| **Component** | A reusable UI building block written as a JS function that returns JSX                          |
| **JSX**       | HTML-like syntax written inside JavaScript — compiled by Babel to `React.createElement()` calls |
| **Props**     | Data passed into a component from its parent — read-only inside the child                       |
| **State**     | Data managed inside a component — changing it triggers a re-render                              |
| **Hooks**     | Functions like `useState` and `useEffect` that add functionality to components                  |

---

## JSX Rules

JSX looks like HTML but has stricter rules enforced by Babel.

**Every component must return a single root element.** Siblings must be wrapped — use a fragment (`<>...</>`) to avoid adding an extra DOM node:
```jsx
// ❌ Won't compile — two sibling elements with no parent
return (
    <h1>Title</h1>
    <p>Paragraph</p>
)

// ✅ Wrapped in a fragment
const App = () => {
    return (
        <>
            <h1>My First React Demo</h1>
            <p>Mr. Stark, I don't feel so good...</p>
        </>
    )
}

export default App;
```

---

## Basic Component Structure
```jsx
// Define a component — accepts props as a destructured object
function MyComponent({ name }) {
    return (
        <div>
            <h1>Hello, {name}</h1>
        </div>
    );
}

// Use it inside another component
function App() {
    return <MyComponent name="Joshua" />;
}
```

---

## Data Flow

Data flows **down only** — parent to child via props. A child cannot directly modify the parent's state. This is the core constraint for this course; more advanced patterns (lifting state up, Context) come later.
```
App (owns state)
 └── MyComponent (receives props, read-only)
```

---

## MUI (Material UI)

The capstone requires MUI components — not plain HTML elements. MUI provides pre-built, styled React components that follow Material Design.
```bash
npm install @mui/material @emotion/react @emotion/styled
```
```jsx
import { Button, TextField } from '@mui/material';

function MyForm() {
    return (
        <div>
            <TextField label="Name" />
            <Button variant="contained">Submit</Button>
        </div>
    );
}
```

Common MUI components to know: `Button`, `TextField`, `Box`, `Typography`, `Stack`, `Card`, `AppBar`.

---

## Study Topics
- `useState` and `useEffect` hooks
- Component composition and props
- Fetching data from a Spring Boot API
- React Router for multi-page apps
- MUI component library

---

## Related
- [[JavaScript - Introduction]] — React is built on JS fundamentals; components are just functions
- [[JavaScript - Strings, Arrays, Objects]] — arrays and objects are used heavily in React state and props
- [[JavaScript - DOM]] — React abstracts the DOM; knowing the real DOM clarifies what React is doing under the hood
- [[TypeScript]] — React can be written in TypeScript; same tsconfig/npm workflow applies
- [[Spring Framework]] — React frontend pairs with Spring Boot backend in the capstone
- [[Final Project Contextualization]] — capstone requires React + MUI specifically
- [[React - Implementing Endpoint & APIs]] — fetch + useState pattern for consuming REST APIs; core to the capstone
- [[React - Routing and State Management]] — React Router setup and useState toggle pattern; extends core component concepts
- [[Fat Arrow Function]] — arrow functions are used for component definitions and event handlers throughout React