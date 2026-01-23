# Quick Reference Guide

## Testing the Template Locally

```bash
# Test generating a new project
copier copy . /tmp/test-project

# Navigate and verify
cd /tmp/test-project

# Check that everything works
just ci
```

## Template Structure

```
python_project_template/
├── copier.yml                    # Main configuration
├── instructions.md               # Design document
├── README.md                     # Template usage docs
└── template/                     # Template files
    ├── .github/
    │   ├── workflows/
    │   │   └── ci.yml.jinja     # CI pipeline
    │   └── renovate.json         # Dependency updates
    ├── src/
    │   └── {{ package_name }}/
    │       ├── __init__.py.jinja
    │       ├── core.py.jinja
    │       └── py.typed
    ├── tests/
    │   ├── unit/
    │   │   └── test_core.py.jinja
    │   ├── properties/
    │   │   └── test_properties.py.jinja
    │   └── test_imports.py.jinja
    ├── docs/
    │   ├── index.md.jinja
    │   ├── design.md.jinja
    │   └── api.md.jinja
    ├── .copier-answers.yml.jinja
    ├── .gitignore
    ├── .pre-commit-config.yaml
    ├── CONTRIBUTING.md.jinja
    ├── justfile.jinja
    ├── LICENSE.jinja
    ├── mkdocs.yml.jinja
    ├── pyproject.toml.jinja
    └── README.md.jinja
```

## Updating the Template

When you make changes to the template:

1. Test locally first:

   ```bash
   copier copy . /tmp/test-project
   cd /tmp/test-project
   just ci
   ```

1. Update existing projects:

   ```bash
   cd existing-project
   copier update
   git diff  # Review changes
   just ci   # Verify nothing broke
   ```

## Common Modifications

### Adding a New Tool

1. Add to `template/pyproject.toml.jinja`:

   ```toml
   [project.optional-dependencies]
   dev = [
       "your-tool>=1.0.0",
   ]
   ```

1. Add configuration section if needed

1. Update `template/justfile.jinja` with new command

1. Update `.github/workflows/ci.yml.jinja` if CI check needed

### Adding a New Question

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

### Changing Default Versions

Update in `copier.yml`:

```yaml
python_min_version:
  default: "3.12" # Change default version
  choices:
    - "3.11"
    - "3.12"
    - "3.13"
```

## Publishing the Template

### Option 1: GitHub (Recommended)

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

### Option 2: Local Path

```bash
copier copy /path/to/python_project_template my-project
```

### Option 3: Git URL

```bash
copier copy https://github.com/YOUR_USERNAME/python_project_template.git my-project
```

## Maintenance Checklist

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
