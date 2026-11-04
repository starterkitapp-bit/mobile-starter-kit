# Development Guide

## Current repository state

The repository contains an official Flutter 3.47.9 scaffold for Android and iOS, the approved direct dependency baseline, a committed lockfile, strict static analysis, and a GitHub Actions verification workflow.

Shared app capabilities are still pending. See PROJECT_STATUS.md for the exact verified state and next milestone.

## GitHub-first working agreement

For the current project workflow, repository changes and verification are performed directly in GitHub. The maintainer does not need to run PowerShell scripts, install Flutter locally, or execute commands on a personal device.

- Make focused changes through GitHub commits.
- Use GitHub Actions as the source of truth for formatting, analysis, tests, dependency resolution, and Android builds.
- Do not report a check as passed until the corresponding workflow step has completed successfully.
- Keep documentation and PROJECT_STATUS.md aligned with the actual repository.
- Do not silently change approved versions, package choices, or supported platforms.
- Do not create empty folders or placeholder implementations merely to make the repository look complete.

Contributors may optionally use a local Flutter environment, but local execution is not required for the maintainer's GitHub-first workflow.

## Toolchain and platform requirements

- Flutter: 3.47.9 stable.
- Dart: 3.13.7, bundled with the pinned Flutter SDK.
- Android: API 24+.
- iOS: deployment target 15.0+.
- Supported targets: Android and iOS only.
- iOS build verification requires macOS and Xcode. The current CI workflow verifies Android only.

Do not infer that a platform environment is configured merely because a project scaffold exists.

## GitHub Actions verification

The workflow in `.github/workflows/flutter-ci.yml` runs on pushes to main and pull requests targeting main.

It performs, in order:
1. Install the pinned Flutter 3.47.9 SDK.
2. Resolve dependencies using the committed lockfile with `flutter pub get --enforce-lockfile`.
3. Check Dart formatting.
4. Run `flutter analyze` with Very Good Analysis.
5. Run `flutter test`.
6. Build an Android debug APK.

Normal verification uses read-only repository permissions. Do not add write permissions to the verification job. Dependency lockfile changes must be intentional and reviewed.

## Dependency changes

Before adding or updating a package:
- Confirm the package exists and is maintained.
- Check its current stable release, changelog, SDK constraints, and platform support.
- Check compatibility with the approved Flutter/Dart baseline and other selected packages.
- Evaluate security, transitive dependencies, license, size, and maintenance risk.
- Prefer SDK capabilities when equivalent.
- Explain why the dependency is needed.
- Update pubspec.yaml and pubspec.lock together.
- Record a decision when an approved choice changes.

Do not add a dependency merely because it is part of the approved candidate list. For example, mocktail is deferred until a test has a real mocking requirement.

## Branch and commit practices

- Keep commits focused and descriptive.
- Prefer conventional commit prefixes such as docs:, chore:, feat:, fix:, test:, and ci:.
- Prefer feature branches and pull requests for substantive implementation once branch protection and review workflow are configured.
- Do not force-push or rewrite shared history without explicit approval.
- Never commit secrets, local build output, IDE state, or machine-specific configuration.

## Before a change is complete

Use the quality checklist. Update PROJECT_STATUS.md and relevant docs. Report changed files, checks, results, limitations, and remaining risks.
