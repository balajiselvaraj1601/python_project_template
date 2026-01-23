# Copilot / AI Agent Instructions

This repository is a Copier template for generating Python projects. As an AI coding agent, your primary goal is to update the template and ensure generated projects work reliably. Focus on template-specific flows, not runtime services.

## Order of Usage: Instructions, Skills, and Abilities

Follow this hierarchical order when working on tasks:

1. **Consult Instruction Files First**: Always start by reading and following the relevant instruction files in this `.github/instructions/` directory. These provide authoritative guidance on coding standards, formatting, and best practices.

2. **Gather Context with Skills**: Use your available skills (tools) to explore the repository, read files, run commands, and validate changes. Prioritize gathering complete context before making edits.

3. **Apply Changes**: Make targeted edits based on instructions and gathered context. Use skills to implement and test changes iteratively.

4. **Validate and Iterate**: Run tests, linters, and validations using skills. Fix any issues and re-validate until successful.

## Repository Overview

- **Big Picture**: This repo produces new projects from files in `template/` using `copier` (see [copier.yml](copier.yml)). Key artifacts live under `template/` (source code, tests, CI Jinja templates). The template includes agent configurations for CI fixing in generated projects.

- **Key Files to Know**:
  - [README.md](README.md), [QUICKSTART.md](QUICKSTART.md), [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) for high-level workflows.
  - [pyproject.toml](pyproject.toml) for dev dependencies and tooling.
  - `template/` for examples of generated content.
  - `.github/instructions/` for specialized guidance.

## Using Instruction Files

This repository provides specialized instruction files for different aspects of development. Read and apply them in this order of priority:

1. **copilot-instructions.md** (this file): General guidance for AI agents on the template repository. Use this as the starting point for any task.

2. **python_instructions.md**: Authoritative rules for writing Python code. Consult this for all Python-related changes, including code in `template/src/` and `template/tests/`.

3. **markdown-instructions.md**: Guidelines for Markdown files and templates. Use for editing `.md.jinja` files in `template/docs/`, `template/README.md.jinja`, etc.

4. **ci-fixer.agent.md**: Specialized instructions for diagnosing and fixing CI failures. Refer to this for workflow-related issues.

Always read the full relevant instruction file before proceeding with a task. If multiple apply, follow them in the order above, with higher-priority files taking precedence.

## Using Skills and Tools

Your skills (tools) allow you to interact with the repository. Use them strategically:

- **Exploration Skills** (read_file, list_dir, grep_search, semantic_search, file_search): Use these first to understand the codebase. Read key files, search for patterns, and map the structure before making changes.

- **Execution Skills** (run_in_terminal, runTests, configure_python_environment, etc.): Use for running commands, tests, and validations. Always configure the environment (e.g., Python) before executing Python-related tasks.

- **Editing Skills** (replace_string_in_file, create_file, etc.): Apply changes only after gathering full context and following instructions. Make minimal, targeted edits.

- **Validation Skills** (runTests, get_errors, run_in_terminal for lints/tests): Run after every substantive change. Iterate on fixes until validation passes.

Prioritize local validation over assuming correctness. For template changes, generate a test project and validate in the generated context.

## Primary Workflows

### Iterating on the Template

1. Read relevant instruction files.
2. Explore the current template structure using exploration skills.
3. Make targeted edits to `template/` files.
4. Generate a test project: `copier copy . /tmp/test-project`
5. Validate in the generated project: `cd /tmp/test-project && just ci`
6. Fix issues and re-validate.

### Automated Validation

Run `./test-template.sh` to automate template generation and basic structure checks.

### Quick Verification

For generated projects, use `just fmt`, `just lint`, `just type`, `just test`, or `just ci`.

## Tooling Conventions

- **Package Management**: `uv` for dependencies and CLI tools.
- **Linting/Type Checking**: `ruff` and `basedpyright`.
- **Testing**: `pytest`.
- **Formatting**: `ruff format`.
- **Task Running**: `just` (in generated projects).

## Template Patterns to Preserve

- **Layout**: Use `src/` structure in templates.
- **Conditionals**: Minimal Jinja with feature flags from `copier.yml`.
- **CI**: Mirror checks in `template/.github/workflows/ci.yml.jinja`, `justfile.jinja`, and `pyproject.toml.jinja`.
- **Optional Features**: Controlled by `copier.yml` prompts (e.g., `include_docs`, `include_numpy`).

## Common Pitfalls

- Editing `pyproject.toml.jinja` without updating `copier.yml` breaks dependency sets.
- Changing CI without updating `justfile` tasks.
- Not validating in generated projects.

## Examples of Edits

- **Add Dependency**: Update `template/pyproject.toml.jinja` and `template/justfile.jinja`, then validate.
- **Add Feature**: Add `copier.yml` prompt, use `{% if %}` in templates, validate generation.
