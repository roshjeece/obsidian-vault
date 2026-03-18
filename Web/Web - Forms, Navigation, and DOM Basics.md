---

---
Start on your projects:

- Review Projects 3, then 2, then 1
- Start work sooner than later

CLI Suggestions:

You can `touch` multiple files at once:

```java
touch index.html menu.html hiring.html
```

Anchor Tags:

- Location of where you want to go
- 

```java
<a href="menu.html">Menu</a>
```

Output: hyperlink to Menu.html, titled “<u>Menu</u>”

DRY Coding:

- Don’t
- Repeat
- Yourself

Basic Navigation requires files to be within same folder

- These 3 HTML files allow you to navigate across 3 different pages:

```html
<!-- index.html -->

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<h1>Second Demo Navigation Practice</h1>
<h2>Home Page</h2>
<a href="index.html">Home</a>
<a href="menu.html">Menu</a>
<a href="hiring.html">Hiring</a>
</body>
</html>
```

```html
<!-- hiring.html -->

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<h1>Second Demo Navigation Practice</h1>
<h2>Hiring Page</h2>
<a href="index.html">Home</a>
<a href="menu.html">Menu</a>
<a href="hiring.html">Hiring</a>
</body>
</html>
```

```html
<!-- menu.html -->

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<h1>Second Demo Navigation Practice</h1>
<h2>Menu Page</h2>
<a href="index.html">Home</a>
<a href="menu.html">Menu</a>
<a href="hiring.html">Hiring</a>
</body>
</html>
```

DOM

- Document
- Object
- Model

Building…

```html
<!-- index.html -->

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<h1>Second Demo Navigation Practice</h1>
<h2>Home Page</h2>
<a href="https://www.costco.com" target="_blank">Costco</a>
<!--actual url can be used. target = blank allows you to open to a new page-->

<a class="red" href="index.html">Home</a>
<a class="red" href="menu.html">Menu</a>
<a class="red" href="hiring.html">Hiring</a>
<!--assigning a CSS class named "red" to each link-->

<a class="red" href="#doggyhorse">DoggyHorse</a>
<p id="doggyhorse" style="margin-top:1500px;">DoggyHorse!!!!</p>
<!--id referencing allows you to navigate to a specific point on the page-->
<!--there should only be one id called "doggyhorse" for the entire project. an id should only exist one time.-->

</body>
</html>
```

Understanding how to set up a class: 

[W3Schools.com](https://www.w3schools.com/html/html_classes.asp)

id and class quick reference/building:

```html
<div class="container">
    <p id="kittycat"></p>
</div>
```

This was created by typing:

- div.container —> tab
- p#kittycat —> tab

---

# Forms


![[Screenshot_2026-02-25_at_11.02.17_AM.png]]

Clean Implementation of a First/Last Name Form, with “required” tag which forces user to actually submit first and last name with in-browser warning:

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Form Demo</title>
</head>
<body>
<!--Forms: we need to know where the info is going and what the info looks like-->
<!--ONLY that which is in the form will be submitted!-->
<form>
<!--    inputs = user giving data-->
    <label>First Name:
        <input type="text" name="first_name" required> 
    </label>
<!--    Clean implementation-->
    <label>Last Name:
        <input type="test" name="last_name" required>
    </label>
<!--    The type tells the input what HTML validation and styling to use-->
<!--    The id is NOT required, but appears by default when selecting input type: text-->

    <button type="submit">Submit</button>
<!--    need to submit data-->

</form>

</body>
</html>
```

Pattern Attribute:

- Specify what characters can be used on a password:
- [W3Schools.com](https://www.w3schools.com/tags/att_input_pattern.asp)


## Related
- [[JavaScript - DOM]] — DOM selectors and events covered this session
- [[CSS]] — classes and IDs referenced in styling
- [[Intro Logistics-Decomposition-Github]] — navigation and forms introduced early in course