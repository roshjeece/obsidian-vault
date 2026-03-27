---
created: 2026-03-17
status: active
type: project
---

# cohort11-Todo

## Overview
A Spring Boot todo application built as part of the ACC cohort 11 curriculum. Primary learning vehicle for Spring Boot, JPA, PostgreSQL, Flyway, and layered test architecture.

## Stack
- **Language:** Java 21
- **Framework:** Spring Boot 4.0.3
- **Database:** PostgreSQL
- **Migrations:** Flyway
- **Testing:** JUnit 5, Mockito, @WebMvcTest, @DataJpaTest
- **Build:** Gradle

## Repository
- **GitHub:** [cohort11-Todo](https://github.com/roshjeece/cohort11-Todo)
- **Local path:** `~/Documents/Workspace/cohort11-Todo`

## Current Status
Integration tests failing in TaskControllerIntegrationTest. Flyway/PostgreSQL dependency issue previously resolved.

## Goals
- [ ] Integration tests passing in TaskControllerIntegrationTest
- [ ] Flyway migrations in sync with JPA entities
- [ ] Controller layer clean and skinny
- [ ] Service layer contains all business logic
- [ ] Repository uses Spring Data JPA

## Open Questions
- Is the test datasource pointing to the correct schema?
- Did Flyway migrations run before the test context loads?

## Decisions
- [[decisions/ADR-001-postgresql-over-h2]] — why PostgreSQL was chosen over H2

## Session Log
| Date | Goal | Result |
|------|------|--------|
| 2026-03-17 | Vault setup and documentation | Completed |

## Notes
Package namespace: `mil.army.moda.todo`

## Related
- [[Spring Framework]] — primary framework
- [[Spring JPA Overview - Annotations]] — JPA layer
- [[Flyway]] — migration tool
- [[Introduction to TDD Arrange]] — test architecture
- [[To Do Study - Self Learning]] — open study priorities for this project







---

27MAR26

1. `yawn create vite` in root
	1. name it `frontend`
	2. select React
	3. select TypeScript + React Compiler
2. cd into `frontend`
3. `yarn add -D @testing-library/react @testing-library/jest-dom jsdom`

###### vite.config.ts
```ts
/// <reference types="vitest" />  
import { defineConfig } from 'vitest/config'  
import react, { reactCompilerPreset } from '@vitejs/plugin-react'  
import babel from '@rolldown/plugin-babel'  
  
// https://vite.dev/config/  
export default defineConfig({  
  plugins: [  
    react(),  
    babel({ presets: [reactCompilerPreset()] })  
  ],  
  build: {  
    outDir: 'build',  
  },  
  test: {  
    globals: true,  
    environment: 'jsdom',  
    setupFiles: './src/setupTests.ts',  
    css: true,  
  },  
})
```
