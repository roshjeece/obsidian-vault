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
- Capture expectations in tests, ensuring e