# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Nix flake templates repository providing reusable project templates. Available templates:
- `minimal`: Basic flake with treefmt-nix (nixfmt)
- `nodejs`: Minimal + Node.js development environment
- `haskell`: Minimal + Haskell environment (GHC, Cabal, HLS, ormolu)

## Common Commands

- `nix flake check` - Validate all flake outputs and templates
- `nix flake show` - Display available templates

## Architecture

**Root flake.nix**: Template registry that declares available templates by pointing to subdirectories.

**Template flake.nix files** (`<template>/flake.nix`): Standalone flakes using flake-parts with:
- `inputs`: nixpkgs, flake-parts, treefmt-nix (with follows)
- `systems`: aarch64-darwin, x86_64-linux
- `treefmt`: Code formatting config (nixfmt always, plus language-specific formatters)
- `devShells.default`: Development shell with `inputsFrom = [config.treefmt.build.devShell]`

## Adding a New Template

1. Create `<template-name>/flake.nix` following the existing pattern
2. Register in root `flake.nix` under `outputs.templates`
3. Run `nix flake check` to validate

## Documentation

コードを変更する際は、関連するドキュメントの更新を必ず行ってください：

- **README.md**: ユーザー向けの説明、使用方法、テンプレート一覧の更新
- **CLAUDE.md**: アーキテクチャ、コマンド、開発ガイドラインの更新

特に以下の変更時は注意：
- 新しいテンプレートの追加 → README.mdのテンプレート一覧を更新
- コマンドやワークフローの変更 → CLAUDE.mdのCommon Commandsを更新
- アーキテクチャの変更 → CLAUDE.mdのArchitectureを更新
