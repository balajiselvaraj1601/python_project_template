# Markdown Instructions

This repository uses Markdown files extensively for documentation, READMEs, and other textual content. As an AI coding agent, follow these guidelines when creating, editing, or generating Markdown files to ensure consistency, readability, and proper formatting.

## Big Picture

Markdown files in this Copier template are primarily used for:

- Project documentation (README, API docs, design docs)
- Contributing guidelines
- License files
- MkDocs site content

All Markdown files in the `template/` directory are Jinja templates with `.md.jinja` extensions, allowing dynamic content generation based on Copier prompts.

## Where to Look First

- [README.md](README.md) for overall project structure and quick reference
- Existing `.md.jinja` files in `template/` for examples of templated Markdown
- `template/mkdocs.yml.jinja` for documentation site configuration
- `copier.yml` for available template variables

## Primary Workflows

### Editing Template Markdown Files

1. **Use Jinja templating appropriately**: Leverage variables from `copier.yml` for dynamic content (e.g., `{{ package_name }}`, `{{ author_name }}`)
1. **Maintain consistent structure**: Follow the established patterns in existing templates
1. **Test generation**: After edits, generate a test project and verify the rendered Markdown

### Formatting Standards

- **Headers**: Use `#` for main title, `##` for sections, `###` for subsections
- **Links**: Use relative paths for internal links, absolute URLs for external
- **Code blocks**: Specify language for syntax highlighting (e.g., \`\`\`python)
- **Lists**: Use consistent indentation and bullet styles
- **Tables**: Use Markdown table syntax with proper alignment

### Content Guidelines

- **Clarity**: Write clear, concise documentation
- **Consistency**: Use consistent terminology and formatting across files
- **Completeness**: Ensure all sections are filled appropriately in templates
- **Accessibility**: Use alt text for images, descriptive link text

## Tooling Conventions

- **Preview**: Use VS Code's Markdown preview or MkDocs for rendering
- **Linting**: No specific Markdown linter configured, but follow common best practices
- **Validation**: Manually review generated content for correctness

## Template Patterns to Preserve

- **Conditional content**: Use `{% if condition %}` blocks sparingly for optional sections
- **Variable substitution**: Use `{{ variable }}` for dynamic text insertion
- **Include other files**: Use Jinja includes if needed for reusable content
- **Front matter**: Include YAML front matter in MkDocs pages as needed

## Common Pitfalls

- **Hardcoded values**: Avoid hardcoding project-specific info; use template variables
- **Broken links**: Ensure all links work in the generated context
- **Inconsistent formatting**: Match the style of existing Markdown files
- **Missing alt text**: Always provide alt text for images

## Examples of Useful Edits

- **Add a new documentation section**: Update relevant `.md.jinja` files and `mkdocs.yml.jinja`
- **Update README content**: Modify `template/README.md.jinja` with new features or instructions
- **Add API documentation**: Edit `template/docs/api.md.jinja` with new endpoints or classes
- **Update contributing guidelines**: Modify `template/CONTRIBUTING.md.jinja` for new processes
