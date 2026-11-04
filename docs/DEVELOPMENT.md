# Development Guide

## Current repository state

This repository is currently in the documentation and governance foundation stage. It does not yet contain a Flutter application scaffold.

## Working agreement

- Read AGENTS.md and the engineering constitution before changing the stack or architecture.
- Work in small, reviewable milestones with clear acceptance criteria.
- Research official docs and package compatibility when external facts matter.
- Do not silently change approved versions or supported platforms.
- Keep docs and status synchronized with code.
- Do not add placeholder implementations merely to make a folder look complete.

## Local environment

The approved Flutter baseline is 3.47.9 stable. The maintainer's Windows environment can support Android development when the Android SDK/toolchain is correctly configured. iOS builds require macOS and Xcode.

Once the Flutter scaffold exists, the setup guide must record:
- Flutter and Dart versions.
- Android SDK/platform/build-tools requirements.
- Java/JDK compatibility.
- Xcode and CocoaPods requirements for iOS.
- Required environment variables and local-only configuration.
- Reproducible dependency resolution.

Do not infer that an environment is configured merely because Flutter is installed.

## PowerShell implementation steps

Provide one coherent PowerShell script per implementation step. Scripts should:
- State their goal and expected scope.
- Stop on errors.
- Avoid destructive cleanup and backup-file creation.
- Avoid launching the application.
- Avoid silently overwriting user changes.
- Run dart analyze at the end of every implementation script.
- Print enough output to diagnose failures.

The maintainer executes scripts and shares their output for review. Do not ask them to run separate analyzer commands after a script that should already include it.

## Expected verification sequence

Once the Flutter project exists, choose checks appropriate to the change:
1. dart format --output=none --set-exit-if-changed .
2. flutter analyze (or dart analyze where appropriate).
3. Focused unit/widget tests.
4. Full flutter test.
5. Android build checks in a configured Windows/Linux environment.
6. iOS build checks on macOS/Xcode.

Record actual results and environment. A skipped check is not a pass.

## Dependency changes

Before adding/updating a package:
- Confirm the package exists and is maintained.
- Check its current stable release, changelog, SDK constraints, and platform support.
- Check compatibility with the approved Flutter/Dart baseline and other selected packages.
- Evaluate security, transitive dependencies, license, size, and maintenance risk.
- Prefer SDK capabilities when equivalent.
- Explain why the dependency is needed.
- Update the dependency decision record when it changes an approved choice.

## Branch and commit practices

- Keep commits focused and descriptive.
- Prefer conventional commit prefixes such as docs:, chore:, feat:, fix:, test:, and ci:.
- Use feature branches and pull requests for substantive implementation once branch protection and review workflow are configured.
- Do not force-push or rewrite shared history without explicit approval.
- Never commit secrets, local build output, IDE state, or machine-specific configuration.

## Before a change is complete

Use the quality checklist. Update PROJECT_STATUS.md and relevant docs. Report changed files, checks, results, limitations, and remaining risks.
