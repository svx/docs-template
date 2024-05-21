# Docs Template Repository

> [!WARNING]
> This project is a work in progress.

## About

Template for technical documentation based on Docusaurus.

This setup uses `lefthook` for running the following QA checks (for now) on commits:

- `vale`
- `markdownlint-cli`
- `cspell`

## Development setup

### Nix

> [!TIP]
> If you use `Nix` the following applications will be installed automatically.

- If you have `Nix` and `direnv` installed, you know the drill.
- If you have `Nix` installed without  `direnv` use `nix develop`.

> Do not forget to commit your files to git, otherwise Nix will not be happy.

### Without Nix

Make sure to install all dependencies:

- `Node`
- `yarn`
- `vale`
- `lefthook`

## Installation

Change into the *website* directory and run `yarn` to install Docusaurus.

> [!NOTE]
> GitHub actions for (cron) checks are not configured yet!
