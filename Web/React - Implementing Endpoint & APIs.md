# React - API Fetching and useState

## BLUF
`useState` stores data that, when changed, triggers a re-render. `fetch()` makes HTTP requests to external APIs. Combining them is the core pattern for consuming live data in React — request data, parse the response, store it in state, let React update the UI.

---

## Setup Notes
- Bootstrap is loaded via CDN in `index.html` — no npm install needed for this demo
- Comment out or delete `index.css` import in `main.jsx` to avoid style conflicts with Bootstrap
- `react-bootstrap` must be installed separately: `npm install react-bootstrap`

---

## Consuming an API — What to Know First

Before writing any fetch code, identify these five things about your endpoint:

| Question | This Project |
|---|---|
| Endpoint URL | `https://dog.ceo/api/breed/australian/shepherd/images/random` |
| HTTP Verb | GET |
| Response Format | JSON |
| Response Shape | `{ message: "<image url>", status: "success" }` |
| How much data | Single object (one random image URL) |

---

## Core Pattern: fetch + useState
```jsx
const [imgPath, setImgPath] = useState("")

const handleClickForRandomImage = () => {
    let endpoint = "https://dog.ceo/api/breed/australian/shepherd/images/random"

    fetch(endpoint)
        .then(response => {
            if (response.ok) {
                return response.json()      // parse JSON only if response was successful
            } else {
                throw Error("Response is not okay!")
            }
        })
        .then(parsedData => {
            setImgPath(parsedData.message)  // store the image URL in state → triggers re-render
        })
        .catch(error => {
            console.log(error)              // network failure or thrown error lands here
        })
}
```

**Chain breakdown:**

| Step | What it does |
|---|---|
| `fetch(endpoint)` | Makes the GET request, returns a Promise |
| `.then(response => ...)` | Receives the raw HTTP response — check `response.ok` before parsing |
| `response.json()` | Parses the response body as JSON — also returns a Promise |
| `.then(parsedData => ...)` | Receives the parsed JS object — this is where you read your data |
| `.catch(error => ...)` | Catches any thrown error from any step above |

> **Never directly mutate state.** Always use the setter (`setImgPath`), not direct assignment. React won't detect the change otherwise and won't re-render.

---

## useEffect — Running Code on Mount

`useEffect` with an empty dependency array (`[]`) runs once after the component first renders — equivalent to "on page load."
```jsx
useEffect(() => {
    handleClickForRandomImage()   // fetch a dog image immediately on load
}, [])                            // [] means: run once, don't re-run on re-renders
```

Without `[]`, the effect would re-run every render — including the re-render triggered by `setImgPath`, causing an infinite loop.

---

## Full Component
```jsx
import { useState, useEffect } from "react"
import { Button, Image } from "react-bootstrap"

const App = () => {
    const [imgPath, setImgPath] = useState("")

    useEffect(() => {
        handleClickForRandomImage()
    }, [])

    const handleClickForRandomImage = () => {
        let endpoint = "https://dog.ceo/api/breed/australian/shepherd/images/random"

        fetch(endpoint)
            .then(response => {
                if (response.ok) {
                    return response.json()
                } else {
                    throw Error("Response is not okay!")
                }
            })
            .then(parsedData => {
                setImgPath(parsedData.message)
            })
            .catch(error => {
                console.log(error)
            })
    }

    return (
        <>
            <h1>Dog Image Generator</h1>
            <Button variant="danger">DO NOT PRESS</Button>
            <button onClick={handleClickForRandomImage}>Click for Random Image</button>
            {imgPath && <Image src={imgPath} roundedCircle />}
        </>
    )
}

export default App
```

> `{imgPath && <Image ... />}` — conditional rendering. The image only renders once `imgPath` has a value. Empty string is falsy, so nothing renders on initial load before the first fetch completes.

---

## axios as an Alternative

`axios` is a third-party library that simplifies fetch syntax — response parsing is automatic and errors are thrown automatically for non-2xx responses.
```jsx
axios.get(endpoint)
    .then(response => {
        setImgPath(response.data.message)   // no response.json() needed
    })
    .catch(error => {
        console.log(error)
    })
```

Install with: `npm install axios`

---

## Related
- [[JavaScript - Introduction]] — Promises, arrow functions, and destructuring used throughout
- [[JavaScript - Strings, Arrays, Objects]] — JSON response data maps directly to JS objects
- [[JavaScript - DOM]] — React is abstracting DOM updates that would otherwise be manual
- [[React]] — component structure, JSX rules, props and state fundamentals
- [[Spring Framework]] — same fetch/axios pattern used to consume your Spring Boot REST API in the capstone
- [[Final Project Contextualization]] — capstone will use this fetch + useState pattern against a real backend

## Suggested Backlinks


**Spring Framework**
```
- [[React - Implementing Endpoint & APIs]] — demonstrates how the React frontend consumes Spring Boot API endpoints using fetch and axios
```