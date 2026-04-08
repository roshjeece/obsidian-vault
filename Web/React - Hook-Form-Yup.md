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
