# Python Project Template

**A modern Copier template for Python data-science libraries.**
Fast tooling. Strict typing. Zero setup pain.

Generate a project and start writing code—not configuration.

---

## What This Is

An **opinionated, batteries-included template** for building Python libraries with:

* **Python 3.11+**
* **Data-science–friendly defaults**
* **Strict typing by default**
* **CI and dependency updates ready on day one**

No legacy cruft. No optional chaos.

---

## Why You Want This

✅ You use (or want to use) modern Python
✅ You care about type safety
✅ You don’t want to design a project layout *again*
✅ You want CI to pass on the first run

If that’s you—this template is done thinking for you.

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
copier copy gh:balajiselvaraj1601/python_project_template my-project
cd my-project
just ci
```

That’s it.
Dependencies installed. Git initialized. CI should be green.

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

Exactly what you expect. Nothing you don’t.

---

## Daily Workflow

```bash
just fmt        # format
just lint       # lint
just typecheck  # type check
just test       # run tests
just ci         # run everything
```

One command runner. No guesswork.

---

## Who This Is For

* Data-science and ML libraries
* Internal tools that shouldn’t rot
* Open-source projects that need discipline
* Teams that want **less debate, more shipping**

---

## Who This Is *Not* For

* Python 3.8 nostalgia
* “Optional typing”
* DIY project scaffolding
* Framework-heavy starter kits

This template has opinions. Strong ones.

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
