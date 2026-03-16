---

---
- Version Control
    - source control/revision control, important software development practice for tracking and managing changes made to code and other files
    - with version control, every change made to the code base is tracked. This allows software devs to see the entire history of who changed what at any given time — and roll back from the current version to an earlier version if they need to. It also creates a single source of truth.
- Why use it?
    - orgs accelerate delivery of their software solutions through DevOps, controlling and managing different versions of application artifacts - from code to configuration and from design to deployment - becomes increasingly difficult
- What is a version control system?
    - A tool that saves and tracks incremental changes to file, enabling history and revert options
- What are the main version control systems?
    - Git
        - Most popular DVCS
        - Thrives on branching, merging, and distributed collab
    - SVN (Subversion):
        - Centralized model
        - Often used by legacy projects or smaller teams
    - Mercurial:
        - Another DVCS with simpler branching for some workflows
- Git Overview
    - Source Code Manager

Git Structure

- Local Repository
    - Created with git init
    - Track changes via git status, stage with git add, confirm with git commit
- Remote Repository
    - Hosted on platforms like GitHub or GitLab
    - Sync local changes with git push, retrieve updates with git pull

Working Directory —> Staging Area (Index)

```shell
git add
```

Staging Area —> Repository (HEAD)

```shell
git commit
```

Repository —> Remote

```shell
git push
```

Repository —> Working Directory

```shell
git checkout
```

Remote —> Working Directory

```shell
git pull
```

**Staging Changes**

- Git keeps track of changes made to your code as you make them. 


Git Branch Control

```shell
gco
```