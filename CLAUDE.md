# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Nix flake templates repository that provides reusable templates for new projects. Currently contains:
- `minimal`: Basic flake with treefmt-nix for code formatting
- `nodejs`: Extends minimal template with Node.js development environment
- `haskell`: Extends minimal template with Haskell development environment (GHC, Cabal, HLS)

## Common Commands

### Repository Development
- `nix flake check` - Validate all flake outputs and templates
- `nix flake show` - Display available templates

### Using Templates
```sh
# Initialize with minimal template
nix flake init -t github:thinceller/flake-templates#minimal

# Initialize with Node.js template
nix flake init -t github:thinceller/flake-templates#nodejs

# Initialize with Haskell template
nix flake init -t github:thinceller/flake-templates#haskell
```

### In Template Projects
- `nix develop` - Enter development shell
- `treefmt` - Format code using configured formatters

## Architecture

Templates use:
- **flake-parts**: Modular flake framework for cleaner organization
- **treefmt-nix**: Universal code formatter integration
  - nixfmt enabled by default in all templates
  - ormolu enabled in Haskell template for Haskell code formatting
- Development shells include treefmt tooling via `inputsFrom`

Template structure follows standard Nix flake patterns with `inputs` and `outputs`, using flake-parts' `mkFlake` helper for system-specific configurations.
