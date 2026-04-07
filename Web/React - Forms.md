## BLUF
React forms don't use HTML's built-in `action`/`method` attributes. Everything is event-driven — you control what happens on change and on submit. The standard pattern is one state object holding all field values, updated by a single `handleChange` function using the spread operator.

---

## HTML Forms vs React Forms

| | Traditional HTML | React |
|---|---|---|
| Submission trigger | `action="/endpoint" method="POST"` | `onSubmit={handleSubmit}` |
| Data flow | Browser handles it | You control it entirely |
| Default behavior | GET request, page reloads | Must call `event.preventDefault()` |
| Field values | Uncontrolled by default | Controlled via state |

---

## Basic JSX Form Structure
```jsx
const App = () => {
    return (
        <>
            <h1>Form Demo</h1>
            <form>
                <label>First Name:
                    <input type="text" />
                </label>
                <label>Password:
                    <input type="password" />
                </label>
                <label>Age:
                    <input type="number" />
                </label>
                <button type="submit">Submit Form</button>
            </form>
        </>
    )
}
```

This is uncontrolled — no state, no handlers. Starting point only.

---

## Controlled Form Pattern

Instead of managing separate state for every field, use one state object and one handler.

### State Initialization
```jsx
const initialData = {
    fname: "",
    password: "",
    age: ""
}

const [data, setData] = useState(initialData)
```

### handleChange — One Function for All Fields
```jsx
const handleChange = (evt) => {
    // Spread existing data, then overwrite only the field that changed
    // evt.target.name matches the input's name attribute
    // evt.target.value is the current input value
    const value = evt.target.name === "age" ? Number(evt.target.value) : evt.target.value
    setData({ ...data, [evt.target.name]: value })
}
```

- `[evt.target.name]` — computed property key, dynamically targets the correct field
- `...data` — spreads all existing field values so they aren't overwritten
- Age is explicitly cast to `Number` — all input values are strings by default

### handleSubmit — POST Request on Submit
```jsx
const handleSubmit = (event) => {
    event.preventDefault()      // stop the default page reload

    const endpoint = "https://jsonplaceholder.typicode.com/posts"
    const options = {
        method: "POST",
        body: JSON.stringify(data),         // convert state object to JSON string
        headers: {
            "Content-Type": "application/json"
        }
    }

    fetch(endpoint, options)
        .then(response => response.json())
        .then(parsedData => console.log(parsedData))
        .catch(error => console.error(error))
}
```

---

## useEffect for Safe Logging

Log form data in real time without exposing the password field to the console:
```jsx
useEffect(() => {
    const { password, ...safeData } = data     // destructure password out, keep the rest
    console.log(safeData)
}, [data])                                     // runs after render, only when data changes
```

> The dependency array `[data]` means this effect re-runs only when `data` changes — not on every render. Without it, the effect would fire on every render cycle.

---

## Full Component
```jsx
import { useEffect, useState } from "react"

const App = () => {

    const initialData = {
        fname: "",
        password: "",
        age: ""
    }

    const [data, setData] = useState(initialData)

    useEffect(() => {
        const { password, ...safeData } = data
        console.log(safeData)
    }, [data])

    const handleChange = (evt) => {
        const value = evt.target.name === "age" ? Number(evt.target.value) : evt.target.value
        setData({ ...data, [evt.target.name]: value })
    }

    const handleSubmit = (event) => {
        event.preventDefault()

        const endpoint = "https://jsonplaceholder.typicode.com/posts"
        const options = {
            method: "POST",
            body: JSON.stringify(data),
            headers: { "Content-Type": "application/json" }
        }

        fetch(endpoint, options)
            .then(response => response.json())
            .then(parsedData => console.log(parsedData))
            .catch(error => console.error(error))
    }

    return (
        <>
            <h1>Form Demo</h1>
            <form onSubmit={handleSubmit}>
                <label>First Name:
                    <input
                        type="text"
                        onChange={handleChange}
                        name="fname"
                        value={data.fname}
                        autoComplete="off"
                        required
                        maxLength={3}
                    />
                </label>
                <label>Password:
                    <input
                        type="password"
                        onChange={handleChange}
                        name="password"
                        value={data.password}
                        pattern="123"
                        minLength={3}
                    />
                </label>
                <label>Age:
                    <input
                        type="number"
                        onChange={handleChange}
                        name="age"
                        value={data.age}
                        min={21}
                        max={99}
                    />
                </label>
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </form>
        </>
    )
}

export default App
```

---

## Input Validation Attributes

| Attribute | Field | Effect |
|---|---|---|
| `required` | fname | Blocks submit if empty |
| `maxLength={3}` | fname | Caps input at 3 characters |
| `pattern="123"` | password | Must match exactly "123" |
| `minLength={3}` | password | Minimum 3 characters |
| `min={21}` | age | Minimum value 21 |
| `max={99}` | age | Maximum value 99 |

---

## Related
- [[React]] — component structure, JSX rules, props and state fundamentals
- [[React - Routing and State Management]] — useState pattern introduced here; forms extend it to multi-field objects
- [[React - Implementing Endpoint & APIs]] — same fetch + POST pattern used in handleSubmit
- [[Forms, Navigation, and DOM Basics]] — vanilla JS form handling that React replaces
- [[HTML]] — HTML form elements and attributes that carry over into JSX
- [[Fat Arrow Function]] — arrow functions used for all handlers in this note