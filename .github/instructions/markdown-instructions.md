# Markdown Authoring Guidelines for This Repository

This repository relies heavily on **Markdown** for documentation, READMEs, and generated project files.
This document defines **clear, consistent, and enforceable rules** that an AI model (or human contributor) must follow when **creating, editing, or generating Markdown content** for this project.

The goal is **predictable structure, high readability, and correct rendering** across GitHub, MkDocs, and Copier-generated projects.

---

## 1. Purpose and Scope

Markdown in this repository is used for:

- Project documentation (READMEs, design docs, API references)
- Contribution and governance files
- License and legal files
- MkDocs-based documentation sites
- Copier templates that generate Markdown files dynamically

### Important
All Markdown files located in the `template/` directory are **Jinja templates** and use the `.md.jinja` extension.
These files are rendered by **Copier**, not written directly to disk.

---

## 2. Key Files to Understand First

Before editing or generating Markdown, review the following:

- `README.md`
  High-level project overview and documentation baseline

- `template/*.md.jinja`
  Canonical examples of templated Markdown structure

- `template/mkdocs.yml.jinja`
  Documentation site configuration and navigation

- `copier.yml`
  Defines all available template variables

---

## 3. General Markdown Rules

### 3.1 Markdown Flavor

- Default to **CommonMark**
- Use extensions (tables, admonitions, footnotes) **only if supported** by:
  - GitHub
  - MkDocs
- Never assume a feature is supported — verify first

---

### 3.2 Document Structure

- Begin every file with **one level-1 heading**
- Do **not** skip heading levels
- Separate sections with blank lines
- Organize sections logically so automated tools can build a table of contents

---

### 3.3 Headings

- `#` — Document title (one per file)
- `##` — Major sections
- `###` — Subsections
- `####` — Rarely used; avoid unless necessary

---

## 4. Jinja Templating Rules (Critical)

Markdown files in `template/` are **Jinja templates**.

### 4.1 Variable Usage

- Always use variables defined in `copier.yml`
- Never hardcode project-specific values

---

### 4.2 Conditional Blocks

- Use conditionals **sparingly**
- Only for optional sections

---

### 4.3 Includes

- Use Jinja includes for reusable content
- Do not duplicate shared documentation blocks

---

## 5. Formatting Standards

### 5.1 Text

- Write clearly and concisely
- Prefer short paragraphs
- Keep line length between **80–100 characters**
- Use **bold** and *italics* sparingly

---

### 5.2 Lists

- Prefer unordered lists
- Use ordered lists **only when sequence matters**
- Keep list formatting consistent within a file

---

### 5.3 Links

- Internal links → **relative paths**
- External links → **absolute URLs**
- Use descriptive link text

---

### 5.4 Code Blocks

- Always use fenced code blocks
- Always specify a language
- Use inline code only for short references

---

### 5.5 Tables

- Use standard Markdown table syntax
- Align columns for readability

---

### 5.6 Images and Accessibility

- Always include meaningful alt text
- Avoid decorative images without context

---

## 6. MkDocs-Specific Rules

- Add YAML front matter **only when required**
- Ensure all pages are referenced in `mkdocs.yml.jinja`
- Verify all internal links resolve after generation

---

## 7. File Naming Conventions

- Use lowercase file names
- Use hyphens, not underscores

---

## 8. Common Mistakes to Avoid

- Hardcoding values instead of using Jinja variables
- Broken internal links
- Inconsistent heading levels
- Missing alt text for images
- Mixing raw HTML with Markdown unnecessarily

---

## 9. Validation and Review Workflow

- Preview rendered Markdown
- Generate a sample project with Copier
- Verify links, variables, and formatting

---

## 10. Reference Resources

- https://commonmark.org/
- https://docs.github.com/en/get-started/writing-on-github
- https://www.markdownguide.org/
- https://www.mkdocs.org/

---

## 11. Final Instruction to AI Models

**Follow these rules exactly.
Consistency is mandatory.**
