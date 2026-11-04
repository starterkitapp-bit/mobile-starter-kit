# Repository Instructions

These instructions apply to every change in this repository.

## Mission

Maintain a reusable, production-minded Flutter foundation for Android and iOS. This is a starter kit, not a finished business application. Optimize for correctness, clarity, consistency, and long-term maintenance—not code volume.

## Required working method

1. Understand the requested outcome, existing repository state, constraints, and acceptance criteria before editing.
2. Research current official documentation and package compatibility when a decision depends on external facts or versions.
3. State material assumptions and unresolved questions. Do not silently decide ambiguous product behavior.
4. Prefer the smallest complete solution. Avoid speculative abstractions, unnecessary layers, duplicated mechanisms, and dependencies without a demonstrated need.
5. Keep changes focused. Do not reformat or modify unrelated files.
6. Update the relevant documentation and project status in the same change when implementation or decisions materially change.
7. Verify changes with the strongest checks available in the current environment. Report exact commands and outcomes; distinguish not-run, blocked, failed, and passed.
8. Never claim that Android/iOS builds, tests, security checks, or runtime behavior passed without evidence.

## Approved technical constraints

- Flutter 3.47.9; Android API 24+; iOS 15+.
- Android and iOS only. Do not add web or desktop targets.
- Forui 0.27.7 is the approved primary UI system.
- Riverpod 3 for state management; go_router for navigation.
- Dio 5.11.1 for networking.
- shared_preferences 2.5.6 through SharedPreferencesAsync for preferences.
- intl 0.20.3; very_good_analysis 11.0.0; mocktail 1.0.5.
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
- Run formatter, analyzer, and relevant tests after implementation.
- Do not lower analyzer strictness or disable rules merely to silence findings.
- CI must eventually run the same meaningful quality gates as local development.

## PowerShell workflow for the maintainer

The maintainer works from Windows PowerShell and executes supplied scripts. Provide one coherent PowerShell script per implementation step, not many fragmented scripts. Do not include commands that launch the app. Every implementation script must finish with dart analyze. Keep scripts focused and avoid backup-file generation or unnecessary checks.

## Completion report

For each implementation step, record:
- Goal and scope.
- Files changed.
- Important decisions and tradeoffs.
- Commands/checks run and their actual results.
- Checks not run and why.
- Remaining risks or follow-up work.
- Documentation/status updates.

A change is not complete merely because code was written.
