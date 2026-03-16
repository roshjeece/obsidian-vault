#!/bin/bash

# Appends ## Related sections to Obsidian vault notes
# Skips files that already have a ## Related section

VAULT=~/Documents/Obsidian\ Vault

append_related() {
    local file="$1"
    local content="$2"

    # SKIP if ## Related already exists
    if grep -q "## Related" "$file"; then
        echo "SKIP (already has ## Related): $file"
        return
    fi

    echo "APPENDING: $file"
    printf "\n%s" "$content" >> "$file"
}

# ==============================================================================
# GIT
# ==============================================================================

append_related "$VAULT/Git/Git.md" \
"## Related
- [[Introduction to Version Control -- Git]] — detailed Git concepts and commands
- [[JM Lesson - 12MAR26]] — branching lesson that extends this note
- [[Shell-Terminal-Command Line]] — terminal skills needed to use Git effectively
- [[Spring Framework]] — Git is used to version Spring Boot projects"

append_related "$VAULT/Git/Introduction to Version Control -- Git.md" \
"## Related
- [[Git]] — overview note
- [[JM Lesson - 12MAR26]] — branching and remote commands
- [[Shell-Terminal-Command Line]] — terminal is the primary interface for Git
- [[Intro Logistics-Decomposition-Github]] — GitHub introduced in web course context"

append_related "$VAULT/Git/JM Lesson - 12MAR26.md" \
"## Related
- [[Git]] — foundational Git concepts
- [[Introduction to Version Control -- Git]] — version control overview
- [[Shell-Terminal-Command Line]] — branch commands run in terminal"

# ==============================================================================
# SPRING
# ==============================================================================

append_related "$VAULT/Spring/Spring Framework.md" \
"## Related
- [[Spring JPA Overview - Annotations]] — JPA layer sits beneath the Spring service/repository pattern
- [[Introduction to TDD Arrange]] — controller, service, and repository layers each have a corresponding test type
- [[Inheritance]] — Spring relies heavily on interface implementation and class hierarchies
- [[Polymorphism]] — Spring's dependency injection uses polymorphic references
- [[SQL Course]] — Spring JPA maps Java objects to SQL database tables
- [[To Do Study - Self Learning]] — todo app is a direct Spring Boot application"

append_related "$VAULT/Spring/Spring JPA Overview - Annotations.md" \
"## Related
- [[Spring Framework]] — JPA is the persistence layer of the Spring stack
- [[SQL Course]] — JPA generates SQL under the hood via Hibernate
- [[Introduction to TDD Arrange]] — @DataJpaTest is the test type for the repository layer
- [[Day 3 Notes - Basic SQL Queries]] — understanding raw SQL helps understand what JPA generates"

# ==============================================================================
# GENERAL SKILLS
# ==============================================================================

append_related "$VAULT/General Skills/General Skills.md" \
"## Related
- [[Shell-Terminal-Command Line]] — terminal is a core general skill
- [[Introduction to Version Control -- Git]] — Git is a core general skill
- [[Introduction to TDD Arrange]] — TDD is a core development practice
- [[Spring Framework]] — Spring is a primary framework in use
- [[Spring JPA Overview - Annotations]] — JPA extends Spring knowledge
- [[To Do Study - Self Learning]] — active self-study topics"

append_related "$VAULT/General Skills/Shell-Terminal-Command Line.md" \
"## Related
- [[Git]] — terminal is the primary interface for Git commands
- [[Introduction to Version Control -- Git]] — version control is operated via shell
- [[Spring Framework]] — Gradle commands run from terminal to build and test Spring apps
- [[Shortcuts]] — companion note for tool shortcuts"

append_related "$VAULT/General Skills/Shortcuts.md" \
"## Related
- [[Shell-Terminal-Command Line]] — terminal commands complement IDE shortcuts
- [[General Skills]] — shortcuts are part of general developer efficiency"

append_related "$VAULT/General Skills/Friday Classes.md" \
"## Related
- [[Spring Framework]] — Friday classes covered Spring Boot
- [[Introduction to TDD Arrange]] — TDD was a Friday class topic
- [[Introduction to Version Control -- Git]] — Git was a Friday class topic
- [[Spring JPA Overview - Annotations]] — JPA was a Friday class topic
- [[Shell-Terminal-Command Line]] — shell was a Friday class topic"

# ==============================================================================
# SELF STUDY
# ==============================================================================

append_related "$VAULT/Self Study/Self Study.md" \
"## Related
- [[To Do Study - Self Learning]] — active study topics list
- [[udemy Java]] — primary self-study resource
- [[Java Course]] — formal Java coursework to complement self-study"

