# Mobile Starter Kit

A production-minded, reusable Flutter foundation for Android and iOS.

> Build it right. Keep it clean. Make it last.

**Project status:** Flutter foundation scaffold and dependency baseline verified  
**Specification:** STARTER_KIT — FINAL ENGINEERING CONSTITUTION v4.0  
**Repository visibility:** Public  
**Implementation status:** Foundation is established; shared app capabilities are the next milestone

## What this repository is

Mobile Starter Kit is a reusable engineering foundation for building multiple mobile applications. It is not a finished product app, a demo gallery, or a collection of abstractions for their own sake.

The goal is a small, coherent, maintainable baseline with real functionality, explicit decisions, measurable quality gates, and optional capabilities that can be removed without destabilizing the core.

## Verified technical baseline

| Area | Selected baseline |
|---|---|
| Framework | Flutter 3.47.9 stable |
| Dart | 3.13.7 (bundled with Flutter 3.47.9) |
| Platforms | Android (API 24+) and iOS (15+) only |
| UI | Forui 0.27.7 |
| State management | flutter_riverpod 3.4.3 |
| Navigation | go_router 18.1.2 |
| Networking | Dio 5.11.1 |
| Preferences | shared_preferences 2.5.6 via SharedPreferencesAsync |
| Date/number formatting | intl 0.20.3 |
| Static analysis | very_good_analysis 11.0.0 |
| Tests | Flutter test; mocktail 1.0.5 is approved but deferred until mocking is actually needed |
| Architecture | Feature-first with pragmatic layers |
| Generated source | Prohibited, except official Flutter gen-l10n output |

The selected direct dependencies above are pinned to exact versions in `pubspec.yaml`, and the resolved dependency graph is committed in `pubspec.lock`. GitHub Actions enforces the lockfile during verification. Do not silently upgrade or substitute packages.

## Non-negotiable principles

- Think before coding; research and verify before choosing.
- Prefer the simplest solution that fully meets the requirement.
- Make focused, goal-driven changes; avoid unrelated edits.
- No code generation or build_runner. The only allowed generated source is official Flutter localization output.
- No fake functionality, dead code, speculative abstractions, or unnecessary dependencies.
- Arabic RTL and English LTR are first-class requirements.
- System, Light, and Dark theme modes are first-class requirements.
- Accessibility, security, privacy, performance, reliability, and testability are design requirements—not polish added later.
- Never report a build, test, platform check, or release as successful without recorded evidence.
- Keep project documentation and status aligned with the actual repository.
- Apply the 12-point Feature Definition of Done and separate Product Acceptance Checklist; record evidence rather than assuming completion.
- Centralize shared decisions without collapsing responsibilities into oversized files or speculative abstractions.

## Start here

1. Read [AGENTS.md](AGENTS.md) for repository-wide working rules.
2. Read [the engineering constitution](docs/ENGINEERING_CONSTITUTION.md).
3. Read [the project charter](docs/PROJECT_CHARTER.md) and [engineering standards](docs/ENGINEERING_STANDARDS.md).
4. Read [the architecture baseline](docs/ARCHITECTURE.md) and [architecture decisions](docs/DECISIONS.md).
5. Follow [the development workflow](docs/DEVELOPMENT.md).
6. Track verified progress in [PROJECT_STATUS.md](docs/PROJECT_STATUS.md).
7. Use [the quality checklist](docs/QUALITY_CHECKLIST.md), including the 12-point Feature Definition of Done and separate Product Acceptance Checklist.

## Current implementation

- Official Flutter 3.47.9 scaffold for Android and iOS only.
- Minimal starter entry point and one widget smoke test.
- Exact direct dependency versions resolved and locked.
- Very Good Analysis 11.0.0 is the active analyzer ruleset.
- GitHub Actions verifies lockfile resolution, Dart formatting, analysis, tests, and an Android debug APK build.
- Latest verified run: [Flutter CI — dependency baseline](https://github.com/starterkitapp-bit/mobile-starter-kit/actions/runs/41887998401).

The current `Hello World!` screen is only a minimal scaffold used by the smoke test. It is not the intended design system or finished startup experience.

### Important setup notes

- The generated Android and iOS application identifiers currently use the `com.example` placeholder. Replace them with an identifier controlled by the consuming application before publishing.
- Android minimum SDK resolves to API 24 in the pinned Flutter SDK.
- The iOS Xcode project deployment target is explicitly 15.0.
- Android debug build is verified. An iOS build has **not** yet been run on macOS/Xcode.
- `mocktail` is deliberately not installed until a real test needs mocks; the current smoke test does not.
- Localization, navigation, theme, preferences, startup orchestration, and the shared design system are not implemented yet.

## Scope boundaries

- Android and iOS only. No web, desktop, or other targets unless explicitly approved later.
- No application-specific business domain is assumed.
- No license has been selected yet. Public visibility does not, by itself, grant permission to reuse, modify, or redistribute this code. A license decision must be made explicitly before claiming open-source licensing.

See [Project Status](docs/PROJECT_STATUS.md) for verified details and the next controlled step.
