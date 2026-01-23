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

### Test the Template Locally

To test the template before using it:

```bash
# Generate a test project
copier copy . /tmp/test-project

# Navigate and verify
cd /tmp/test-project

# Check that everything works
just ci
```

## What Gets Generated

Your new project will have this structure:

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

## Configuration Options

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

## Included Tools

Generated projects include these tools:

- **uv** - Fast Python package manager
- **Ruff** - Fast linter and formatter
- **BasedPyright** - Type checker
- **pytest** - Testing framework
- **Hypothesis** - Property-based testing (optional)
- **MkDocs** - Documentation (optional)
- **pre-commit** - Git hooks
- **GitHub Actions** - CI/CD
- **Renovate** - Dependency updates

## Development Commands

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
1. Test changes locally (see Quick Start section)
1. Open a pull request

## For Template Maintainers

### Template Structure

```
python_project_template/
├── copier.yml                    # Main configuration
├── IMPLEMENTATION_SUMMARY.md     # Implementation details
├── LICENSE
├── pyproject.toml
├── README.md                     # This file
├── scripts/
│   └── update_skills.sh
├── template/                     # Template files
│   ├── CONTRIBUTING.md.jinja
│   ├── justfile.jinja
│   ├── LICENSE.jinja
│   ├── mkdocs.yml.jinja
│   ├── pyproject.toml.jinja
│   ├── README.md.jinja
│   ├── docs/
│   │   ├── api.md.jinja
│   │   ├── design.md.jinja
│   │   └── index.md.jinja
│   ├── src/
│   │   └── {{ package_name }}/
│   │       ├── __init__.py.jinja
│   │       ├── core.py.jinja
│   │       └── py.typed.jinja
│   └── tests/
│       ├── test_imports.py.jinja
│       └── unit/
│           └── test_core.py.jinja
├── test-template.sh
└── README.md
```

### Updating the Template

When you make changes:

1. Test locally (see Quick Start section)
1. Update existing projects:
   ```bash
   cd existing-project
   copier update
   git diff  # Review changes
   just ci   # Verify nothing broke
   ```

### Common Modifications

#### Adding a New Tool

1. Add to `template/pyproject.toml.jinja`:
   ```toml
   [project.optional-dependencies]
   dev = [
       "your-tool>=1.0.0",
   ]
   ```
1. Update `template/justfile.jinja` with new command
1. Update `.github/workflows/ci.yml.jinja` if CI check needed

#### Adding a New Question

In `copier.yml`:

```yaml
new_feature:
  type: bool
  help: Enable new feature?
  default: false
```

Then use in templates:

```jinja
{% if new_feature %}
# Feature-specific code
{% endif %}
```

#### Changing Default Versions

Update in `copier.yml`:

```yaml
python_min_version:
  default: "3.12" # Change default version
  choices:
    - "3.11"
    - "3.12"
    - "3.13"
```

### Publishing the Template

#### GitHub (Recommended)

```bash
git remote add origin git@github.com:YOUR_USERNAME/python_project_template.git
git push -u origin main
git tag v1.0.0
git push --tags
```

Use with:

```bash
copier copy gh:YOUR_USERNAME/python_project_template my-project
```

#### Local Path

```bash
copier copy /path/to/python_project_template my-project
```

#### Git URL

```bash
copier copy https://github.com/YOUR_USERNAME/python_project_template.git my-project
```

### Maintenance Checklist

- [ ] Test template generation monthly
- [ ] Update tool versions in `pyproject.toml.jinja`
- [ ] Update GitHub Actions versions
- [ ] Test with latest Python versions
- [ ] Review and merge Renovate PRs in generated projects
- [ ] Update documentation as tools evolve

## Troubleshooting

### "uv: command not found"

Install uv:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### "copier: command not found"

Install copier:

```bash
uv tool install copier
```

### Template Generation Fails

Check:

1. Copier version >= 9.0.0
1. Valid Jinja2 syntax in .jinja files
1. No circular references in copier.yml

### Generated Project Tests Fail

1. Check Python version matches minimum
1. Verify uv sync completed successfully
1. Check for tool compatibility issues
1. Review recent tool updates

## Version History

- **v1.0.0** (2026-01-23): Initial release
  - uv-first workflow
  - Ruff + BasedPyright
  - Hypothesis support
  - MkDocs documentation
  - GitHub Actions CI
  - Renovate integration

## License

This template is licensed under MIT. Generated projects may choose their own license.
