#!/usr/bin/env bash
# Test script for validating the Copier template

set -e  # Exit on error

echo "🧪 Testing Python Project Template"
echo "=================================="
echo ""

# Check prerequisites
echo "📋 Checking prerequisites..."

command -v uv >/dev/null 2>&1 || { echo "❌ uv not found. Install: curl -LsSf https://astral.sh/uv/install.sh | sh"; exit 1; }
echo "Using uv: $(which uv)"
command -v copier >/dev/null 2>&1 || { echo "❌ copier not found. Install: uv tool install copier"; exit 1; }
command -v just >/dev/null 2>&1 || { echo "⚠️  just not found (optional). Install: https://github.com/casey/just"; }

echo "✅ Prerequisites satisfied"
echo ""

# Test 1: Generate with default configuration
echo "🔧 Test 1: Generating with defaults..."
TEST_DIR_1="/tmp/copier-test-default-$(date +%s)"

copier copy . "$TEST_DIR_1" --data project_name="Test Project" --trust --defaults

echo "✅ Generated project at $TEST_DIR_1"
echo ""

# Verify structure
echo "📁 Verifying project structure..."
cd "$TEST_DIR_1"

if [ ! -f "pyproject.toml" ]; then
    echo "❌ Missing pyproject.toml"
    exit 1
fi

if [ ! -d "src" ]; then
    echo "❌ Missing src/ directory"
    exit 1
fi

if [ ! -d "tests" ]; then
    echo "❌ Missing tests/ directory"
    exit 1
fi

if [ ! -f ".github/workflows/ci.yml" ]; then
    echo "❌ Missing CI workflow"
    exit 1
fi

echo "✅ Project structure verified"
echo ""

# Test 2: Run CI checks
echo "🚀 Test 2: Running CI checks..."


if ! uv sync --extra dev --extra test; then
    echo "❌ Failed to sync dependencies"
    exit 1
fi

# echo "Running formatter check..."
# if ! uv run ruff format --check .; then
#     echo "❌ Formatting check failed"
#     exit 1
# fi

# echo "Running linter..."
# if ! uv run ruff check .; then
#     echo "❌ Linting failed"
#     exit 1
# fi

echo "Running type checker..."
if ! uv run basedpyright; then
    echo "❌ Type checking failed"
    exit 1
fi

echo "Running tests..."
if ! uv run pytest; then
    echo "❌ Tests failed"
    exit 1
fi

# echo "Running pre-commit hooks..."
# if ! uv run pre-commit run --all-files; then
#     echo "❌ Pre-commit hooks failed"
#     exit 1
# fi

echo "✅ All CI checks passed"
echo ""

# Test 3: Generate with all features enabled
echo "🔧 Test 3: Generating with all features..."
TEST_DIR_2="/tmp/copier-test-full-$(date +%s)"

copier copy . "$TEST_DIR_2" \
    --trust \
    --data project_name="Full Test Project" \
    --data project_description="A Python data-science library" \
    --data author_name="Test Author" \
    --data author_email="test@example.com" \
    --data github_username="testuser" \
    --data python_min_version="3.11" \
    --data license="MIT" \
    --data include_pandas_support=true \
    --data include_docs=true \
    --data include_numpy=true \
    --data codecov_token=""

echo "✅ Generated project at $TEST_DIR_2"
echo ""

cd "$TEST_DIR_2"

if [ ! -f "mkdocs.yml" ]; then
    echo "❌ Missing mkdocs.yml (docs should be included)"
    exit 1
fi

if ! grep -q "pandas" pyproject.toml; then
    echo "❌ pandas not in dependencies"
    exit 1
fi

echo "✅ Full-featured project verified"
echo ""

# Test 4: Verify update workflow doesn't break
echo "🔄 Test 4: Testing update workflow..."

cd "$TEST_DIR_1"

# Make a small change
echo "# User change" >> README.md

# Try to update (should skip README.md)
copier update --defaults --trust || true

if ! grep -q "# User change" README.md; then
    echo "❌ Update overwrote user changes"
    exit 1
fi

echo "✅ Update workflow preserves user changes"
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ All tests passed!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Test projects created:"
echo "  • Default config: $TEST_DIR_1"
echo "  • Full features:  $TEST_DIR_2"
echo ""
echo "Clean up with:"
echo "  rm -rf $TEST_DIR_1 $TEST_DIR_2"
