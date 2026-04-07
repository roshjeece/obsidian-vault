### Traditional HTML Form using JSX
```jsx
const App = () => {  
    return (  
        <>  
            <h1>Form Demo</h1>  
            <form>                <label>First Name:  
                    <input type="text"/>  
                </label>  
                <br/><br/>                <label>Password:  
                    <input type="password"/>  
                </label>  
                <br/><br/>                <label>Age:  
                    <input type="number"/>  
                </label>  
                <br/><br/>                <button type="submit">Submit Form</button>  
            </form>  
        </>  
    )  
}  
export default App;
```

Action: /doggyHorse
- GET Request
- The /doggyHorse is telling your server what to do
- Default method is a GET Request

Difference with React:
- No default action
- You have to control the actions from within the Form, you must dictate what will happen
- You do not use an action within React
- Everything is **event based** within React (e.g., **onClick**)

Handling Changes
- You don't want to have to manage the states and data of MANY fields on a form
- Handle changes within one function

```jsx
const App = () => {  
  
    const initialData = {  
        fname: "",  
        password: "",  
        age: 0  
    }  
  
    const [data, setData] = useState(initialData)  
    
    const handleChange = (evt) => {  
        setData({...data, [evt.target.name]: evt.target.value})  
        console.log(data)  
    }
```


### Full Form Program:
```jsx
import {useEffect, useState} from "react";  
  
const App = () => {  
  
    // Initialized Data for the Form  
    const initialData = {  
        fname: "",  
        password: "",  
        age: ""  
    }  
  
    // Array Destructure  
    // useState returns an array with two elements    // 1. The current state value    // 2. The name of the function to update it (React already created this function, I'm just naming it)    const [data, setData] = useState(initialData)  
  
    // Real time console logging of form field data, with password protected from console view  
    // Password is still accessible via data.password    // With data in the dependency array, useEffect runs after the initial render, and then    // only again when data changes. If anything else in the component re-renders but [data]    // does not change, the effect is skipped    useEffect(() => {  
        const {password, ...safeData} = data  
        console.log(safeData)  
    }, [data])  
  
    // When data is changed, check to see if the age is changed. That value will be stored as a Number  
    // Whenever any data is changed, we're calling the setData function within React    const handleChange = (evt) => {  
        const value = evt.target.name === "age" ? Number(evt.target.value) : evt.target.value  
        setData({...data, [evt.target.name]: value})  
    }  
  
    const handleSubmit = (event) => {  
  
        // Prevent auto page reload  
        event.preventDefault()  
  
        // Fake REST API  
        const endpoint = "https://jsonplaceholder.typicode.com/posts"  
        let options = {  
            method: "POST",  
  
            // Convert data object from FS to JSON string  
            body: JSON.stringify(data),  
            headers: {  
                "Content-Type": "application/json"  
            }  
        }  
  
        // Fetching from the endpoint via a POST request (as detailed in options)  
        // Collecting the raw data, then parsing it out appropriately        // Handling error logging        fetch(endpoint, options)  
            .then(response => response.json())  
            .then(parsedData => console.log(parsedData))  
            .catch(error => console.error(error))  
    }  
  
    return (<>  
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
            <br/><br/>            <label>Password:  
                <input  
                    type="password"  
                    onChange={handleChange}  
                    name="password"  
                    value={data.password}  
                    pattern={"123"}  
                    minLength={3}  
                />  
            </label>  
            <br/><br/>            <label>Age:  
                <input  
                    type="number"  
                    onChange={handleChange}  
                    name="age"  
                    value={data.age}  
                    min={21}  
                    max={99}  
                />  
            </label>  
            <br/><br/>            <button type="submit">Submit</button>  
            <button type={"reset"}>Reset</button>  
        </form>  
    </>)  
}  
export default App;
```