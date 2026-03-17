---

---
- Document Object Model

> [!note]+ The DOM is the interface that connects JS, HTML, and CSS
> - It consists of JS objects, properties, and functions used to interact with HTML and CSS
> - Using the DOM, you can change…
> 
> ---

HTML in the code is transformed into a set of JS objects, with each object representing an element

The DOM provides a structured model that visualizes how these elements are organized

The top-level object…

With the object model, JS has all the power it needs to create dynamic HTML. It can:

- Change HTML elements in the page
- Change HTML attributes in the page
- Change CSS styles in the page
- Remove existing HTML elements and attributes
- Add new HTML elements and attributes
- React to all existing HTML events in the page
- Create new HTML events in the page

Dev Tools

- You can inspect the contents of the document objet in Chrome by typing:
`console.dir(document);`

Strategy in DOM:

- Select an element
    - This is a property with a value that you can get or set (like changing…)
- Manipulate the element

Selectors

- Several methods for selecting elements:
    - `document.getElementById();`
    - … `getElementsByClassName();`
    - … `getElementsByTagName();` 
    - … `querySelector();`
    - … `querySelectorAll();`
- **Everything we do with DOM manipulation starts with “document”**

Example:

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DOM - Demo 1</title>
</head>
<body>

    <h1>Avengers</h1>
    <h1>X-Men</h1>

    <ul>
        <li id="teamLeader">Wolverine</li>
        <li class="mutant">Cyclops</li>
        <li class="mutant">ShadowCat</li>
    </ul>

    <script>
        let xmenTeamLeader = document.getElementById("teamLeader");
        console.log(xmenTeamLeader)
    </script>

</body>
</html>
```

Within Browser DevTools:

```html
<li id="teamLeader">
	::marker
	"Wolverine"
</li>
```

`getElementsByClassName()`

```javascript
let mutants = document.getElementsByClassName("mutant");
console.log(mutants);
console.log(mutants[1]);
```

Output:

```javascript
HTMLCollection(2)0:
li.mutant1:
li.mutant
length: 2
[[Prototype]]: HTMLCollection

<li class="mutant">
	::marker
	"ShadowCat"
</li>
```

`getElementsByTagName`

```javascript
let allXmen = document.getElementsByTagName("li")
console.log(allXmen[1])
```

Output:

```javascript
<li class="mutant">
	::marker
	"Cyclops"
</li>
```


`querySelector()`

```javascript
let selectedXmen = document.querySelector(".mutant")
console.log(selectedXmen)
```

Output:

```javascript
<li class="mutant">
	::marker
	"Cyclops"
</li>
```

`querySelectorAll()`

```javascript
let allXmen = document.querySelectorAll("h1")
console.log(allXmen)
```

Output:

```javascript
NodeList(2)
	0: h1
	1: h1
	length: 2[
	[Prototype]]: NodeList
```

Styles

- Use the style property to manipulate styles:
`document.selector.style.property = value;`

Will Work:

```javascript
        let allTeams = document.querySelector("h1")
        allTeams.style.color = "red"
        allTeams.style.border = "green 3px solid";
        allTeams.style.fontSize = "48px";
```

Will NOT Work:

```javascript
        let allTeams = document.querySelectorAll("h1")
        allTeams.style.color = "red"
        allTeams.style.border = "green 3px solid";
        allTeams.style.fontSize = "48px";
```

Modify to:

```javascript
        let allTeams = document.querySelectorAll("h1")[1]
        allTeams.style.color = "red"
        allTeams.style.border = "green 3px solid";
        allTeams.style.fontSize = "48px";
```

Setters / Getters - Taking the above, allowing me to specify the element I want to modify

```javascript
    <ul>
        <li id="teamLeader">Wolverine</li>
        <li class="mutant">Cyclops</li>
        <li class="mutant">ShadowCat</li>
    </ul>

    <script>
        let allTeams = document.querySelectorAll("h1")
        let teamContent = allTeams[0].textContent
        console.log(teamContent)
        allTeams[1].textContent = "New Mutants"
    </script>
```

Output:

![[image 3.png]]

innerHTML

Set or get the value of the element’s HTML

Events

```javascript
// Clicking Something and making it change:
        const rosterHeader = document.querySelector("h1")
        rosterHeader.addEventListener("click", (event) => {
            console.log("You clicked the h1.")
            rosterHeader.textContent = "Avengers Assemble!"
        })
```

Console Log: “clicked h1”

```html
    <script>
        const rosterHeader = document.querySelector("h1")
        rosterHeader.addEventListener("click", () => {
            console.log("Clicked h1")
        })
    </script>
```

Bringing it all together:

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DOM - Demo 1</title>
</head>
<body>

    <h1>X-Men Roster Application</h1>
    <form action="/cerebro">
        <label for="first_name">First Name: </label>
        <input type="text" name="fname" id="first_name" />
        <br/><br/>
        <label for="">
            Password: <input type="password" name="pw" id="pw">
        </label>
        <br/><br/>
        <label for="">Are you alive?</label>
        <input type="radio" name="alive" id="yes" value="yes" />
        <label for="yes">Yes</label>

        <input type="radio" name="alive" id="no" value="no" />
        <label for="no">No</label>

        <button type="submit">Join Team</button>
    </form>

    <script>
        const form = document.getElementsByTagName("form")
        form[0].addEventListener("submit", (event) => {
            event.preventDefault()
            let firstName = document.getElementById("first_name")
            let password = document.getElementById("pw")
            let isAlive = document.querySelector('input[name="alive"]:checked')
            console.log("Submitted")
            // console.log("Value from first name input: ", firstName.value, password.value, isAlive.value)
            let newData = {
                firstName: firstName.value,
                password: password.value,
                isAlive: isAlive.value
            }


            console.log(JSON.stringify(newData))
        })
    </script>




</body>
</html>
```

---

Object Script

```javascript
let dog = "woof"
let cat = "meow"

let animals = {
    canine: dog,
    cat: cat
}

console.log(animals.cat)
// cat refers to 'key' of cat, which is cat
```

Written Better:

```javascript
let dog = "woof"
let cat = "meow"

let animals = {
    dog,
    cat
}

console.log(animals.cat)
// cat refers to 'key' of cat, which is cat
```

Console Log as JSON:

```javascript
let dog = "woof"
let cat = "meow"

let animals = {
    dog,
    cat
}

console.log(animals.cat)
// cat refers to 'key' of cat, which is cat

console.log(animals["dog"])
console.log(animals.dog)
console.log(animals[dog])
```

Output:

```bash
➜  Objects git:(main) ✗ node script.js 
meow
woof
woof
```

## Related
- [[JavaScript]] — JS fundamentals required for DOM manipulation
- [[JavaScript - Strings, Arrays, Objects]] — objects and arrays used in DOM scripts
- [[CSS]] — DOM manipulation can dynamically modify CSS styles
- [[CSS - Bootstrap]] — Bootstrap components are targeted via DOM selectors
- [[Web - Forms, Navigation, and DOM Basics]] — forms and DOM selectors used together
- [[_INDEX - Beginning Web Programming]] — course overview
- [[Spring Framework]] — DOM manipulation is the frontend counterpart to Spring REST endpoints