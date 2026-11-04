# Engineering Constitution

**Reference:** STARTER_KIT — FINAL ENGINEERING CONSTITUTION, Version 4.0  
**Status:** Approved project authority  
**Purpose:** Define non-negotiable engineering constraints for Mobile Starter Kit.

## 1. Product identity

Mobile Starter Kit is a reusable, project-neutral foundation for building production mobile applications. It is not a finished app, a showcase, or a framework that hides Flutter behind unnecessary abstractions.

The foundation must be useful immediately, understandable by a small team, and safe to extend. Quality is more important than feature count.

## 2. Platform and toolchain baseline

| Concern | Approved baseline |
|---|---|
| Flutter | 3.47.9 stable |
| Dart | 3.13.7 (bundled with Flutter 3.47.9) |
| Android | API 24+ |
| iOS | iOS 15+ |
| Supported targets | Android and iOS only |
| UI system | Forui 0.27.7 |
| State | flutter_riverpod 3.4.3 |
| Routing | go_router 18.1.2 |
| HTTP | Dio 5.11.1 |
| Preferences | shared_preferences 2.5.6, using SharedPreferencesAsync |
| Localization formatting | intl 0.20.3 |
| Static analysis | very_good_analysis 11.0.0 |
| Mocking | mocktail 1.0.5, only when tests require mocks |
| Architecture | Feature-first, pragmatic layers |

Version numbers are approved targets, not proof of successful resolution. Before dependency installation, check official package pages, changelogs, SDK constraints, transitive constraints, and platform support. Record any required deviation as an explicit decision. Exact selected versions and the resolved graph are recorded in pubspec.yaml and pubspec.lock.

## 3. Architecture constraints

- Organize by feature first; keep shared application infrastructure in clearly named shared/core areas only when it is genuinely cross-feature.
- Apply presentation, application, domain, and data separation selectively where it provides real boundaries.
- Do not create interfaces, repositories, use cases, services, managers, or wrappers without a concrete responsibility and testability or change-isolation benefit.
- Riverpod is the default composition and dependency mechanism; do not add a separate DI package by default.
- Keep app routing under app/navigation/.
- Keep platform-specific integration at explicit boundaries.
- Make optional modules removable without destabilizing the core.
- Avoid circular dependencies and feature-to-feature implementation coupling.

## 4. Localization and directionality

- Arabic and English are the supported locales.
- Arabic is RTL; English is LTR.
- Locale preference supports System, Arabic, and English.
- Resolve unsupported device locales predictably to the documented fallback.
- Persist and restore explicit user preference.
- Use Flutter's official gen-l10n workflow. This is the sole exception to the no-generated-source rule.
- Never concatenate translated fragments to form sentences.
- Localize dates, numbers, and plural forms correctly.
- Verify layout mirroring, text alignment, icons with directional meaning, overflow, and long translated strings.

## 5. Theme and design system

- Light and Dark are complete first-class themes.
- Theme preference supports System, Light, and Dark.
- System follows platform appearance; explicit preferences override it.
- Centralize color, typography, spacing, shape, elevation, motion, and component behavior.
- Forui is the primary UI foundation; avoid parallel design systems.
- Functional status colors may be used when they improve meaning and accessibility.
- Avoid arbitrary per-screen styling, visual inconsistency, gratuitous gradients, and decorative motion.

## 6. Startup and app lifecycle

- The native launch presentation is distinct from the Flutter startup experience.
- Do not add arbitrary fixed startup delays.
- Route according to actual initialization and application state.
- Initialization must be bounded, observable, and resilient.
- Recoverable startup failures must provide a clear recovery path.
- Avoid blocking the first frame with unrelated or nonessential work.
- Define behavior for backgrounding, resuming, process death, and interrupted initialization.

## 7. Security, privacy, and data

- Minimize collection and persistence.
- Never commit secrets or personal data.
- Define storage classification and threat assumptions before selecting storage.
- SharedPreferencesAsync is for non-sensitive preferences only; it is not secure storage for credentials or secrets.
- Validate data at trust boundaries.
- Avoid sensitive logging and accidental data disclosure in error reporting.
- Define data lifecycle, reset, and deletion behavior.
- Apply least privilege to platform permissions.
- Review dependency health and supply-chain risk.

## 8. Networking and reliability

- Use Dio as the approved HTTP client when networking is required.
- Centralize only genuinely shared transport concerns; keep feature policy close to the feature.
- Define timeouts, cancellation, error mapping, authentication behavior, and retry policy explicitly.
- Retries must be bounded and safe for the request's idempotency.
- Distinguish transport failures, server failures, validation failures, and authorization failures.
- Never assume connectivity guarantees server reachability.
- Do not log authorization headers, tokens, or sensitive payloads.

## 9. UX, accessibility, and performance

- Optimize for clarity, predictable navigation, low cognitive load, and consistent interaction.
- Every interactive element must expose meaningful feedback and accessible semantics.
- Support text scaling, contrast, touch target size, focus, keyboard, and screen-reader behavior.
- Use motion intentionally and respect reduced-motion preferences where applicable.
- Avoid unnecessary rebuilds, expensive synchronous startup work, unbounded image/data caching, and memory leaks.
- Test small and large screens, keyboard insets, system bars, orientation assumptions, and lifecycle transitions.

## 10. Testing and delivery

- Unit-test pure logic and boundaries.
- Widget-test meaningful UI behavior and states.
- Integration-test critical user journeys and platform-specific behavior.
- Include failure and edge cases, not only happy paths.
- GitHub Actions must enforce the committed dependency lockfile, formatting, analysis, tests, and Android build.
- Android build verification must run in a compatible environment.
- iOS build verification requires macOS and Xcode; never claim it was verified from Windows or Linux.
- Release signing, secrets, and distribution must be handled outside source control.

## 11. Prohibited practices

- Code generation except official gen-l10n.
- Freezed, json_serializable, build_runner.
- Unnecessary dependency injection frameworks.
- Speculative abstractions and over-engineering.
- Fake functionality, dead code, TODO-driven core behavior, or demo-only shortcuts.
- Unbounded retries, swallowed errors, silent fallback that hides defects.
- Hardcoded visual values scattered across screens.
- Unsupported platform targets.
- Claims of test/build/release success without evidence.

## 12. Decision governance

The constitution is the governing baseline. A change to an approved constraint requires:
1. A concrete problem or requirement.
2. Current authoritative evidence.
3. Options and tradeoffs.
4. Compatibility and migration impact.
5. A recorded Architecture Decision Record.
6. An explicit maintainer decision.

Do not silently change the stack or scope.
