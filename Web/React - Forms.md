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