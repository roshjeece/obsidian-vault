## BLUF
React Hook Form (RHF) replaces manual `useState` + `onChange` form boilerplate with a single `useForm()` hook. Yup is a separate schema validation library. `yupResolver` bridges the two — RHF collects field values, hands them to Yup for validation, and populates `formState.errors` with the results.

---

## Installation

```bash
npm i react-hook-form @hookform/resolvers yup
```

---

## The Problem RHF Solves

Without RHF, every form requires:
- A `useState` call per field
- A manual `onChange` handler to update state
- Custom validation logic
- Manual error message tracking

RHF replaces all of that with one `useForm()` call. The `useState` calls still happen — they're just managed internally by RHF.

---

## Three Pieces and How They Connect

| Piece | What It Is | Role |
|---|---|---|
| `useForm()` | React hook | Manages all form state internally |
| `yup` | Standalone JS library | Defines validation rules — no React awareness |
| `yupResolver` | Adapter | Translates Yup's results into a format RHF understands |

> **Hook vs not a hook:** Hooks are functions prefixed with `use` that access React's internal machinery. `useForm` and `useState` are hooks. Yup's `object()`, `string()`, `number()` and `yupResolver` are regular JS functions — not hooks.

---

## Validation Chain on Submit
````

User submits → RHF collects all field values → Passes to yupResolver → Yup validates against userSchema → Errors flow back into formState.errors → React renders error messages conditionally

````

---

## Defining a Yup Schema

```jsx
import * as yup from "yup"

const { object, string, number } = yup

const userSchema = object({
    fname:    string().required("First name is required"),
    lname:    string().required("Last name is required"),
    age:      number().required("Age is required"),
    email:    string().required("Email is required"),
    password: string()
                .min(8, "Password must be at least 8 characters")
                .required("Password is required")
})
```

- `object()` — defines the shape of the form data object, specifying keys and their rules
- `string()` — ensures the value is a string; enables text-specific validation methods
- `number()` — ensures the value is a number; handles numeric constraints
- Chain `.required()`, `.min()`, `.max()`, `.email()` etc. to build rules
- The string passed to each method is the error message RHF will surface

---

## Destructuring useForm()

```jsx
const {
    register,
    handleSubmit,
    reset,
    formState: { errors }
} = useForm({
    resolver: yupResolver(userSchema),  // plug Yup in as the validator
    mode: "onBlur"                      // validate when the user leaves a field
})
```

| Destructured | What It Does |
|---|---|
| `register` | Wires an input to RHF — attaches onChange, onBlur, ref, and name automatically |
| `handleSubmit` | Wraps your submit function — runs validation before calling it |
| `reset` | Resets all fields to initial values |
| `formState: { errors }` | Object containing validation errors per field |

---

## Key Piece: register

```jsx
<input
    type="text"
    {...register("fname", { onChange: logChange })}
/>
```

`{...register("fname")}` spreads RHF's own `onChange`, `onBlur`, `ref`, and `name` props onto the input. This is how the field's value is tracked without a manual `handleChange`. The optional second argument lets you pass additional handlers alongside RHF's — here, `logChange` fires on every keystroke for console logging.

---

## Rendering Validation Errors

```jsx
{errors.fname && <p>{errors.fname.message}</p>}
```

- `errors.fname` — truthy if RHF found a validation error on that field
- `&&` — short-circuit: if no error, React renders nothing; if error exists, renders the `<p>`
- `errors.fname.message` — the string you defined in the Yup schema

---

## Full Component

```jsx
import React from 'react'
import { useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import * as yup from "yup"

const { object, string, number } = yup

const userSchema = object({
    fname:    string().required("First name is required"),
    lname:    string().required("Last name is required"),
    age:      number().required("Age is required"),
    email:    string().required("Email is required"),
    password: string()
                .min(8, "Password must be at least 8 characters")
                .required("Password is required")
})

const App = () => {

    const {
        register,
        handleSubmit,
        reset,
        formState: { errors }
    } = useForm({
        resolver: yupResolver(userSchema),
        mode: "onBlur"
    })

    // In a real app, replace console.log with a fetch/axios POST call
    const onSubmit = (data) => {
        console.log(data)
        reset()
    }

    const logChange = (event) => {
        console.log(`${event.target.name}: ${event.target.value}`)
    }

    return (
        <>
            <form onSubmit={handleSubmit(onSubmit)}>

                <label>First Name:
                    <input type="text" {...register("fname", { onChange: logChange })} />
                </label>
                {errors.fname && <p>{errors.fname.message}</p>}

                <label>Last Name:
                    <input type="text" {...register("lname", { onChange: logChange })} />
                </label>
                {errors.lname && <p>{errors.lname.message}</p>}

                <label>Age:
                    <input type="number" {...register("age", { onChange: logChange })} />
                </label>
                {errors.age && <p>{errors.age.message}</p>}

                <label>Email:
                    <input type="email" {...register("email", { onChange: logChange })} />
                </label>
                {errors.email && <p>{errors.email.message}</p>}

                <label>Password:
                    <input type="password" {...register("password", { onChange: logChange })} />
                </label>
                {errors.password && <p>{errors.password.message}</p>}

                <button type="submit">Submit</button>
                <button type="button" onClick={reset}>Reset</button>

            </form>
        </>
    )
}

export default App
```

---

## Related
- [[React - Forms]] — manual controlled form pattern that RHF replaces; understand this first
- [[React - Routing and State Management]] — useState and event handling fundamentals that RHF abstracts
- [[React - Implementing Endpoint & APIs]] — onSubmit can be replaced with a fetch POST call to a real API
- [[React]] — component structure, JSX, and hooks fundamentals
- [[Fat Arrow Function]] — arrow functions used for all handlers and component definitions
- [[Introduction to TDD Arrange]] — validation logic in userSchema is a natural candidate for unit tests