Intent: Write tests before production code, allowing requirements and expectations to shape implementation in small, incremental steps. 

---
### Core Cycle:
1. **Red:** Write a test that represents the next requirement or desired behavior. This test should fail, confirming that the feature is not yet implemented.
2. **Green:** Write the smallest amount of code necessary to make the test pass. Do not over-engineer or anticipate future features.
3. **Refactor:** Improve structure, clarity, or efficiency of the code while keeping all tests green. This ensures the implementation remains clean and maintainable without breaking behavior.

---

### Requirement Clarity
Start by defining exactly what the function or component should do, eliminating ambiguity
- Ex: "a word counter should return the number of words in a string"
	- "" returns 0
	- "hello world" returns 2
- Purpose: forces the team to answer the question, "do multiple spaces count as one or several separators? Should punctuation affect the word count?" 
- Capture expectations in tests, ensuring every team member has the same definition of "done"
- Prevents misunderstandings, such as one developer assuming punctuation counts as words while another assumes it doesn't

---

### Immediate Feedback
- run tests frequently to get confidence that changes don't break existing features

---

### Incremental Progress
- bite sized pieces
	- Ex: building a calculator app, just focusing on addition to write tests that fail, then make it pass, before moving onto subtraction, etc.
	- Sense of momentum, steady progress

---

### Better Design
- Cleaner, more modular design from the process because it makes developers imagine how code will be used
- Ex: writing a test for a shopping cart prompts developer to design a Cart class with addItem() rather than exposing raw data structures


---

### Long-Term Maintainability
- Future developers inherit projects they did not write
- Comprehensive test suite created through TDD becomes safeguard
- Ex: replacing database library with newer version, tests can be carried over to check if there's difference in queries or data handling that will break features