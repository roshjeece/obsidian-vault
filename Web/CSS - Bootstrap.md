---

---
Reference: [Bootstrap](https://getbootstrap.com/)

What is Bootstrap?

- CSS framework
- Allows for standardized front end web development
- Makes working with CSS easier

What is a framework?

- Prewritten code

Pros:

- Fast and convenient
- Someone else did the work
- It might be cooked better than you could do yourself

Cons:

- You don’t always know what’s in the meat
- Customizing is not always an option
- You become too dependent on it and it becomes a crutch (your skills get rusty)

USE BOOTSTRAP ON ALL PROJECTS GOING FORWARD

Example Bootstrap Button Implementation:

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
<h1>Hello, world!</h1>
<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>

<button type="button" class="btn btn-link">Link</button>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
```

Output:

![[image 4.png]]

Without going into all the different examples, this link is a great reference to all the different things you can implement with Bootstrap:

[Get started with Bootstrap](https://getbootstrap.com/docs/5.3/getting-started/introduction/)

---

# Bootstrap Grid System

- XXL
- XL
- L
- M
- S
- XS

- Bootstrap is 12 x 12 grid

How does the grid system work?

- Every time you use the grid, you must use a container
- Within the container, you define a row
- Within the row, you define your columns

```html
<div class="col-xl-*"></div>
<!--on XL devices, take up * number of columns-->
<div class="col-l-*"></div>
<!--on L devices, take up * number of columns-->
<!--etc-->
```

Responsiveness:

```html
<div class="container-fluid">
<!--    row 1-->
    <div class="row">
        <div class="col-lg-6" style="background-color: red; height: 90px"></div>
        <div class="col-lg-6" style="background-color: green; height: 90px"></div>
    </div>
</div>
```

Creates a flush container

Note: Use Chrome DevTools to check different screens

Rule of Thumb: Columns need to equal 12

```html
<div class="container-fluid">
<!--    row 1-->
    <div class="row">
        <div class="col-lg-2" style="background-color: red; height: 90px"></div>
        <div class="col-lg-8" style="background-color: green; height: 90px"></div>
        <div class="col-lg-2" style="background-color: red; height: 90px"></div>
    </div>
</div>
```

Reminder: Every Row is 12 Columns!


---

### Consuming APIs

- Using someone else’s API

```markdown
Consuming APIs
1) Does it have the data I need?
2) What are the costs?
3) How does it authenticate?

Now we found something that might work:
1) What endpoints are available?
2) What methods do I use?
3) How is data sent?
4) How much data is sent?
5) What does that data look like?
```

### Serving/Building APIs

- Creating/hosting my own API

## Related
- [[CSS]] — Bootstrap extends raw CSS
- [[JavaScript - DOM]] — Bootstrap components are manipulated via DOM
- [[Final Project Contextualization]] — Bootstrap used in final project frontend
- [[_INDEX - Beginning Web Programming]] — course overview
- [[Spring Framework]] — Bootstrap frontend pairs with Spring Boot backend in full-stack projects