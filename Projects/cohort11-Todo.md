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

Reference:
https://vitest.dev/api/test
https://testing-library.com/


###### setupTest.ts within frontend/src
```ts
import { expect } from 'vitest';  
import * as matchers from '@testing-library/jest-dom/matchers';  
import '@testing-library/jest-dom';  
  
expect.extend(matchers);
```

Adding test section to **package.json**
```json
{  
  "name": "frontend",  
  "private": true,  
  "version": "0.0.0",  
  "type": "module",  
  "scripts": {  
    "dev": "vite",  
    "build": "tsc -b && vite build",  
    "lint": "eslint .",  
    "preview": "vite preview",  
    "test": "vitest",  
    "test:watch": "vitest --watch",  
    "test:coverage": "vitest --coverage"  
  }, [...]
```

###### Ensure this is in tsconfig.app.json
```json
"include": [  
  "src",  
  "node_modules/vitest/globals.d.ts"  
]
```

###### Within src:
1. Create `__tests__`
2. Within `__tests__,` create `App.test.tsx`
3. This code:
```tsx
import {render, screen} from "@testing-library/react";  
import App from "../App.tsx";  
import {expect} from "vitest";  
  
describe('App.tsx', () => {  
  
    it('should display heading', () => {  
        // Arrange  
        render(<App />)  
        // Assert  
        expect(screen.getByRole('heading', {name: /started/i})).toBeInTheDocument();  
        // role is literally the heading tags (<h1>, etc.)  
        screen.logTestingPlaygroundURL();  
    });  
  
});
```
- You are rendering the application from App.tsx
- **`screen`** — the virtual DOM that Testing Library renders your component into. Think of it as a handle to "what's on the page."
- **`.getByRole('heading', {name: /started/i})`** — queries the DOM for an element with the ARIA role of `heading` (i.e., `<h1>`–`<h6>`) whose accessible name matches the regex `/started/i`. The `i` flag makes it case-insensitive, so it'll match "Get started", "STARTED", etc.
- **`expect(...)`** — wraps the found element in Vitest's assertion engine.
- **`.toBeInTheDocument()`** — the actual assertion, provided by `@testing-library/jest-dom`. Confirms the element exists in the DOM rather than being null or undefined.