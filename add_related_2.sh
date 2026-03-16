#!/bin/bash

# Appends ## Related sections to SQL and Web Obsidian vault notes
# Skips files that already have a ## Related section

VAULT=~/Documents/Obsidian\ Vault

append_related() {
    local file="$1"
    local content="$2"

    if grep -q "## Related" "$file"; then
        echo "SKIP (already has ## Related): $file"
        return
    fi

    echo "APPENDING: $file"
    printf "\n%s" "$content" >> "$file"
}

# ==============================================================================
# SQL
# ==============================================================================

append_related "$VAULT/SQL/SQL Course.md" \
"## Related
- [[Spring JPA Overview - Annotations]] — JPA generates SQL under the hood via Hibernate
- [[Spring Framework]] — Spring Boot connects to SQL databases via JPA
- [[Final Project Part 1 Code Space]] — applied SQL project using joins, constraints, and aggregates
- [[Final Project Part 2]] — ERD and normalization applied to library database"

append_related "$VAULT/SQL/SQL Day 1 Notes.md" \
"## Related
- [[SQL Course]] — course overview
- [[SQL Day 2 Notes]] — builds on Day 1 with keys and relationships
- [[Day 3 Notes - Basic SQL Queries]] — applies Day 1 concepts with SELECT queries
- [[Spring JPA Overview - Annotations]] — JPA maps Java classes to SQL tables and datatypes"

append_related "$VAULT/SQL/SQL Day 2 Notes.md" \
"## Related
- [[SQL Day 1 Notes]] — foundational concepts
- [[SQL Course]] — course overview
- [[Day 3 Notes - Basic SQL Queries]] — applies keys and relationships in SELECT queries
- [[Final Project Part 1 Code Space]] — foreign keys and referential integrity applied in project
- [[Spring JPA Overview - Annotations]] — @Entity and @Id map directly to primary keys"

append_related "$VAULT/SQL/Day 3 Notes - Basic SQL Queries.md" \
"## Related
- [[SQL Day 2 Notes]] — keys and relationships that queries operate on
- [[SQL Course]] — course overview
- [[SQL Day 4]] — applies basic queries with JOINs and filters
- [[Spring JPA Overview - Annotations]] — Spring Data generates DDL and DML automatically
- [[Final Project Part 1 Code Space]] — SELECT, JOIN, and aggregate queries used throughout"

append_related "$VAULT/SQL/SQL Day 4.md" \
"## Related
- [[Day 3 Notes - Basic SQL Queries]] — basic SELECT syntax used here
- [[SQL Day 5 Notes]] — full database creation builds on Day 4 queries
- [[SQL Day 6.md]] — JOINs and views extend Day 4 concepts
- [[SQL Course]] — course overview"

append_related "$VAULT/SQL/SQL Day 5 Notes.md" \
"## Related
- [[SQL Day 4]] — queries run against the database created here
- [[SQL Day 6.md]] — JOINs and views query this database
- [[Day 3 Notes - Basic SQL Queries]] — DDL commands used to build this schema
- [[Spring JPA Overview - Annotations]] — Spring generates equivalent schema via Flyway migrations
- [[SQL Course]] — course overview"

append_related "$VAULT/SQL/SQL Day 6.md" \
"## Related
- [[SQL Day 5 Notes]] — database schema being queried here
- [[SQL Day 7.md]] — views and aggregates extend Day 6 joins
- [[Day 3 Notes - Basic SQL Queries]] — JOIN types referenced here
- [[Final Project Part 1 Code Space]] — complex multi-table joins applied in project
- [[Spring JPA Overview - Annotations]] — Spring JPA performs equivalent joins via entity relationships
- [[SQL Course]] — course overview"

append_related "$VAULT/SQL/SQL Day 7.md" \
"## Related
- [[SQL Day 6.md]] — joins covered in Day 6 are extended with aggregates here
- [[SQL Day 8.md]] — continues views and advanced queries
- [[Final Project Part 1 Code Space]] — GROUP BY and aggregate functions used in project tasks
- [[SQL Course]] — course overview"

append_related "$VAULT/SQL/SQL Day 8.md" \
"## Related
- [[SQL Day 7.md]] — views and aggregates introduced in Day 7
- [[SQL Course]] — course overview
- [[Spring JPA Overview - Annotations]] — views in SQL parallel the abstraction Spring repositories provide
- [[Final Project Part 1 Code Space]] — masking PII and views applied in project"

append_related "$VAULT/SQL/11FEB26.md" \
"## Related
- [[SQL Course]] — course overview
- [[Case Statements & more]] — CASE expressions covered the same week
- [[Day 3 Notes - Basic SQL Queries]] — foundational SQL concepts applied here"

append_related "$VAULT/SQL/Case Statements & more.md" \
"## Related
- [[11FEB26]] — same week, related SQL concepts
- [[Day 3 Notes - Basic SQL Queries]] — foundational SQL syntax
- [[Final Project Part 1 Code Space]] — conditional logic applied in project queries
- [[SQL Course]] — course overview"

append_related "$VAULT/SQL/Final Project Part 1 Code Space.md" \
"## Related
- [[SQL Day 6.md]] — JOINs used extensively here
- [[SQL Day 7.md]] — GROUP BY and aggregates used in Tasks 12 and 13
- [[SQL Day 5 Notes]] — schema design referenced in table creation
- [[Spring JPA Overview - Annotations]] — Spring JPA performs equivalent operations in Java
- [[Spring Framework]] — this project's schema is the type Spring Boot would sit on top of
- [[SQL Course]] — course overview"

