# Python Project Template

A modern, opinionated [Copier](https://copier.readthedocs.io/) template for Python data-science libraries.

## Features

🔬 **Data-Science First** - Optimized for numerical and data workflows
⚡ **Modern Tooling** - uv, Ruff, BasedPyright, pytest
🧠 **Copilot-Optimized** - Structure and docs designed for AI assistance
🎯 **Type Safe** - Strict typing enforced by default
📊 **Testing Ready** - Unit tests + optional property-based testing with Hypothesis
🔄 **CI/CD Included** - GitHub Actions + Renovate for dependency management
📦 **Best Practices** - src/ layout, locked dependencies, coverage reporting

## Quick Start

### Prerequisites

- Python 3.11+
- [uv](https://docs.astral.sh/uv/getting-started/installation/)
- [copier](https://copier.readthedocs.io/en/stable/#installation)

### Create a New Project

```bash
# Install copier if you haven't already
uv tool install copier

# Generate a new project from this template
copier copy gh:balajiselvaraj1601/python_project_template my-new-project

# Navigate to your new project
cd my-new-project

# All dependencies are already installed and git is initialized!
# Run the CI checks to verify everything works
just ci
```

## What Gets Generated

````
my-new-project/
├── .github/
│   ├── workflows/
│   │   └── ci.yml              # CI/CD pipeline
│   └── renovate.json           # Dependency updates
├── src/
│   └── my_package/
"""
# Python Project Template

A modern, opinionated [Copier](https://copier.readthedocs.io/) template for building Python libraries and small projects.

## Overview

This template provides a well-organized starting point with modern tooling and sensible defaults. It is suitable for libraries, CLI tools, and small services — not tied to any specific domain.

## Features

- Modern packaging and dependency management
- Fast linting and formatting
- Strict type checking and type hints
- Test scaffolding and coverage reporting
- CI workflow and dependency automation

## Quick Start

### Prerequisites

- Python 3.11+
- `copier` (to generate projects from this template)

### Create a New Project

```bash
# Generate a new project from this template
copier copy gh:YOUR_USERNAME/python_project_template my-new-project

cd my-new-project

# Run the recommended checks
just ci
````

## What Gets Generated

Typical generated layout:

```
my-new-project/
├── .github/                 # CI workflows
├── src/                     # Source package
├── tests/                   # Test suite
├── docs/                    # Optional documentation
├── pyproject.toml           # Project config & dependencies
├── justfile                 # Task runner commands
├── .pre-commit-config.yaml  # Pre-commit hooks
├── LICENSE                  # License file
├── README.md                # Project README
└── CONTRIBUTING.md          # Contributing guide
```

## Template Prompts

When generating a project, copier will ask a few standard prompts (project name, package name, description, author, license, Python minimum version, and which optional features to include).

## Tooling

Common tools included or recommended in generated projects:

- `ruff` — fast linter and formatter
- `pytest` — testing framework
- `uv` or another package manager — dependency management
- `pre-commit` — git hooks
- Type checking (e.g., Pyright/mypy)

## Development Tasks

Common `just` targets typically include:

```bash
just fmt        # Format code
just lint       # Run linter
just typecheck  # Type check
just test       # Run tests
just coverage   # Run tests with coverage report
just ci         # Run the full CI checks locally
```

## Contributing

Contributions are welcome. Typical workflow:

1. Fork the repository
2. Create a feature branch
3. Run the generation locally to test changes: `copier copy . /tmp/test-project`
4. Validate the generated project: `cd /tmp/test-project && just ci`
5. Open a pull request

## License

This template is provided under the MIT License. Projects generated from this template may choose their own license.

## Next Steps

- Customize the prompts in `copier.yml` to match your preferred defaults.
- Add or remove optional features (docs, testing extras) when generating new projects.

---

If you'd like, I can also update the template prompts (in [copier.yml](copier.yml)) to use more generic default values. Would you like me to do that?
"""
