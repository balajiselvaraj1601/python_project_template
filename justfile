# ==========================================================================
# Justfile for python-project-template
#
# Usage:
#   just            # list commands
#   just ci         # run full CI locally
#   just test       # run tests
# ==========================================================================

# Always show commands if no recipe is given
default:
    @just --list

# -------------------------------------------------------------------------
# Helpers (private)
# -------------------------------------------------------------------------

_set_env:
    @echo "Using Python >= 3.11"
    @uv --version > /dev/null

# -------------------------------------------------------------------------
# Formatting & Linting
# -------------------------------------------------------------------------

fmt:
    @uv run ruff format .

lint:
    @uv run ruff check .

fix:
    @uv run ruff check --fix .

mdformat:
    @uv run sh -c 'files=$(git ls-files --exclude-standard "*.md"); if [ -n "$files" ]; then printf "%s\n" $files | xargs mdformat; else echo "No markdown files to format."; fi'

mdformat-check:
    @uv run sh -c 'files=$(git ls-files --exclude-standard "*.md"); if [ -n "$files" ]; then printf "%s\n" $files | xargs mdformat --check; else echo "No markdown files to check."; fi'

# Reformat Jinja templates under `template/`
djlint:
    @uv run sh -c 'find template -type f -name "*.jinja" -print0 | xargs -0 -n 50 uv run djlint --reformat --extension jinja || true'

# -------------------------------------------------------------------------
# Type checking
# -------------------------------------------------------------------------

type:
    @uv run basedpyright

# -------------------------------------------------------------------------
# Testing
# -------------------------------------------------------------------------

#test:
#    @uv run pytest tests/ -v
#
#test-parallel:
#    @uv run pytest tests/ -v -n auto
#
#coverage:
#    @uv run pytest tests/ \
#        --cov=src \
#        --cov-report=term-missing \
#        --cov-report=html \
#        --cov-report=xml

# -------------------------------------------------------------------------
# Pre-commit
# -------------------------------------------------------------------------

precommit-install:
    @uv run pre-commit install
    @uv run pre-commit install --hook-type pre-push

precommit:
    @uv run pre-commit run --all-files --verbose

# -------------------------------------------------------------------------
# Dependency management
# -------------------------------------------------------------------------

sync:
    @uv sync --extra dev --extra test

update:
    @uv lock --upgrade
    @uv sync --extra dev --extra test

# -------------------------------------------------------------------------
# Build & Publish
# -------------------------------------------------------------------------

build:
    @uv build

publish:
    @uv publish

# -------------------------------------------------------------------------
# Cleaning
# -------------------------------------------------------------------------

clean:
    @rm -rf build/ dist/ *.egg-info
    @rm -rf .pytest_cache .ruff_cache .coverage htmlcov
    @find . -type d -name "__pycache__" -exec rm -rf {} +
    @find . -type f -name "*.pyc" -delete

# -------------------------------------------------------------------------
# CI (local mirror of GitHub Actions)
# -------------------------------------------------------------------------

ci:
    @just mdformat-check
    @just djlint
    @just lint
    @just type
    # tests are not present in this template project; skip running tests
    @just precommit

# -------------------------------------------------------------------------
# Doctor / Diagnostics
# -------------------------------------------------------------------------

doctor:
    @echo "=== Environment ==="
    @python --version
    @uv --version
    @echo ""
    @echo "=== Tools ==="
    @uv run ruff --version
    @uv run basedpyright --version || echo "basedpyright not installed"
    @uv run pytest --version
    @echo ""
    @echo "=== Project ==="
    @echo "Package: python_project_template"
    @echo "Python: >= 3.11"
