---

---
# Programming Fundamentals and OOP Introduction

**BLUF:** Java is object-oriented — all code lives inside a class. Before writing Java, you need to understand three logic types: sequential, conditional, and iterative. This note frames the conceptual shift from procedural to OOP thinking.

---

## Three Logic Types in Java

| Type | What It Means |
|---|---|
| **Sequential** | Instructions execute top to bottom in order |
| **Conditional** | Execution branches based on a condition |
| **Iterative** | A block of code repeats until a condition is met |

---

## Key Vocabulary

**High-level programming language** — lets you write in human-readable terms rather than machine code.

**Syntax** — the specific rules of a language. Violating them produces a syntax error.

**Compiler** — translates your entire program into machine code at once before execution. Java uses a compiler to produce bytecode, which then runs on the JVM.

**Syntax error** — misuse of language rules (misspelled keyword, missing semicolon). Caught at compile time.

**Logic error (semantic error)** — the program runs but produces incorrect output. The syntax is valid but the logic is wrong.

**Debugging** — the process of finding and fixing all errors in a program.

---

## Procedural vs. Object-Oriented Programming

### Procedural
Code is organized as a sequence of instructions and procedures that operate on separate data.

- Focus is on functions/procedures
- Data and functions are kept separate
- Flows linearly, top to bottom
- Works well for smaller, straightforward programs

> Think of a recipe: ingredients are your variables, steps are your procedures, executed in order.

### Object-Oriented (OOP)
Code is organized around objects — entities that bundle both data and the behavior that operates on that data.

- Focus is on objects that model real-world entities
- Data and behavior are bundled together in classes
- Objects interact with each other to accomplish tasks
- Scales better for larger, more complex programs

> Think of LEGO blocks: each block (object) is built from a blueprint (class) and has its own properties and capabilities. You combine blocks to build something larger.

### The Core Distinction

| | Procedural | OOP |
|---|---|---|
| **Unit of organization** | Function / procedure | Class / object |
| **Data and behavior** | Separate | Bundled together |
| **Scales to complexity** | Harder | Better |

Procedural: *"Here's some data. Here are steps to process it."*
OOP: *"Here's an object that has data and knows how to process itself."*

---

## Java Is OOP

In Java, all code must live inside a class — even `main()`. This is not optional. Java is primarily object-oriented, which means the class is the fundamental unit of organization for every program you write.

---

## Related
- [[Classes, Objects, and Encapsulation]] — the direct next step; translates OOP concepts into Java class syntax
- [[Inheritance]] — one of the three OOP pillars introduced here; builds on the class/object model
- [[Polymorphism]] — second OOP pillar; requires understanding classes and objects first
- [[Encapsulation]] — third OOP pillar; introduced conceptually here, applied in depth there
- [[Conditionals and Switch Statements]] — conditional logic, one of the three logic types listed here
- [[Loops]] — iterative logic, one of the three logic types listed here