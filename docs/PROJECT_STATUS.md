# Project Status

**Last updated:** 2026-11-04  
**Current phase:** 3 — App-wide foundations  
**Overall implementation status:** Flutter scaffold, dependency baseline, bootstrap, and centralized Light/Dark theme foundation implemented and verified on GitHub Actions.

## Verified repository facts

- Repository: https://github.com/starterkitapp-bit/mobile-starter-kit
- Visibility: Public; default branch: `main`.
- Engineering governance documentation is present.
- All implementation changes are made directly in this repository.
- Latest successful verification: https://github.com/starterkitapp-bit/mobile-starter-kit/actions/runs/41900016698

## Verified toolchain

| Tool | Verified version | Evidence |
|---|---:|---|
| Flutter | 3.47.9 stable | GitHub Actions |
| Dart | 3.13.7 | Bundled with Flutter 3.47.9; GitHub Actions |
| DevTools | 2.60.0 | GitHub Actions |

## Platform and project baseline

- Flutter project: `mobile_starter_kit`, generated for Android and iOS only.
- Android minimum SDK: Flutter 3.47.9 `flutter.minSdkVersion` (API 24).
- iOS deployment target: 15.0.
- No web or desktop platforms are included.
- Android and iOS application identifiers still use `com.example` placeholders; consuming apps must replace them before publishing.
- iOS build has not been verified; it requires macOS/Xcode.

## Resolved direct dependencies

| Package | Locked version | Purpose |
|---|---:|---|
| forui | 0.27.7 | Primary UI foundation |
| flutter_riverpod | 3.4.3 | State and composition |
| go_router | 18.1.2 | Navigation |
| dio | 5.11.1 | HTTP client |
| shared_preferences | 2.5.6 | Non-sensitive preferences via SharedPreferencesAsync |
| intl | 0.20.3 | Locale-aware formatting |
| very_good_analysis | 11.0.0 | Static analysis |
| flutter_test | Flutter SDK | Tests |

- Direct dependency versions are pinned; `pubspec.lock` is committed and enforced in CI.
- `mocktail 1.0.5` remains deferred until a concrete mocking need exists.
- No prohibited code-generation packages or tools were added. Official Flutter `gen-l10n` remains the only permitted generated-source exception.

## Completed milestones

- [x] M1 — Android/iOS Flutter scaffold, repository governance, and GitHub Actions baseline.
- [x] M2 — Pinned dependencies, committed lockfile, strict analysis, and reproducible CI.
- [x] M3 — App bootstrap with required initialization, ProviderScope composition, optional post-first-frame warm-up, and failure reporting.
- [x] M4 — Centralized monochrome color/spacing/shape/typography/motion tokens; complete Light/Dark Forui and Material 3 themes; root brightness mapping; focused theme tests.

## M4 implementation notes

- Visual tokens are centralized in `lib/app/theme/app_theme_tokens.dart`.
- `lib/app/theme/app_theme.dart` constructs the Forui 0.27.7 Light/Dark themes and matching Material themes from those app-owned tokens.
- `MainApp` follows effective Material/system brightness and supplies the corresponding Forui theme.
- Forui uses touch-optimized typography and style configuration.
- Material semantic color roles are explicitly aligned to the monochrome palette; surface tint is transparent.
- Theme tests cover brightness selection, Material/Forui color alignment, key foreground contrast ratios, and shared spacing/shape tokens.
- Motion durations/curve are tokens only; future animated components must honor reduced-motion preferences. No arbitrary motion or startup delay is introduced.
- Theme preference persistence is intentionally not part of M4.

## Verification ledger

| Check | Status | Evidence |
|---|---|---|
| Flutter/Dart toolchain | Passed | Flutter 3.47.9 / Dart 3.13.7 in Actions |
| Dependency resolution | Passed | Enforced committed lockfile |
| Dart formatting | Passed | Run 41900016698 |
| Strict Dart analysis | Passed | Run 41900016698 |
| Tests | Passed | Run 41900016698 |
| Android debug APK | Passed | Run 41900016698 |
| iOS build | Not run | Requires macOS/Xcode |
| Arabic/English gen-l10n | Not configured | Future milestone |

## Not yet completed

- [ ] Persist System/Light/Dark theme preference with SharedPreferencesAsync.
- [ ] Configure official gen-l10n for Arabic and English, including RTL/LTR and System/Arabic/English preference.
- [ ] Implement locale and theme preference restoration without blocking the first usable frame unnecessarily.
- [ ] Implement navigation under `app/navigation/`.
- [ ] Build the neutral starter shell and reusable shared Forui components.
- [ ] Add focused tests for preferences, localization, navigation, and accessibility behavior.
- [ ] Add macOS/Xcode iOS build verification.
- [ ] Complete security, accessibility, performance, and release-readiness reviews.
- [ ] Replace placeholder application identifiers before publishing.
- [ ] Choose an explicit repository license and decide branch protection/ruleset policy.

## Next focused step

**M5 — Implement persisted System/Light/Dark theme preference.**

Use the existing centralized theme foundation and `SharedPreferencesAsync`. Keep the change focused: explicit System/Light/Dark behavior, deterministic restoration, tests, and documentation. Do not mix localization or navigation into this milestone.

## Risks and open decisions

- `com.example` identifiers are placeholders, not release-ready.
- Public visibility is not an open-source license; no license has been selected.
- Branch protection/ruleset is not configured.
- Android debug build is verified; iOS build is not.
- No backend, authentication, analytics, or secure-storage provider has been selected.
