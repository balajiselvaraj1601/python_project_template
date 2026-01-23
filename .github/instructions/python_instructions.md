# Python Instructions for AI Coding Agents

This repository is a **Copier template for generating Python projects**.
This document defines **clear, consistent, and enforceable rules** that an AI coding agent (or human contributor) must follow when **creating, editing, or generating Python files** in this repository.

The goal is **correct, maintainable, and reproducible Python code** in both the **template itself** and in **generated projects**.

---

## 1. Purpose and Scope

Python in this repository serves two distinct roles:

- **Template code** used to generate new projects
- **Generated project code** that must pass formatting, linting, typing, and tests

These instructions apply to:

- Python files in `template/src/`
- Python files in `template/tests/`
- Python configuration files generated from Jinja templates
- Supporting scripts used for validation and CI

**Out of Scope**
    These instructions do **not** govern application-specific business logic beyond what the template defines.

---

## 2. Source of Truth and Priority

When working with Python files, follow this order of authority:

1. **Instruction Files** in `.github/instructions/`
2. `pyproject.toml` (tooling and configuration)
3. Existing patterns in `template/`
4. Python ecosystem defaults

Higher-priority sources **override** lower-priority ones.

---

## 3. Key Files to Review First

Before editing or generating Python code, review:

- `pyproject.toml`
  Defines formatting, linting, typing, and testing rules

- `template/src/`
  Canonical structure for generated Python packages

- `template/tests/`
  Testing patterns expected in generated projects

- `copier.yml`
  Feature flags that affect generated Python code

---

## 4. Python Version and Compatibility

- Target the Python version specified in `pyproject.toml`
- Generated code must remain compatible with the declared version range
- Do not introduce syntax or standard library features outside the supported range

---

## 5. Code Style and Formatting

### 5.1 Formatting

- All Python code must be formatted using:
  ```text
  ruff format
  ```

---

### 5.2 Linting

- Follow all rules enforced by:
  ```text
  ruff
  ```

---

### 5.3 Type Checking

- Type checking is enforced using:
  ```text
  basedpyright
  ```
- All public functions, methods, and classes must be fully typed

---

## 6. Project Structure Rules

- Use a `src/` layout
- One top-level Python package per project
- Tests must live in `tests/`

---

## 7. Jinja Templating Rules for Python Files

- Always use variables defined in `copier.yml`
- Never hardcode package names or versions
- Keep `{% if %}` blocks minimal and readable
- Generated files must be valid Python after rendering

---

## 8. Testing Rules

- Use `pytest` exclusively
- Every generated module must have corresponding tests
- Tests must be deterministic and CI-safe

---

## 9. Validation Requirements (Mandatory)

1. Generate a test project:
   ```bash
   copier copy . /tmp/test-project
   ```
2. Validate:
   ```bash
   cd /tmp/test-project && just ci
   ```

---

## 10. Common Mistakes to Avoid

- Hardcoding values instead of using Copier variables
- Adding dependencies without updating templates
- Skipping validation in generated projects

---

## 11. Final Instruction to AI Models

- **Validate in generated projects.**
- **Follow existing patterns.**
- **Do not guess.**

These rules are mandatory.
