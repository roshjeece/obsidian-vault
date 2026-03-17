#!/bin/bash

# Renames Java notes and updates all wikilinks across the vault
# Safe to run multiple times — skips renames if destination already exists

VAULT=~/Documents/Obsidian\ Vault
JAVA="$VAULT/Java"

# ==============================================================================
# RENAME FUNCTION
# Renames file and updates all wikilinks across the entire vault
# ==============================================================================

rename_note() {
    local dir="$1"
    local old_name="$2"
    local new_name="$3"

    local old_file="$dir/$old_name.md"
    local new_file="$dir/$new_name.md"

    # SKIP if source doesn't exist
    if [ ! -f "$old_file" ]; then
        echo "SKIP (not found): $old_name"
        return
    fi

    # SKIP if destination already exists
    if [ -f "$new_file" ]; then
        echo "SKIP (already exists): $new_name"
        return
    fi

    # Rename the file
    mv "$old_file" "$new_file"
    echo "RENAMED: $old_name --> $new_name"

    # Update all wikilinks across the vault
    # Replaces [[old_name]] with [[new_name]] in all .md files
    find "$VAULT" -name "*.md" | while read -r f; do
        if grep -q "\[\[$old_name\]\]" "$f"; then
            sed -i '' "s/\[\[$old_name\]\]/[[$new_name]]/g" "$f"
            echo "  UPDATED LINK in: $(basename "$f")"
        fi
    done
}

# ==============================================================================
# JAVA FOLDER RENAMES
# ==============================================================================

rename_note "$JAVA" "10FEB26 - Conditionals" "Conditionals and Switch Statements"
rename_note "$JAVA" "11FEB26" "Increment Operators and While Loops"
rename_note "$JAVA" "12FEB26" "Loop Practice and Binary Search"
rename_note "$JAVA" "Java - Loops - 17FEB26" "For Loops and Do-While Loops"
rename_note "$JAVA" "Java Day 1 - Programming Fundamentals" "Programming Fundamentals and OOP Introduction"
rename_note "$JAVA" "Java Day 2 Notes" "Classes, Objects, and Encapsulation"
rename_note "$JAVA" "Java Day 3 Notes (Chapter 2)" "Variables, Data Types, and Scope"
rename_note "$JAVA" "Java Day 4" "Scanner, Methods, and Number Systems"
rename_note "$JAVA" "Java Day 5" "Methods, Overloading, and Classes"
rename_note "$JAVA" "Java Day 6" "Static Fields, Constructors, and this Keyword"
rename_note "$JAVA" "Java Day 7" "Conditionals, toString, and CPU Execution"
rename_note "$JAVA" "Files RW" "File I/O in Java"

echo ""
echo "Done. Verify links in Obsidian graph view."