append_related "$VAULT/Self Study/To Do Study - Self Learning.md" \
"## Related
- [[Spring Framework]] — MVC understanding is flagged as critical
- [[Spring JPA Overview - Annotations]] — JPA is core to the todo app
- [[Introduction to TDD Arrange]] — TDD applies directly to Spring Boot development
- [[Self Study]] — parent note"

append_related "$VAULT/Self Study/udemy Java.md" \
"## Related
- [[Java Course]] — formal Java course to cross-reference with Udemy content
- [[Self Study]] — parent note
- [[Inheritance]] — OOP concepts covered in both formal and self-study tracks
- [[Polymorphism]] — OOP concepts covered in both formal and self-study tracks"

# ==============================================================================
# JAVA (skip if already done — script will auto-detect)
# ==============================================================================

append_related "$VAULT/Java/Polymorphism.md" \
"## Related
- [[Inheritance]] — polymorphism depends on inheritance; upcasting requires a parent-child relationship
- [[Java Course]] — course overview
- [[Spring JPA Overview - Annotations]] — Spring uses polymorphism extensively in its repository interfaces"

append_related "$VAULT/Java/Inheritance.md" \
"## Related
- [[Polymorphism]] — method overriding and upcasting build directly on inheritance
- [[Java Course]] — course overview
- [[Spring Framework]] — Spring beans use inheritance and interface implementation patterns"

append_related "$VAULT/Java/Sorting Algorithms.md" \
"## Related
- [[Recursion]] — many sorting algorithms use recursive logic
- [[Merge Sort]] — merge sort is a direct application of sorting algorithm concepts
- [[Arrays]] — sorting operates on arrays
- [[Java Course]] — course overview"

append_related "$VAULT/Java/Recursion.md" \
"## Related
- [[Sorting Algorithms]] — recursion is the foundation of merge sort and quicksort
- [[Merge Sort]] — direct application of recursive thinking
- [[Java Course]] — course overview"

append_related "$VAULT/Java/Merge Sort.md" \
"## Related
- [[Recursion]] — merge sort is a recursive divide and conquer algorithm
- [[Sorting Algorithms]] — merge sort is one of several sorting algorithms covered
- [[Arrays]] — merge sort operates on arrays using two-pointer technique
- [[Java Course]] — course overview"

append_related "$VAULT/Java/Java Course.md" \
"## Related
- [[Java Day 1 - Programming Fundamentals]] — course starting point
- [[Inheritance]] — core OOP topic
- [[Polymorphism]] — core OOP topic
- [[Recursion]] — advanced topic covered later in course
- [[Sorting Algorithms]] — algorithms covered in intermediate Java
- [[Spring Framework]] — Java is the foundation for Spring Boot development"

append_related "$VAULT/Java/Arrays.md" \
"## Related
- [[Sorting Algorithms]] — sorting algorithms operate on arrays
- [[Merge Sort]] — merge sort uses two-pointer technique on arrays
- [[ArrayList]] — ArrayList is the dynamic alternative to fixed arrays
- [[Java Course]] — course overview"

append_related "$VAULT/Java/ArrayList.md" \
"## Related
- [[Arrays]] — ArrayList is the dynamic alternative to fixed arrays
- [[Sorting Algorithms]] — ArrayLists can be sorted using Collections utility
- [[Java Course]] — course overview
- [[Spring Framework]] — Spring repositories return Lists of entities"

append_related "$VAULT/Java/Files.md" \
"## Related
- [[Java Course]] — course overview
- [[Shell-Terminal-Command Line]] — file manipulation from terminal complements Java file I/O"

append_related "$VAULT/Java/Inheritance.md" \
"## Related
- [[Polymorphism]] — method overriding and upcasting build directly on inheritance
- [[Java Course]] — course overview
- [[Spring Framework]] — Spring beans use inheritance and interface implementation patterns"

# ==============================================================================
# TDD (skip if already done)
# ==============================================================================

append_related "$VAULT/TDD/Introduction to TDD Arrange.md" \
"## Related
- [[Spring Framework]] — Spring projects are tested using TDD principles
- [[Spring JPA Overview - Annotations]] — JPA repositories require integration testing
- [[Java Course]] — TDD is practiced throughout the Java curriculum
- [[Git]] — TDD cycle pairs with frequent commits: red, green, refactor, commit
- [[To Do Study - Self Learning]] — todo app is a direct TDD application"

echo ""
echo "Done. Check Obsidian graph view."
