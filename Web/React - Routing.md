###### Standard Project Setup, and then...
1. `npm i react-router react-router-dom`
2. Verify new dependencies in `package.json`

###### Basic Routing Structure
```jsx
import Home from "./pages/Home.jsx";
import About from "./pages/About.jsx";
import Contact from "./pages/Contact.jsx";
import {BrowserRouter as Router, Routes, Route, Link} from "react-router-dom"

const App = () => {

  return (
      <Router>
          <div className="App">
              <div className="container">
                  <ul>
                      <li><Link to="/home">Home</Link></li>
                      <li><Link to="/about">About</Link></li>
                      <li><Link to="/contact">Contact</Link></li>
                  </ul>
                  <Routes>
                    <Route path="/home" element={<Home/>} />
                    <Route path="/about" element={<About/>} />
                    <Route path="/contact" element={<Contact/>} />
                  </Routes>
              </div>
          </div>
      </Router>

  )
}

export default App;
```

Practice: Implement React Bootstrap Navbar

---

## States

Think if "Count is n" button on default React App page
State management:
- State is set to 0 by default
```jsx
function App() {  
  const [count, setCount] = useState(0)
```

###### State Management Practice
- user types in input
- clicks button to see password
- clicks button to hide password