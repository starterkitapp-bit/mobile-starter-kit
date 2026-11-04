# Project Status

**Last updated:** 2026-11-04  
**Current phase:** 2 — Dependency and quality baseline  
**Overall implementation status:** Flutter foundation and approved dependency baseline verified; shared app capabilities not started

## Verified repository facts

- Repository: https://github.com/starterkitapp-bit/mobile-starter-kit
- Visibility: Public
- Default branch: main
- GitHub connection has read/write access.
- Engineering governance documentation is present.
- Flutter scaffold and dependency baseline are committed to main.
- Latest successful verification: https://github.com/starterkitapp-bit/mobile-starter-kit/actions/runs/41887998401

## Verified toolchain

| Tool | Verified version | Evidence |
|---|---:|---|
| Flutter | 3.47.9 stable | GitHub Actions log |
| Dart | 3.13.7 | Bundled with Flutter 3.47.9; GitHub Actions log |
| DevTools | 2.60.0 | GitHub Actions log |

The approved Flutter version was used exactly. No SDK upgrade or substitution was made.

## Platform and project baseline

- Flutter project name: `mobile_starter_kit`.
- Generated with official Flutter tooling using `--empty --platforms=android,ios`.
- Android and iOS platform folders are present.
- No web, Windows, macOS, or Linux platform folders were generated.
- Android Gradle configuration uses `flutter.minSdkVersion`; Flutter 3.47.9 defines this as API 24.
- iOS Xcode project uses `IPHONEOS_DEPLOYMENT_TARGET = 15.0`.
- Generated Android and iOS application identifiers currently use the `com.example` placeholder. Replace them with an identifier controlled by the consuming application before publishing.
- The current `Hello World!` screen is a minimal scaffold only, not the intended app shell or design system.

## Resolved direct dependencies

| Package | Locked version | Purpose |
|---|---:|---|
| forui | 0.27.7 | Primary UI foundation |
| flutter_riverpod | 3.4.3 | State and composition |
| go_router | 18.1.2 | Navigation |
| dio | 5.11.1 | HTTP client |
| shared_preferences | 2.5.6 | Non-sensitive preferences via SharedPreferencesAsync |
| intl | 0.20.3 | Locale-aware formatting |
| very_good_analysis | 11.0.0 | Static analysis rules |
| flutter_test | Flutter SDK | Widget/unit testing |

- `pubspec.yaml` uses exact version constraints for the selected third-party direct dependencies.
- `pubspec.lock` is committed and records the complete resolved dependency graph.
- GitHub Actions uses `flutter pub get --enforce-lockfile`; dependency drift is not silently accepted.
- `mocktail 1.0.5` remains an approved option but is intentionally deferred until a test needs mocking. Do not add a package before a concrete use exists.
- No prohibited code-generation packages or tools were added.

## Completed

- [x] Confirmed repository identity, public visibility, default branch, and write permissions.
- [x] Created README and engineering governance documentation.
- [x] Generated the official Flutter scaffold for Android and iOS only.
- [x] Added a minimal widget smoke test.
- [x] Pinned the approved direct dependency versions.
- [x] Resolved dependencies with Flutter 3.47.9 / Dart 3.13.7.
- [x] Committed the generated `pubspec.lock`.
- [x] Replaced `flutter_lints` with `very_good_analysis 11.0.0`.
- [x] Passed Dart formatting check.
- [x] Passed strict Flutter analysis with no findings.
- [x] Passed the widget smoke test.
- [x] Passed Android debug APK build with the selected dependencies.
- [x] Confirmed Android API 24 default and iOS deployment target 15.0.
- [x] Confirmed no unsupported web or desktop platform folders exist.
- [x] Restricted normal CI verification to read-only repository permissions.
- [x] Updated project documentation and decisions to match verified state.

## Verification ledger

| Check | Status | Evidence |
|---|---|---|
| Flutter SDK | Passed | Flutter 3.47.9 in Actions log |
| Dart SDK | Passed | Dart 3.13.7 in Actions log |
| Dependency resolution | Passed | `flutter pub get` with exact selected versions |
| Lockfile | Passed | Committed `pubspec.lock`; enforced in CI |
| Dart formatting | Passed | `dart format --output=none --set-exit-if-changed .` |
| Dart analysis | Passed | `flutter analyze` with Very Good Analysis 11.0.0 |
| Widget smoke test | Passed | `flutter test` |
| Android debug build | Passed | `flutter build apk --debug` |
| iOS build | Not run | Requires macOS/Xcode; no success claimed |
| gen-l10n | Not configured | Arabic/English localization is a later focused milestone |

## Bootstrap corrections and lessons

1. `flutter create --empty` does not create a Dart `test/` directory. The first test attempt failed; a small explicit widget smoke test was added instead of switching to a counter-demo template.
2. The first smoke-test workflow edit had invalid YAML indentation. It was corrected before accepting the scaffold.
3. Very Good Analysis exposed missing public API documentation and Dart 3.13 constructor syntax requirements in the starter widget. The widget was corrected and the strict analyzer then passed.
4. The selected dependency set resolved and built successfully. The Android build required the first-run Android/NDK toolchain setup, so the initial build took longer; the successful result is recorded in CI.

## Not yet completed

- [ ] Configure official gen-l10n for Arabic and English.
- [ ] Define and implement the `init_app` startup contract and recovery behavior.
- [ ] Implement the neutral app shell and app-level composition.
- [ ] Implement navigation under `app/navigation/`.
- [ ] Implement complete Light/Dark themes and System/Light/Dark preference.
- [ ] Implement Arabic/English locale preference and RTL/LTR behavior.
- [ ] Implement non-sensitive preference persistence using SharedPreferencesAsync.
- [ ] Establish the centralized design tokens and shared Forui components.
- [ ] Add targeted tests for actual startup, navigation, theme, locale, and preference behavior.
- [ ] Add macOS/Xcode iOS build verification.
- [ ] Complete security, accessibility, performance, and release-readiness reviews.
- [ ] Choose and record an explicit repository license.
- [ ] Decide branch protection/ruleset and merge policy.

## Next focused step

**M3 — Define and implement the app bootstrap and `init_app` contract only.**

Do not implement navigation, localization, theme, or feature modules in parallel with this step.

## Risks and open decisions

- `com.example` application identifiers are placeholders, not release-ready identifiers.
- License remains unselected; public visibility is not an open-source license.
- Branch protection/ruleset is not yet configured.
- Android debug build is verified; iOS build is not verified.
- No app-specific backend, authentication, analytics, or secure-storage provider has been selected.