append_related "$VAULT/SQL/Final Project Part 2.md" \
"## Related
- [[SQL Day 6.md]] — normalization principles applied in this ERD
- [[SQL Day 1 Notes]] — ERD concept introduced here
- [[SQL Day 2 Notes]] — primary and foreign key relationships shown in this diagram
- [[Final Project Part 1 Code Space]] — Part 1 and Part 2 are companion projects
- [[SQL Course]] — course overview"

# ==============================================================================
# WEB
# ==============================================================================

append_related "$VAULT/Web/Beginning Web Programming.md" \
"## Related
- [[CSS]] — core styling topic
- [[JavaScript]] — core scripting topic
- [[CSS - Bootstrap]] — framework used throughout the course
- [[JavaScript - DOM]] — DOM manipulation covered mid-course
- [[Final Project Contextualization]] — full-stack capstone builds on all web topics
- [[Decomposition]] — problem decomposition is the first topic covered"

append_related "$VAULT/Web/CSS.md" \
"## Related
- [[CSS - Bootstrap]] — Bootstrap builds on raw CSS knowledge
- [[Pseudo-classes-Positioning]] — extends CSS with state-based styling
- [[JavaScript - DOM]] — DOM manipulation can dynamically change CSS styles
- [[Beginning Web Programming]] — course overview
- [[25FEB26]] — CSS classes and IDs used in DOM examples"

append_related "$VAULT/Web/CSS - Bootstrap.md" \
"## Related
- [[CSS]] — Bootstrap extends raw CSS
- [[JavaScript - DOM]] — Bootstrap components are manipulated via DOM
- [[Final Project Contextualization]] — Bootstrap used in final project frontend
- [[Beginning Web Programming]] — course overview
- [[Spring Framework]] — Bootstrap frontend pairs with Spring Boot backend in full-stack projects"

append_related "$VAULT/Web/JavaScript.md" \
"## Related
- [[JavaScript - Strings, Arrays, Objects]] — extends core JS with data structures
- [[JavaScript - DOM]] — DOM manipulation builds on JS fundamentals
- [[Beginning Web Programming]] — course overview
- [[Introduction to TDD Arrange]] — TDD principles apply to JavaScript as well as Java"

append_related "$VAULT/Web/JavaScript - Strings, Arrays, Objects.md" \
"## Related
- [[JavaScript]] — foundational JS concepts
- [[JavaScript - DOM]] — DOM manipulation uses arrays and objects heavily
- [[Arrays]] — Java arrays parallel JavaScript array methods covered here
- [[Beginning Web Programming]] — course overview"

append_related "$VAULT/Web/JavaScript - DOM.md" \
"## Related
- [[JavaScript]] — JS fundamentals required for DOM manipulation
- [[JavaScript - Strings, Arrays, Objects]] — objects and arrays used in DOM scripts
- [[CSS]] — DOM manipulation can dynamically modify CSS styles
- [[CSS - Bootstrap]] — Bootstrap components are targeted via DOM selectors
- [[25FEB26]] — forms and DOM selectors used together
- [[Beginning Web Programming]] — course overview
- [[Spring Framework]] — DOM manipulation is the frontend counterpart to Spring REST endpoints"

append_related "$VAULT/Web/25FEB26.md" \
"## Related
- [[JavaScript - DOM]] — DOM selectors and events covered this session
- [[CSS]] — classes and IDs referenced in styling
- [[Beginning Web Programming]] — course overview
- [[Intro Logistics-Decomposition-Github]] — navigation and forms introduced early in course"

append_related "$VAULT/Web/Pseudo-classes-Positioning.md" \
"## Related
- [[CSS]] — pseudo-classes are an extension of core CSS
- [[CSS - Bootstrap]] — Bootstrap uses pseudo-classes internally
- [[Beginning Web Programming]] — course overview"

append_related "$VAULT/Web/Decomposition.md" \
"## Related
- [[Beginning Web Programming]] — decomposition is the first concept in the web course
- [[Intro Logistics-Decomposition-Github]] — decomposition introduced alongside Git and logistics
- [[Java Day 1 - Programming Fundamentals]] — decomposition is a universal programming concept
- [[Introduction to TDD Arrange]] — TDD is a structured form of decomposition"

append_related "$VAULT/Web/Intro Logistics-Decomposition-Github.md" \
"## Related
- [[Decomposition]] — decomposition covered in this session
- [[Git]] — Git introduced here in web course context
- [[Introduction to Version Control -- Git]] — detailed Git concepts
- [[Beginning Web Programming]] — course overview
- [[Final Project Contextualization]] — course roadmap referenced here"

append_related "$VAULT/Web/Final Project Contextualization.md" \
"## Related
- [[Spring Framework]] — Spring Boot is the backend requirement
- [[Spring JPA Overview - Annotations]] — JPA required for PostgreSQL integration
- [[CSS - Bootstrap]] — Bootstrap used for frontend
- [[JavaScript - DOM]] — DOM manipulation needed for dynamic UI
- [[SQL Day 5 Notes]] — PostgreSQL schema design needed for two joined tables
- [[Introduction to TDD Arrange]] — TDD applies to full-stack project testing
- [[Beginning Web Programming]] — course overview"

echo ""
echo "Done. Check Obsidian graph view."
