# Python Contributor Instructions — Authoritative

These rules define how Python code must be written, generated, reviewed, and validated for projects created from this template.
They combine repository-specific constraints with the authoritative Python standards used by Copilot assistance.

---

## 1. Repository Context (Read This First)

This repository is a **Copier template**.

- Edit files under `template/` to change generated projects.
- Do not edit generated output directly.
- Always validate changes by generating a project and running the checks below.

### Key Template Files

- `template/src/{{ package_name }}/__init__.py.jinja`
- `template/src/{{ package_name }}/core.py.jinja`
- `template/tests/unit/test_core.py.jinja`

---

## 2. Local Verification (Generated Project)

All changes must pass the following checks in a freshly generated project:

```bash
copier copy . /tmp/test-project
cd /tmp/test-project
just fmt
just lint
just type
just test
just coverage
just ci
```

Generated projects are expected to pass **strict linting and typing**.

---

## 3. Target Environment

- Python 3.11+
- CPython only
- Do not assume optional runtime dependencies unless enabled via `copier.yml`

---

## 4. Core Design Principles

- Readability and maintainability over cleverness
- Explicit behavior over implicit magic
- Small, focused units
- Prefer composition and dependency injection
- Write code for the next maintainer, not the original author

---

## 5. Formatting & Naming

### Formatting

- PEP 8, Black-compatible
- Target line length: ~88 characters
- One statement per line
- Use blank lines to separate logical sections
- Prefer early returns
- Avoid deeply nested control flow
- Functions longer than ~30 lines usually indicate refactoring

### Naming

- Variables & functions: `snake_case`
- Constants: `UPPER_SNAKE_CASE`
- Classes: `PascalCase`
- Names must be descriptive; avoid vague names like `data`, `info`, `value`

---

## 6. Typing (Mandatory for Public APIs)

- Type hints are required for all public functions, methods, and classes
- Avoid `Any`
- Prefer built-in generics (`list[str]`, `dict[str, int]`)
- Use `Optional[T]` only when `None` is meaningful
- Use `TypeVar` for generics
- NumPy (when enabled):

  - `import numpy.typing as npt`
  - Use `npt.NDArray[...]`

Strict type checking is enforced via **BasedPyright**.

---

## 7. Docstrings (Google Style — Mandatory)

All public modules, classes, functions, and methods must include **Google-style docstrings**.

### Rules

- One-line imperative summary
- Blank line after the summary
- Use sections when applicable:

  - `Args`
  - `Returns`
  - `Raises`
  - `Examples`

- Describe behavior and intent, not implementation details

---

## 8. Functions

### Rules

- Keep functions short and single-purpose
- Prefer pure functions
- Avoid mutable default arguments
- Prefer returning values over mutating inputs
- Raise specific exceptions with clear, actionable messages
- Catch only exceptions you can handle meaningfully

### Function Example

```python
def normalize_email(email: str) -> str:
    """Normalize an email address.

    Args:
        email: Raw email address.

    Returns:
        A normalized, lowercase email address.

    Raises:
        ValueError: If the email address is invalid.
    """
    normalized = email.strip().lower()
    if "@" not in normalized:
        raise ValueError("Invalid email address")
    return normalized
```

---

## 9. Classes

Classes must represent **cohesive concepts** with clear responsibilities.
Prefer **composition over inheritance**.

### General Rules

- All public classes must have a class-level docstring
- Keep `__init__` minimal
- Avoid complex logic in constructors
- Document all public methods
- Avoid hidden or global state

---

### 9.1 Data Classes

Use `@dataclass` for simple data containers.

#### Rules

- Prefer `frozen=True` unless mutation is required
- Do not embed business logic
- Use type hints for all fields
- Document attributes in the class docstring

#### Example

```python
from dataclasses import dataclass

@dataclass(frozen=True)
class User:
    """Represent a system user.

    Attributes:
        id: Unique user identifier.
        email: User email address.
        is_active: Whether the user is active.
    """

    id: int
    email: str
    is_active: bool = True
```

---

### 9.2 Service / Behavior Classes

Use regular classes for behavior, orchestration, and coordination.

#### Rules

- Inject dependencies explicitly
- Keep methods focused
- Do not perform I/O at construction time

#### Example

```python
class UserService:
    """Provide operations related to user management."""

    def __init__(self, repository: UserRepository) -> None:
        self._repository = repository

    def get_user(self, user_id: int) -> User:
        """Retrieve a user by ID.

        Args:
            user_id: Unique identifier of the user.

        Returns:
            The matching user.

        Raises:
            UserNotFoundError: If the user does not exist.
        """
        user = self._repository.find_by_id(user_id)
        if user is None:
            raise UserNotFoundError(f"User {user_id} not found")
        return user
```

---

## 10. Imports, Logging & Side Effects

### Imports

- Order:

  1. Standard library
  2. Third-party
  3. Local modules

- Prefer absolute imports
- No wildcard imports

### Logging

- Use `logging`; never use `print`
- Log messages must be clear and actionable
- Never log secrets

### Side Effects

- Avoid side effects at import time
- Defer I/O and expensive operations to functions or explicit entry points

---

## 11. Module Metadata & Public API

- Define `__version__` in the package `__init__.py`
- Maintain an explicit `__all__`
- Update `__all__` when adding or removing public symbols
- Avoid unused imports and variables

---

## 12. Testing

- Tests live under:

  - `tests/unit/`
  - `tests/properties/` (optional)

- Test files and functions start with `test_`
- Test functions return `-> None`
- Prefer simple `assert` statements

---

## 13. Prohibited Patterns & Common Pitfalls

- Global mutable state
- Metaprogramming and implicit magic
- Clever one-liners that reduce readability
- Implicit behavior without documentation
- Relying on globally installed tool versions

### Template-Specific Notes

- Update `copier.yml` when dependency choices vary
- Keep workflows and `justfile.jinja` aligned so `just ci` mirrors CI
- Use `uv` for pinned tool execution

---

## 14. Final Rule

If code is unclear, surprising, or difficult to reason about, it does not meet the standards of this template — even if it passes all checks.

---
