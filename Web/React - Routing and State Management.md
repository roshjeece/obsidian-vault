## BLUF
React Router enables multi-page navigation without full page reloads — the browser URL changes but React swaps components in place. State is data owned by a component that, when changed via its setter, triggers a re-render. These two concepts together cover navigation and dynamic UI behavior.

---

## React Router Setup

Start from standard Vite project setup, then:
```bash
npm i react-router react-router-dom
```

Verify `react-router` and `react-router-dom` appear under `dependencies` in `package.json` before continuing.

---

## Core Routing Concepts

| Piece | Role |
|---|---|
| `<Router>` | Wraps the entire app — enables routing context for everything inside |
| `<Routes>` | Container for all your `<Route>` definitions |
| `<Route>` | Maps a URL path to a component |
| `<Link>` | Renders an anchor tag that changes the URL without a full page reload |

---

## Basic Routing Structure

Organize page-level components in a `src/pages/` folder — one file per route.
```jsx
import Home from "./pages/Home.jsx"
import About from "./pages/About.jsx"
import Contact from "./pages/Contact.jsx"
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom"

const App = () => {
    return (
        <Router>
            <div className="App">
                <nav>
                    <ul>
                        <li><Link to="/home">Home</Link></li>
                        <li><Link to="/about">About</Link></li>
                        <li><Link to="/contact">Contact</Link></li>
                    </ul>
                </nav>
                <Routes>
                    <Route path="/home" element={<Home />} />
                    <Route path="/about" element={<About />} />
                    <Route path="/contact" element={<Contact />} />
                </Routes>
            </div>
        </Router>
    )
}

export default App
```

> **Practice:** Replace the plain `<ul>` nav with a React Bootstrap `<Navbar>` component.

---

## State Management

State is data owned by a component. When the setter is called, React re-renders the component with the new value.
```jsx
const [count, setCount] = useState(0)
//     ^^^^^  ^^^^^^^^          ^
//     value  setter            initial value
```

- First element: the current value
- Second element: the function that updates it — **never mutate the value directly**
- Initial value: whatever you pass into `useState()`

---

## Practice: Hide / Show Password

Demonstrates boolean state toggling — clicking a button flips between two input types.
```jsx
import { useState } from "react"

const App = () => {
    // false = password hidden, true = password visible
    const [isVisible, setIsVisible] = useState(false)

    const handleClick = (event) => {
        event.preventDefault()          // prevent form submission
        setIsVisible(!isVisible)        // flip the boolean
    }

    return (
        <>
            <h1>Hide / Show Password</h1>
            <form>
                <label>
                    Password:
                    <input type={isVisible ? "text" : "password"} />
                </label>
                <button onClick={handleClick}>Show / Hide</button>
            </form>
        </>
    )
}

export default App
```

**What's happening step by step:**
1. `isVisible` starts as `false` → input renders as `type="password"`
2. User clicks the button → `handleClick` fires
3. `event.preventDefault()` stops the form from submitting
4. `setIsVisible(!isVisible)` flips the boolean → triggers re-render
5. Input re-renders as `type="text"` — password is now visible
6. Next click flips it back

> The ternary `isVisible ? "text" : "password"` is inline conditional rendering — the input's `type` attribute is determined dynamically by state on every render.

---

## Related
- [[React]] — component structure, JSX rules, props fundamentals
- [[React - Implementing Endpoint & APIs]] — useState used with fetch to store and display API data
- [[Fat Arrow Function]] — arrow functions used for components and event handlers throughout
- [[Forms, Navigation, and DOM Basics]] — vanilla JS form/navigation patterns that React Router replaces
- [[JavaScript - DOM]] — understanding what React Router is abstracting at the browser level
- [[CSS - Bootstrap]] — Bootstrap navbar pattern referenced in routing practice
- [[React - Forms]] — multi-field object state is a direct extension of the boolean toggle pattern introduced here