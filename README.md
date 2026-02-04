# Python Project Template

A modern Copier template for Python data-science libraries.

Fast tooling. Strict typing. Zero setup pain.

Generate a project and start writing code—not configuration.

---

## What You Get Out of the Box

* ⚡ **uv** for fast dependency management
* 🧹 **Ruff** for linting + formatting
* 🧠 **BasedPyright** for strict typing
* 🧪 **pytest** with coverage
* 🔄 **GitHub Actions** CI
* 📦 **Renovate** for automated dependency updates
* 🗂️ **src/** layout with `py.typed`

Optional docs via **MkDocs**.

---

## Create a Project

```bash
uv tool install copier
copier copy gh:balajiselvaraj1601/python_project_template my-project --trust
cd my-project
just ci
```

---

## Project Shape (Clean & Boring)

```
src/<package>/
tests/
.github/workflows/
pyproject.toml
justfile
README.md
```

---

## Daily Workflow

```bash
just fmt        # format
just lint       # lint
just typecheck  # type check
just test       # run tests
just ci         # run everything
```

---

## Updating Existing Projects

```bash
copier update
git diff
just ci
```

Safe, reviewable, boring—in a good way.

---

## License

MIT
