# HTML

**HyperText Markup Language** — the structure layer of the web. HTML defines what content exists and its semantic meaning. CSS controls how it looks, JavaScript controls how it behaves.

---

## Document Structure

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Page Title</title>
    <!-- CSS links go here -->
</head>
<body>
    <!-- All visible content goes here -->
    <!-- JS scripts go at bottom of body -->
</body>
</html>
```

---

## Key Elements

### Text
```html
<h1> through <h6>   <!-- Headings — only one h1 per page -->
<p>                  <!-- Paragraph -->
<strong>             <!-- Bold / important -->
<em>                 <!-- Italic / emphasis -->
<span>               <!-- Inline container, no semantic meaning -->
```

### Structure
```html
<div>        <!-- Block container, no semantic meaning -->
<header>     <!-- Page or section header -->
<nav>        <!-- Navigation links -->
<main>       <!-- Primary content -->
<section>    <!-- Thematic grouping -->
<article>    <!-- Self-contained content -->
<footer>     <!-- Page or section footer -->
```

### Links and Media
```html
<a href="url">Text</a>              <!-- Anchor/link -->
<a href="page.html">Internal</a>    <!-- Relative link -->
<a href="#id">Jump to section</a>   <!-- In-page link -->
<a href="url" target="_blank">      <!-- Opens in new tab -->
<img src="image.jpg" alt="desc">    <!-- Image — alt is required -->
```

### Lists
```html
<ul>          <!-- Unordered list -->
<ol>          <!-- Ordered list -->
<li>          <!-- List item (used in both) -->
```

### Forms
```html
<form action="/endpoint" method="POST">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>
    <input type="password" name="pw">
    <input type="radio" name="group" value="a"> Option A
    <input type="checkbox" name="agree"> I agree
    <select name="choice">
        <option value="1">Option 1</option>
    </select>
    <button type="submit">Submit</button>
</form>
```

---

## IDs vs Classes

| | ID | Class |
|---|---|---|
| Syntax | `id="name"` | `class="name"` |
| Uniqueness | One per page | Many elements |
| CSS selector | `#name` | `.name` |
| JS selector | `getElementById` | `getElementsByClassName` |
| Use for | Unique elements, in-page anchors | Reusable styles |

---

## Emmet Shortcuts (IntelliJ)

```
div.container       → <div class="container"></div>
p#intro             → <p id="intro"></p>
ul>li*3             → <ul><li></li><li></li><li></li></ul>
```

---

## Related
- [[CSS - Introduction]] — CSS selects and styles HTML elements
- [[JavaScript - DOM]] — JavaScript manipulates HTML via the DOM
- [[CSS - Bootstrap]] — Bootstrap provides pre-built HTML component patterns
- [[Forms, Navigation, and DOM Basics]] — anchor tags, forms, and navigation covered here
- [[Intro Logistics-Decomposition-Github]] — HTML structure introduced in first web class
