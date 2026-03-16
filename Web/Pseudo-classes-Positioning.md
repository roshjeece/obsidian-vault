---

---
- Keyword added to a selector that specifies a special state of the selected element
- Syntax:
```css
selector: pseudo-class {
													property:value;
											  }
```

Hover:

- Changes to an element when the user hovers their mouse over it
```css
h1:hover {
    background-color: green;
}

button:hover {
    color: var(--errors);
}
```

Focus

- :focus selector is used when the user selects input fields
```css
input: focus {
							padding-bottom: 100px;
							background-color: red;
							}
```