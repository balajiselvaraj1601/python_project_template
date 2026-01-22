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
copier copy gh:YOUR_USERNAME/python_project_template my-new-project

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
│   │   └── ci.yml              # CI/CD pipeline
│   └── renovate.json           # Dependency updates
├── src/
│   └── my_package/
│       ├── __init__.py         # Package initialization
│       ├── core.py             # Example module
│       └── py.typed            # Type hint marker
├── tests/
│   ├── unit/                   # Unit tests
│   ├── properties/             # Property-based tests (optional)
│   └── test_imports.py         # Import sanity checks
├── docs/                       # MkDocs documentation (optional)
├── .pre-commit-config.yaml     # Pre-commit hooks
├── pyproject.toml              # Project config & dependencies
├── justfile                    # Task runner commands
├── .gitignore                  # Sensible defaults
├── LICENSE                     # Your chosen license
├── README.md                   # Project readme
└── CONTRIBUTING.md             # Development guide

```

## Template Configuration

During project generation, you'll be asked:

| Prompt                   | Description            | Default                          |
| ------------------------ | ---------------------- | -------------------------------- |
| `project_name`           | Human-readable name    | "My Data Library"                |
| `package_name`           | Python import name     | Auto-generated from project name |
| `project_description`    | Short description      | "A Python data-science library"  |
| `author_name`            | Your full name         | "Your Name"                      |
| `author_email`           | Your email             | "you@example.com"                |
| `github_username`        | GitHub username/org    | "yourusername"                   |
| `python_min_version`     | Minimum Python version | "3.11"                           |
| `license`                | Project license        | MIT                              |
| `include_docs`           | MkDocs documentation   | Yes                              |
| `include_hypothesis`     | Property-based testing | Yes                              |
| `include_pandas_support` | Include pandas         | No                               |
| `include_numpy`          | Include NumPy          | Yes                              |

## Tool Stack

### Core (Always Included)

- **[uv](https://docs.astral.sh/uv/)** - Fast Python package manager
- **[Ruff](https://docs.astral.sh/ruff/)** - Lightning-fast linter and formatter
- **[BasedPyright](https://github.com/DetachHead/basedpyright)** - Strict type checker
- **[pytest](https://docs.pytest.org/)** - Testing framework
- **[coverage.py](https://coverage.readthedocs.io/)** - Code coverage
- **[just](https://github.com/casey/just)** - Command runner
- **[pre-commit](https://pre-commit.com/)** - Git hooks

### Optional

- **[Hypothesis](https://hypothesis.readthedocs.io/)** - Property-based testing
- **[MkDocs Material](https://squidfunk.github.io/mkdocs-material/)** - Documentation
- **[pandas](https://pandas.pydata.org/)** - Data manipulation
- **[NumPy](https://numpy.org/)** - Numerical computing

## Development Workflow

Generated projects include a `justfile` with common tasks:

```bash
just fmt           # Format code
just lint          # Run linter
just typecheck     # Type check
just test          # Run tests
just coverage      # Test with coverage report
just ci            # Run all CI checks locally
just doctor        # Show environment info
```

## Design Philosophy

This template embodies several key principles:

### 1. Library-First

Built for creating reusable libraries, not applications. No application scaffolding, web frameworks, or service patterns.

### 2. Type Safety

Strict typing enforced everywhere. BasedPyright catches errors at development time.

### 3. Testing Excellence

- Unit tests for specific behaviors
- Property-based tests (Hypothesis) for invariants
- High coverage requirements (85%+)

### 4. Copilot-Optimized

Structure and documentation designed to maximize GitHub Copilot effectiveness:

- Clear naming conventions
- Comprehensive docstrings
- Consistent patterns
- Type hints everywhere

### 5. Deterministic Builds

Uses uv's lockfile for reproducible dependency resolution. CI enforces locked dependencies.

### 6. Quality Gates

Pre-commit hooks and CI prevent bad code from being merged:

- Formatting (Ruff)
- Linting (Ruff)
- Type checking (BasedPyright)
- Tests (pytest)
- Coverage (85%+ required)

## Updating Projects

Update existing projects to get the latest template improvements:

```bash
cd my-existing-project
copier update

# Review changes
git diff

# Run tests to ensure nothing broke
just ci
```

Copier preserves your project-specific files while updating template-managed files.

## CI/CD

### GitHub Actions

Generated projects include a CI workflow that:

- Tests on Python 3.11, 3.12, and 3.13
- Runs formatting, linting, type checking, and tests
- Uploads coverage to Codecov
- Uses uv for fast dependency installation

### Renovate

Dependency updates are automated via Renovate:

- Weekly lockfile maintenance
- Grouped updates (testing tools, linting tools, etc.)
- Security vulnerability alerts
- Automatic PR creation

## Why This Template?

### For Data Scientists

- Property-based testing catches numerical edge cases
- NumPy/pandas typing patterns built-in
- Focus on correctness over speed of development
- Scales from prototype to production

### For Teams

- Consistent structure across projects
- Automated quality checks
- Easy onboarding with clear contributing guide
- Copilot-friendly for productivity

### For Maintainers

- Renovate keeps dependencies fresh
- High coverage requirements catch regressions
- Type safety prevents many bugs
- `copier update` propagates improvements

## Comparison with Other Templates

| Feature           | This Template         | cookiecutter-pypackage | python-poetry-template |
| ----------------- | --------------------- | ---------------------- | ---------------------- |
| Package Manager   | uv                    | pip/poetry             | poetry                 |
| Type Checker      | BasedPyright (strict) | mypy                   | mypy                   |
| Linter/Formatter  | Ruff                  | black+flake8           | black+ruff             |
| Property Testing  | ✅ Hypothesis         | ❌                     | ❌                     |
| Copilot-Optimized | ✅                    | ❌                     | ❌                     |
| Update Strategy   | Copier                | Cookiecutter           | Cookiecutter           |
| DS Focus          | ✅                    | ❌                     | ❌                     |

## Examples

Projects using this template:

- _(Add your project here with a PR!)_

## Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Test your changes: `copier copy . /tmp/test-project`
4. Verify the generated project works: `cd /tmp/test-project && just ci`
5. Submit a pull request

## License

This template is licensed under MIT. Projects generated from this template can use any license.

## FAQ

**Q: Why uv instead of pip/poetry/pdm?**
A: uv is significantly faster and has excellent PEP 751 lockfile support. It's the future of Python packaging.

**Q: Why BasedPyright instead of mypy?**
A: BasedPyright is faster and has better strict mode defaults. It's actively maintained and catches more errors.

**Q: Why Hypothesis for testing?**
A: Property-based testing finds edge cases that unit tests miss. It's especially valuable for numerical code.

**Q: Can I use this for web applications?**
A: No, this template is designed for libraries. For web apps, consider other templates.

**Q: How do I add new dependencies?**
A: Use `uv add package-name` and commit the updated `pyproject.toml` and lockfile.

**Q: What Python versions are supported?**
A: Python 3.11+ (3.11, 3.12, 3.13 are tested in CI).

## Acknowledgments

Inspired by:

- [Copier](https://copier.readthedocs.io/)
- [uv](https://docs.astral.sh/uv/)
- Modern Python packaging best practices
- Real-world data science project needs

---

**Built with ❤️ for the Python data science community**
