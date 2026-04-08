What is yup?
- https://www.npmjs.com/package/yup
- Schema builder

To Build:
`npm i react-hook-form @hookform/resolvers yup`

Register: this method allows you to register an input or select element and apply validation rules to React Hook Form


What is a Hook?
- Functions prefixed with `use` that let you access React's internal machinery (state, lifecycle, context)
- `useForm` is a hook
- `useState` is a hook
- `userSchema` and the yup methods are **NOT** hooks, they're regular JS objects and functions

What is Yup?
- Library, has nothing to do with React hooks
- Schema validation library
- Define the shape and rules of your data with `object()`, `string()`, etc

Connection to RHF:
- thru `yupResolver`
- translates yup's validation results into a format RHF understands

Summary: useForm is the hook that manages form state, yup is a validation schema library, yupResolver bridges the two


What's the point of React-Hook-Form (RHF)?
- Without RHF, managing a form means:
	- manually wiring up useState for every field
	- writing your own onChange handlers to update state
	- writing your own validation logic
	- tracking error messages yourself
- This is a lot of boilerplate for a 5-field form
- RHF replaces all of that with a single useForm() hook call

Destructuring useForm():
- register, handleSubmit, reset, fromState
- receive a set of tools that internally manage all that state for you
- useState calls happening under the hood

Key Piece: Register
- `{...register("fname")}`: RFH attaches its own onChange, onBlur, ref, and name props to that input
- This is how the field's value is tracked w/o me doing anything

What's Yup's role?
- Validation rules
- No awareness of React or forms
- Allows you to define:
	- "fname must be a string and is required, password must be at least 8 characters"
- `yupResolver` is the translator. When RHF is about to validate (on submit, or on blur depending on config), instead of using its own built-in validation it hands the form data off to yup through the resolver, gets back any errors, and populates `formState.errors` for me to render

Chain of Information:
1. User Submits
2. RHF collects field values
3. Passes to yupResolver
4. yup validates against userSchema
5. Errors flow back into formState.errors