# React

**React** is a JavaScript library for building user interfaces using reusable components. It is the frontend framework required for the capstone project.

> This note is a placeholder — React is covered in weeks 9-12. Update as you learn.

---

## Core Concepts (Preview)

- **Components** — reusable UI building blocks, written as functions
- **JSX** — HTML-like syntax written inside JavaScript
- **Props** — data passed into a component from its parent
- **State** — data managed inside a component that triggers re-renders when changed
- **Hooks** — functions like `useState` and `useEffect` that add functionality to components

---

## Basic Component Structure

```jsx
function MyComponent({ name }) {
    return (
        <div>
            <h1>Hello, {name}</h1>
        </div>
    );
}
```

---

## MUI (Material UI)

The capstone requires MUI components — not plain HTML. MUI provides pre-built, styled React components.

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

---

## Study Topics
- [ ] useState and useEffect hooks
- [ ] Component composition and props
- [ ] Fetching data from a Spring Boot API
- [ ] React Router for multi-page apps
- [ ] MUI component library

---

## Babel

Note who the "child" is:
![[Pasted image 20260323112515.png]]
The following will not work, it must be wrapped in a parent container:
![[Pasted image 20260323112717.png]]

You must wrap it all in a fragment:
![[Pasted image 20260323112800.png]]

## JSX: HTML inside JavaScript

```JSX
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

![[Pasted image 20260323115422.png]]

---

## Data Flow
For right now, data can only flow down from parent to child (for now), for the purposes of this class

## Related
- [[JavaScript - Introduction]] — React is built on JavaScript fundamentals
- [[JavaScript - Strings, Arrays, Objects]] — arrays and objects are used heavily in React state
- [[JavaScript - DOM]] — React abstracts the DOM but understanding it helps
- [[TypeScript]] — React can be written in TypeScript
- [[Spring Framework]] — React frontend pairs with Spring Boot backend in the capstone
- [[Final Project Contextualization]] — capstone requires React + MUI
