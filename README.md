# Genie DRN

*Perform DRN replacement on Genie configurations and assets*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

Genie DRN is a plugin for the Genie task manager that introduces Data Representation Notation (DRN) substitution for configurations and assets. It integrates with the Genie lifecycle to process YAML and JSON files automatically. This helps creators maintain cleaner data structures by relying on dynamic replacement at build and deployment times.

## Features

- Integrates DRN replacement directly into the Genie environment.
- Processes `.yaml` and `.json` configuration files during `build`, `publish`, and `deploy` lifecycle hooks.
- Extends the `read` operation using Masonry hooks for inline DRN replacement.
- Supports customized file targeting through glob matching patterns.

## Installation

```bash
pnpm install -D @dashkite/genie-drn
```

## Usage

Genie automatically registers the preset upon installation. It injects the `drn:replace` command into the lifecycle to resolve and replace DRNs with literals during builds, publishing, and deployment.

You can explicitly trigger the replacement operation using the CLI:

```bash
npx genie drn:replace
```

This ensures your configurations are completely resolved prior to other tasks.

## Other Resources

- [Recipes](docs/recipes.md)
- [Reference](docs/reference.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing](docs/testing.md)
