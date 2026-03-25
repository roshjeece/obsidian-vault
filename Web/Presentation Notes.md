### Component Based UI
- Breaks user interfaces into small, independent, and reusable building blocks called components
- Encapsulates its own structure (HTML), functionality (JS), and styling (CSS)
- Modular, reusable
- Hierarchical
- Framework driven

### MUI X Data Grid
- Large dataset, structured tabular format
- Built in support for sorting, filtering, pagination, editing
- Data Integration (data source layer)

### REST API
- Architectural style for designing networked applications that allow different software systems to communicate over the internet
- Standard HTTP protocols to request and transfer data
- GET: retrieves data about a resource
- POST: creates a new resource
- PUT/PATCH: updates or modifies an existing resource
- DELETE: removes a resource

### Rule Based Scoring Engine Service Class
- automates decision making by evaluating input data against predefined, weighted, or boolean logic rules to generate a numeric score or action (deciding which workouts user should do, when they should conduct a "check in")

### CRUD Endpoints
- Manage data lifecycle
- Create (POST /score): creates a new score
- Read Collection (GET /score): retrieves a list of scores
- Update (PUT / PATCH /scores/{id}): updates specific score
- Delete (DELETE /scores/{id}): removes a specific score

### Modular Architecture
- Divides apps into independent, self-contained units (modules)
- More scalable, interchangeable


### **Slide 6 — Data Model: Key Tables**

- **`soldier`**
    - Root table — everything traces back here
    - Stores age group and gender
        - Both required for age- and sex-normed AFT scoring
- **`aft_event`**
    - Reference/seed data — loaded once, never changed at runtime
    - Holds all 5 events: MDL, HRP, SDC, PLK, 2MR
        - Linking by FK keeps event names consistent across the entire app
- **`aft_test_result` + `event_score`**
    - Parent-child pair
    - `aft_test_result` — top level, stores date and total score
    - `event_score` — child, one row per event
        - Stores both raw performance value and points earned
        - Same structure handles a full 5-event AFT and a single check-in set
- **`workout_session`**
    - One record per training session
    - Stores date, duration, and RPE
        - RPE intentionally lives here at session level — keeps logging fast and low-friction
- **`improvement_suggestion`**
    - The rule engine's output table
    - Gaps and priorities written here, not just returned to the UI
        - Persists the Soldier's training priorities between sessions
        - Builds a recommendation history over time
- **Key join (rubric requirement)**
    - `soldier → aft_test_result → event_score → aft_event`
    - 4-table query that drives the entire gap analysis
        - This is the core of the application