---

---
Learning Objectives:

- Have an intuitive understanding of how your terminal/shell works
- Learn the basics of interacting with your computer via the command line
- Understand how you can leverage these tools to make your job easier/more efficient

A place where you can type instructions, or commands, to interact with the system

- Manipulate files/folders, transform text/data, run programs

```shell
touch test.txt
```

Some Basic Commands

```shell
cd // change directory
ls // list all items in that directory
l // list all iterms in that directory with detailed info
cp //
mv //
rm //
echo //
find //
grep //
```

“Anatomy” of a command

- Starts with the name of a command
- Provide options/flags/arguments
- All commands…

Variables

- Just like in “normal” programming languages, you can store values (strings) in variables

**Writing a Script**

```shell
vim josh_script.sh
!#/bin/bash // preamble
cowsay "Josh_it worked!"
```

```shell
vim script_name.sh

i // Enter Insert Mode

#!/bin/bash // This is a preamble
cowsay "Wow, that took a long time, dooooo better Josh" // This is what I want the script to do

ESC // ENDS INSERT

:wq // WRITE and QUIT
```

Setting a variable within terminal and then export it such a script can access it:

```shell
my_name="josh"
export $my_name
```

Within vim, you can now access the variable using

```shell
$my_name
```

When you’re done, either close the terminal or type:

```shell
unset $my_name
```

Terminal is the thing that talks to the “shell”

What is a “command”?

- A “command” is a general term used to describe some kind of executable
    - Usually a program

Where do commands come from?

- Many default programs/command line utilities are shipped with your OS

Understand:

```shell
echo $PATH
type zsh
type brew
type ls
type l
type type
```

Modifying PATH

Let’s add your josh_script.sh script to your PATH.

- Move josh_script.sh into a new directory called scripts
- Try running josh_script.sh

```shell
PATH="/Users/j2505812/workspace/ACC/josh-testing/random_test_files:$PATH"
```

This adds this directory to PATH until the current Terminal is closed. You can now call that script from ANYWHERE.


**Pipelines**

Many commands have some kind of output

Many commands can take input from another command’s output

You can “piple” the output of one command into another

```shell
command1 | command2 | command3
ls -al | grep ".git"
```

Example:

```shell
echo "hello there" | cowsay0

```

[https://overthewire.org/wargames/bandit/bandit0.html](https://overthewire.org/wargames/bandit/bandit0.html)

OVER THE WIRE - Level 0

```shell
ssh bandit0@bandit.labs.overthewire.org -p 2220
Password: [redacted]
```

OVER THE WIRE - Level 0-1

```shell
ls
cat readme

Password: [redacted]
```

OVER THE WIRE - Level 1-2

```shell
cat ./-

Password: [redacted]
```

OVER THE WIRE - Level 2-3

```shell
cat ./- [[TAB KEY]]

Password: [redacted]
```

OVER THE WIRE - Level 3-4

```shell
cd inhere/
ls -a
cat ./...Hiding-From-You

Password: [redacted]
```

OVER THE WIRE - Level 4-5

```shell
cd inhere
ls
cat ./-file01 (and so on)

Password: [redacted]
```

k get pods FILENAME -oyaml | pbcopy

git lola is useful

IntelliJ Launcher

Tools —> Create Command-line Launcher

```shell
export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS"
Add to .zshrc
```
## Related
- [[Git]] — terminal is the primary interface for Git commands
- [[Git]] — version control is operated via shell
- [[Spring Framework]] — Gradle commands run from terminal to build and test Spring apps
- [[General Skills]] — companion note for tool shortcuts