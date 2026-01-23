#!/bin/bash

# Script to update SKILL.md files from github/awesome-copilot repo

# URLs for the files
GIT_COMMIT_URL="https://raw.githubusercontent.com/github/awesome-copilot/main/skills/git-commit/SKILL.md"
MAKE_SKILL_TEMPLATE_URL="https://raw.githubusercontent.com/github/awesome-copilot/main/skills/make-skill-template/SKILL.md"

# Local paths
GIT_COMMIT_MD=".github/skills/git-commit/SKILL.md"
GIT_COMMIT_JINJA="template/.github/skills/git-commit/SKILL.md.jinja"
MAKE_SKILL_MD=".github/skills/make-skill-template/SKILL.md"
MAKE_SKILL_JINJA="template/.github/skills/make-skill-template/SKILL.md.jinja"

# Function to update a file
update_file() {
    local url=$1
    local path=$2
    echo "Updating $path from $url"
    curl -s "$url" -o "$path"
    if [ $? -eq 0 ]; then
        echo "Successfully updated $path"
    else
        echo "Failed to update $path"
    fi
}

# Update all files
update_file "$GIT_COMMIT_URL" "$GIT_COMMIT_MD"
update_file "$GIT_COMMIT_URL" "$GIT_COMMIT_JINJA"
update_file "$MAKE_SKILL_TEMPLATE_URL" "$MAKE_SKILL_MD"
update_file "$MAKE_SKILL_TEMPLATE_URL" "$MAKE_SKILL_JINJA"

echo "All SKILL.md files updated."
