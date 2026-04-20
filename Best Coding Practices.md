
### Practices
- What are they?
	- The application or use of an idea, belief, or method, as opposed to the theories relating to it
	- Are driven by principles or beliefs
- We define our Principles for a reason
	- Serve as the foundation for our behaviors
	- Core Principles are covered in the Enablement Handbook


### DRY - Don't Repeat Yourself
- Principle that states every piece of knowledge should have a single, unambiguous, authoritative representation within a system


### YAGNI - You Ain't Gonna Need It
- Principle that states you should not implement something until it is necessary
- Skipping features until there's a requirement
- Avoiding overly generic solutions
- Writing code for today's problems
- Pros:
	- Helps Developers Move Quickly
	- Keeps Code Simple
- Cons:
	- Can lead to short-sighted decisions
	- May require later rework

### Tell - Don't Ask
- Principle that states you should tell objects what to do, not ask them about their state and make decisions for them

### Solid:
- Single Responsibility Principle
- Open-Closed Principle
- Liskov Substitution
- Interface Segregation
- Dependency Inversion


### Single Responsibility Principle
- Improved maintainability, testability, refactoring
- Higher reusability
- More files/classes and a tendency for pre-optimization
- Boundary confusion and dependency explosion


### Open-Closed - In Practice
- Designing modules or classes that use abstractions
- Adding new functionality by creating new components
- Avoiding large if-else chains - adopting strategy pattern
- Encourage code stability / preserves tested behavior
- Makes it easier to handle new cases or features
- Requires more upfront design and abstraction
- Can lead to large number of small components

### Liskov Substitution Principle
- Principle that states objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program
- What is the minimum thing that actually gets this program working? The intent of building a car isn't to create an engine -- it's to build an operable vehicle. 

### Interface Segregation Principle
- Clients should not be forced to depend on interfaces they do not use
- Splitting large interfaces into small specific ones
- Ensuring classes only implement what's relevant
- Preventing empty methods to satisfy interface contracts
- Leads to focused and flexible code
- Reduces risk of breaking changes
- Can result in a large number of interfaces
- Over-segmentation

### Dependency Inversion Principle
- High level modules should not depend on low-level modules; both should depend on abstractions
- Using interfaces or abstract classes
- Injecting dependencies rather than concrete implementations
- Increases flexibility and testability
- Makes it easier to swap or mock dependencies
- Introduces complexity
- Can be overkill for small projects