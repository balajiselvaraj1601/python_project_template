# Copilot / AI Agent Instructions for This Repository

This repository is a **Copier template** for generating Python projects.
This document provides **clear, consistent, and authoritative guidance** for AI coding agents working on this repository.

The primary objective is **template correctness and reliability** — not runtime behavior of generated projects.

**Scope**

   These instructions apply to **this template repository itself**, not to projects generated from it.

---

## 1. Core Objective

As an AI coding agent, your responsibilities are to:

- Maintain and evolve the **Copier template**
- Ensure **generated projects function correctly**
- Follow **instruction files strictly and hierarchically**
- Validate changes in **generated output**, not only in template files

Do **not** optimize for production runtime behavior beyond what the template explicitly defines.

---

## 2. Instruction Priority Model (Mandatory)

You must follow instructions in the order below.
Higher-priority sources **override** lower-priority ones.

### Priority Order

1. **Instruction Files**
   Located in `.github/instructions/`
   These are the **source of truth**.

2. **Repository Context**
   `README.md`, `IMPLEMENTATION_SUMMARY.md`, `copier.yml`

3. **Skills and Tools**
   Used to explore, implement, and validate changes

4. **Assumptions**
   Use only when explicitly permitted

---

## 3. Required Workflow for All Tasks

Follow this workflow **for every task**, without exception.

### Step 1: Read Instructions First

- Identify all relevant instruction files
- Read them **completely** before making changes
- Resolve conflicts using the priority model

---

### Step 2: Gather Context

Use exploration tools to understand the repository:

- Inspect the `template/` directory
- Review related configuration files
- Search for existing patterns and conventions

Do **not** modify files before understanding how they are used.

---

### Step 3: Apply Targeted Changes

- Make minimal, intentional edits
- Preserve existing structure and conventions
- Avoid broad refactors unless explicitly requested

---

### Step 4: Validate and Iterate

Validation is **mandatory**.

- Generate a test project
- Run formatting, linting, type checks, and tests
- Fix failures and re-run validation

Never assume correctness without validation.

---

## 4. Repository Overview

### Big Picture

- Projects are generated using **Copier**
- All generated content originates from `template/`
- Template behavior is controlled by `copier.yml`
- Generated projects include CI, tooling, and agent configs

---

### Key Files and Directories

- `copier.yml` — Template prompts and feature flags
- `template/` — Source of all generated files
- `.github/instructions/` — Authoritative AI guidance
- `pyproject.toml` — Tooling for the template repository
- `README.md`, `IMPLEMENTATION_SUMMARY.md` — High-level context

---

## 5. Instruction Files and Their Roles

Read and apply these files **in order**:

### 1. `copilot-instructions.md` (this file)

- Global rules for AI agents
- Starting point for every task

---

### 2. `python_instructions.md`

- Authoritative Python rules
- Applies to `template/src/` and `template/tests/`

---

### 3. `markdown-instructions.md`

- Rules for Markdown and `.md.jinja` files
- Required for all documentation changes

---

### 4. `ci-fixer.agent.md`

- Specialized CI troubleshooting guidance
- Use only for workflow-related issues

---

## 6. Using Skills and Tools

Tools exist to ensure **understanding, correctness, and validation**.

### Exploration Skills

- Read files and directories
- Search for patterns
- Understand before editing

---

### Editing Skills

- Apply focused, minimal changes
- Preserve structure and conventions

---

### Execution and Validation Skills

- Run tests and linters
- Validate CI and generated projects
- Fix issues before completion

---

## 7. Primary Workflows

### 7.1 Iterating on the Template

1. Read instruction files
2. Explore the `template/` structure
3. Apply targeted changes
4. Generate a test project:
   ```bash
   copier copy . /tmp/test-project
   ```
5. Validate generated output:
   ```bash
   cd /tmp/test-project && just ci
   ```
6. Fix issues and repeat validation

---

### 7.2 Automated Template Validation

Run:

```bash
./test-template.sh
```

---

### 7.3 Quick Checks in Generated Projects

- `just fmt`
- `just lint`
- `just type`
- `just test`
- `just ci`

---

## 8. Tooling Conventions

Generated projects use:

- **Dependencies**: `uv`
- **Formatting**: `ruff format`
- **Linting**: `ruff`
- **Type Checking**: `basedpyright`
- **Testing**: `pytest`
- **Task Runner**: `just`

Template changes must remain compatible with these tools.

---

## 9. Template Patterns to Preserve

- `src/`-based project layout
- Minimal Jinja usage
- CI consistency across:
  - `ci.yml.jinja`
  - `justfile.jinja`
  - `pyproject.toml.jinja`
- Optional features controlled by `copier.yml`

---

## 10. Common Failure Modes

Avoid the following:

- Editing `pyproject.toml.jinja` without updating `copier.yml`
- Modifying CI without updating `justfile`
- Skipping validation in generated projects
- Hardcoding values instead of using template variables

---

## 11. Examples of Correct Changes

### Add a Dependency

- Update `template/pyproject.toml.jinja`
- Update `template/justfile.jinja`
- Validate in a generated project

---

### Add an Optional Feature

- Add a prompt to `copier.yml`
- Use `{% if %}` blocks in templates
- Generate and validate output

---

## 12. Final Instruction to AI Models

- **Read instruction files first.**
- **Never skip validation.**
- **Optimize for template correctness.**
- **If unsure, explore — do not guess.**

These rules are mandatory.
