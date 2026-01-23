# Python Project Template

A modern, opinionated [Copier](https://copier.readthedocs.io/) template for Python data-science libraries.

## Features

- 🔬 **Data-Science First** - Optimized for numerical and data workflows
- ⚡ **Modern Tooling** - uv, Ruff, BasedPyright, pytest
- 🧠 **Copilot-Optimized** - Structure and docs designed for AI assistance
- 🎯 **Type Safe** - Strict typing enforced by default
- 📊 **Testing Ready** - Unit tests + optional property-based testing with Hypothesis
- 🔄 **CI/CD Included** - GitHub Actions + Renovate for dependency management
- 📦 **Best Practices** - src/ layout, locked dependencies, coverage reporting

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

```
my-new-project/
├── .github/
│   ├── workflows/
│   │   └── ci.yml     # CI/CD pipeline
│   └── renovate.json         # Dependency updates
├── src/
│   └── {{ package_name }}/
│       ├── __init__.py
│       ├── core.py
│       └── py.typed
├── tests/
│   ├── unit/
│   │   └── test_core.py
│   ├── properties/
│   │   └── test_properties.py
│   └── test_imports.py
├── docs/
│   ├── index.md
│   ├── design.md
│   └── api.md
├── .copier-answers.yml
├── .gitignore
├── .pre-commit-config.yaml
├── CONTRIBUTING.md
├── justfile
├── LICENSE
├── mkdocs.yml
├── pyproject.toml
└── README.md
```

## Template Prompts

When generating a project, Copier will prompt for:

- **Project Name**: Human-readable name
- **Project Slug**: URL-friendly slug
- **Package Name**: Python package identifier
- **Description**: Short project description
- **Author**: Name and email
- **GitHub Username**: For repository URLs
- **Python Version**: Minimum supported version (3.11+)
- **License**: Project license
- **Optional Features**: Documentation, Hypothesis testing, pandas/NumPy support

## Tooling

Generated projects include:

- **uv** - Fast Python package manager
- **Ruff** - Fast linter and formatter
- **BasedPyright** - Type checker
- **pytest** - Testing framework
- **Hypothesis** - Property-based testing (optional)
- **MkDocs** - Documentation (optional)
- **pre-commit** - Git hooks
- **GitHub Actions** - CI/CD
- **Renovate** - Dependency updates

## Development Tasks

Use the `just` command runner for common tasks:

```bash
just fmt        # Format code
just lint       # Run linter
just typecheck  # Type check
just test       # Run tests
just coverage   # Run tests with coverage
just docs       # Build documentation
just ci         # Run full CI checks
```

## Contributing

1. Fork the repository
1. Create a feature branch
1. Test changes locally: `copier copy . /tmp/test-project && cd /tmp/test-project && just ci`
1. Open a pull request

See [QUICKSTART.md](QUICKSTART.md) for detailed maintenance instructions.

## License

This template is licensed under MIT. Generated projects may choose their own license.
