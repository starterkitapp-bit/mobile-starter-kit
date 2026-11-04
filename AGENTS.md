# Repository Instructions

These instructions apply to every change in this repository.

## Mission

Maintain a reusable, production-minded Flutter foundation for Android and iOS. This is a starter kit, not a finished business application. Optimize for correctness, clarity, consistency, and long-term maintenance—not code volume.

## Governing standards

The binding project rules are [docs/ENGINEERING_CONSTITUTION.md](docs/ENGINEERING_CONSTITUTION.md) and [docs/ENGINEERING_STANDARDS.md](docs/ENGINEERING_STANDARDS.md). Use [docs/QUALITY_CHECKLIST.md](docs/QUALITY_CHECKLIST.md) for the 12-point Feature Definition of Done and separate Product Acceptance Checklist. Raise any conflict with approved decisions; never silently change stack, platforms, locales, themes, architecture, or code-generation policy.

Centralization means one authoritative source for shared decisions, not one giant file/module. Apply SOLID pragmatically. Do not create speculative folders, layers, interfaces, or shared components; keep feature-specific policy with its feature.

## Required working method

1. Understand the requested outcome, existing repository state, constraints, and acceptance criteria before editing.
2. Research current official documentation and package compatibility when a decision depends on external facts or versions.
3. State material assumptions and unresolved questions. Do not silently decide ambiguous product behavior.
4. Prefer the smallest complete solution. Avoid speculative abstractions, unnecessary layers, duplicated mechanisms, and dependencies without a demonstrated need.
5. Keep changes focused. Do not reformat or modify unrelated files.
6. Update the relevant documentation and project status in the same change when implementation or decisions materially change.
7. Verify changes with the strongest checks available in GitHub Actions. Report exact workflow evidence and outcomes; distinguish not-run, blocked, failed, and passed.
8. Never claim that Android/iOS builds, tests, security checks, or runtime behavior passed without evidence.

## GitHub-first workflow

- For the maintainer's project workflow, make repository changes directly in GitHub.
- Do not ask the maintainer to install Flutter, run PowerShell, execute local commands, or perform manual file operations on a personal device.
- Use GitHub Actions for dependency resolution, formatting, analysis, tests, and Android build verification.
- Keep the normal verification workflow read-only. Any exceptional write-capable workflow must be narrowly scoped and justified.
- iOS build verification requires macOS/Xcode. Do not claim iOS verification from an Android/Linux runner.
- Local development may be used by optional contributors, but it is not a prerequisite for maintainer progress.

## Approved technical constraints

- Flutter 3.47.9; Dart 3.13.7; Android API 24+; iOS 15+.
- Android and iOS only. Do not add web or desktop targets.
- Forui 0.27.7 is the approved primary UI system.
- flutter_riverpod 3.4.3 for state management; go_router 18.1.2 for navigation.
- Dio 5.11.1 for networking.
- shared_preferences 2.5.6 through SharedPreferencesAsync for non-sensitive preferences.
- intl 0.20.3; very_good_analysis 11.0.0.
- mocktail 1.0.5 is approved for tests when mocking is actually needed; do not add it before then.
- Feature-first organization with pragmatic layers. Clean Architecture is selective, not ceremonial.
- Navigation definitions belong under app/navigation/.
- Arabic and English only; both RTL and LTR must be first-class.
- System, Light, and Dark theme modes must be first-class.
- No code generation, build_runner, Freezed, or json_serializable. The only approved generated source is official Flutter gen-l10n output.
- Prefer Riverpod over introducing a separate dependency-injection package unless a concrete need is demonstrated.

These are approved target versions from the user's engineering constitution. Before adding dependencies, verify current official package metadata, SDK constraints, changelogs, and compatibility. Do not silently upgrade or substitute versions.

## Flutter/Dart implementation rules

- Use sound null safety and idiomatic Dart.
- Keep models and serialization handwritten.
- Avoid force unwraps, broad catch-and-ignore blocks, hidden global mutable state, and unbounded retries.
- Handle loading, empty, success, error, offline, and recovery states where relevant.
- Respect widget lifecycle, async cancellation/disposal, and mounted checks.
- Avoid expensive work in build methods and unnecessary rebuilds.
- Keep platform-specific code isolated and justified.
- Do not add demo-only or fake functionality to production foundations.
- Do not add dependencies for trivial functionality already provided by the SDK or approved stack.

## UX, design, and accessibility

- Use centralized design tokens, theme definitions, typography, spacing, shape, and shared components.
- Avoid one-off styling and inconsistent visual patterns.
- Motion must communicate feedback, state change, continuity, or affordance; it must not add needless delay.
- Support text scaling, readable contrast, semantics, focus behavior, and adequate touch targets.
- Test long text, small screens, keyboard visibility, RTL mirroring, and theme changes.
- Do not hardcode layout assumptions that fail with Arabic text or localization expansion.

## Security and privacy

- Never commit secrets, credentials, signing keys, private certificates, tokens, or real user data.
- Do not log sensitive values.
- Store only data that is necessary; define retention and deletion behavior for persisted user data.
- Validate untrusted input at trust boundaries.
- Use platform security capabilities deliberately; document threat assumptions and tradeoffs.
- Treat network errors, redirects, TLS, and authentication state explicitly when networking is introduced.

## Testing and quality gates

- Add tests for meaningful behavior, edge cases, regressions, and failure paths.
- Prefer deterministic tests; avoid sleeps and real network dependencies.
- Keep test names behavior-focused.
- CI must run lockfile-enforced dependency resolution, formatting, strict analysis, tests, and Android build checks.
- Do not lower analyzer strictness or disable rules merely to silence findings.
- A skipped check is not a pass.

## Completion report

For each implementation step, record:
- Goal and scope.
- Files changed.
- Important decisions and tradeoffs.
- GitHub Actions workflow/checks run and their actual results.
- Checks not run and why.
- Remaining risks or follow-up work.
- Documentation/status updates.

A change is not complete merely because code was written.
