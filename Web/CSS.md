---

---
What is CSS?

- Cascading Style Sheets
- Allows us to create borders, fonts, colors, animation
- Everything in the body can be manipulated

See more: [CSS Zen Garden: The Beauty of CSS Design](https://csszengarden.com/)

What about syntax?

HTML Element

```html
<p> <!-- Opening tag-->
My cat is very grumpy <!-- Content-->
</p> <!-- Closing tag-->
<!-- All of the above is the ELEMENT-->
```

CSS

```css
p { /* selector */
		color: blue;     /* property: value */
		font-size: 12px; /* property: value */
	}
```

Note: Browsers are not very tolerant of variations of this syntax:

```css
body {
				background: green;
		 }
/* Use background-color instead */
```

Where do we put our CSS?

3 options:

- Inline CSS
- Internal CSS
- External CSS

Inline and internal CSS allow you to write your CSS code inside of your HTML file

Inline:

```html
<body style="background-color: green;"> <!-- inline styling -->
```

Internal:

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DCSS Demo 1</title>
    <style type="text/css">
        body {
            background: pink;
        }
    </style>
</head>
<body>
<h1>Hello World!!!</h1>
</body>
</html>
```

External (in style.css):

```css
body {
    background-color: blue;
}
```

Specificity in HTML/CSS: [W3Schools.com](https://www.w3schools.com/css/css_specificity.asp)

CSS Selectors

Question: How can I select only the second list item (CSS)?

CSS Combinator - A sign that explains the relationship between selectors:

[W3Schools.com](https://www.w3schools.com/css/css_combinators.asp)

Tags, Classes, Ids are most important for what we’ll do:


CSS Selectors - nth-of-type()

What happens if you change the number inside the nth-of-type()?

What if you use odd or even keywords instead of numbers? What happens?

What are some other ways to designate what nth-of-type() needs to be selected?

Google Fonts
[https://fonts.google.com/](https://fonts.google.com/)

Homework:

Font Awesome

Create a kit, need it for tomorrow
## Related
- [[CSS - Bootstrap]] — Bootstrap builds on raw CSS knowledge
- [[Pseudo-classes-Positioning]] — extends CSS with state-based styling
- [[JavaScript - DOM]] — DOM manipulation can dynamically change CSS styles
- [[_INDEX - Beginning Web Programming]] — course overview
- [[Web - Forms, Navigation, and DOM Basics]] — CSS classes and IDs used in DOM examples