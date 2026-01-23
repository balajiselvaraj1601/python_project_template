# Copilot / AI Agent Instructions

This repository is a Copier template for generating Python projects. The goal for any AI coding agent is to help update the template and ensure generated projects work reliably. Focus on template-specific flows, not runtime services.

- **Big picture**: this repo produces new projects from files in `template/` using `copier` (see [copier.yml](copier.yml)). Key artifacts live under `template/` (source code, tests, CI jinja templates).

- **Where to look first**: [README.md](README.md) and [QUICKSTART.md](QUICKSTART.md) for high-level workflows; [pyproject.toml](pyproject.toml) for dev dependencies and tooling choices; `template/` for real examples of generated content.

- **Primary workflows**:

  - Iterating on the template: generate a real project and run the checks

    ```bash
    copier copy . /tmp/test-project
    cd /tmp/test-project
    just ci
    ```

  - Quick local verification: run `just fmt`, `just lint`, `just test`, or the all-in-one `just ci` (see `template/justfile.jinja` for task definitions).

- **Tooling conventions**:

  - `uv` is the recommended tool for installing CLI helpers in this template. See [README.md](README.md) and [QUICKSTART.md](QUICKSTART.md) for `uv` usage.
  - Linters/typechecking: `ruff` and `basedpyright` are configured in [pyproject.toml](pyproject.toml).
  - Tests use `pytest`; property tests are optional via Hypothesis (see `template/tests/properties`).

- **Template patterns to preserve or follow**:

  - Use `src/` layout in templates: see `template/src/{{ package_name }}/__init__.py.jinja` and `template/src/{{ package_name }}/core.py.jinja` for canonical patterns.
  - Keep Jinja conditionals minimal and predictable; prefer small feature flags wired in `copier.yml`.
  - CI and checks are generated from `template/.github/workflows/ci.yml.jinja` — changes to checks must be mirrored in the `justfile` tasks and `pyproject.toml.jinja`.

- **When editing tests in the template**:

  - Update corresponding generated tests under `template/tests/` (e.g., `template/tests/unit/test_core.py.jinja`).
  - Validate by generating a project and running `just ci` as shown above.

- **Common pitfalls**:

  - Editing `pyproject.toml.jinja` without updating `copier.yml` prompts can break generated projects' dependency sets.
  - Changing CI templates requires updating both `template/.github/workflows/ci.yml.jinja` and any `just` tasks referenced by CI.

- **Examples of useful edits an AI may be asked to do**:
  - Add a dev dependency: update `template/pyproject.toml.jinja` and add a `just` command in `template/justfile.jinja`, then validate generation + `just ci`.
  - Add an optional feature: add a `copier.yml` prompt, branch templates with `{% if feature %}` and validate.
