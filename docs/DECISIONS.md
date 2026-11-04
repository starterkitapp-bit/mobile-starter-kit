# Architecture Decision Records

This file is the index and concise log of approved decisions. Material changes require a new dated ADR rather than silently rewriting history.

## ADR-0001 — Android and iOS are the only supported platforms

- **Status:** Accepted
- **Decision:** Target Android API 24+ and iOS 15+ only.
- **Reason:** Keep platform scope focused and quality verification realistic.
- **Consequences:** Do not add web or desktop targets. iOS build verification requires macOS/Xcode.

## ADR-0002 — Feature-first pragmatic architecture

- **Status:** Accepted
- **Decision:** Organize by feature and introduce layers only when they solve a real separation or testing problem.
- **Reason:** Preserve maintainability without ceremonial Clean Architecture.
- **Consequences:** No mandatory four-layer scaffold for every feature.

## ADR-0003 — Riverpod 3 is the state and composition baseline

- **Status:** Accepted
- **Decision:** Use flutter_riverpod 3.4.3; do not add a separate DI framework by default.
- **Reason:** Avoid overlapping mechanisms and unnecessary dependencies.
- **Consequences:** Provider scopes and lifetimes must be explicit.

## ADR-0004 — go_router is the navigation baseline

- **Status:** Accepted
- **Decision:** Use go_router 18.1.2 and keep route definitions under app/navigation/.
- **Reason:** Centralize app navigation and route-level behavior.

## ADR-0005 — Forui is the primary UI foundation

- **Status:** Accepted
- **Decision:** Use Forui 0.27.7 as the primary UI system.
- **Reason:** Establish a consistent component and theme foundation.
- **Consequences:** Avoid a competing UI framework or scattered component styling.

## ADR-0006 — Arabic and English are first-class locales

- **Status:** Accepted
- **Decision:** Support Arabic RTL and English LTR, with System/Arabic/English preference.
- **Reason:** Localization and directionality are core product infrastructure.
- **Consequences:** Use official gen-l10n; generated source is the sole exception to the no-code-generation rule.

## ADR-0007 — System, Light, and Dark themes are first-class

- **Status:** Accepted
- **Decision:** Support System/Light/Dark preference with complete Light and Dark themes.
- **Reason:** Consistent platform-aware appearance and explicit user control.

## ADR-0008 — SharedPreferencesAsync is for non-sensitive preferences

- **Status:** Accepted
- **Decision:** Use shared_preferences 2.5.6 through SharedPreferencesAsync for preferences.
- **Reason:** Keep simple preference persistence lightweight.
- **Security boundary:** This is not secure storage for credentials or secrets.

## ADR-0009 — Generated source is prohibited except official gen-l10n

- **Status:** Accepted
- **Decision:** Do not use build_runner, Freezed, json_serializable, or other code-generation tools. Official Flutter localization output is allowed.
- **Reason:** Keep source explicit and reduce tooling and generated-code complexity.

## ADR-0010 — Approved dependency versions are targets, not assumed proof

- **Status:** Accepted
- **Decision:** The approved baseline targets are Flutter 3.47.9, Forui 0.27.7, flutter_riverpod 3.4.3, go_router 18.1.2, Dio 5.11.1, shared_preferences 2.5.6, intl 0.20.3, very_good_analysis 11.0.0, and mocktail 1.0.5 when mocking is needed.
- **Reason:** Preserve the user's chosen stack while requiring compatibility verification before installation.
- **Consequences:** Record deviations with evidence and explicit approval. Do not add optional test dependencies before a concrete test requires them.

## ADR-0011 — Public repository does not imply an open-source license

- **Status:** Accepted
- **Decision:** Do not add a LICENSE file or claim reuse rights until the maintainer explicitly chooses a license.
- **Reason:** Repository visibility and copyright licensing are separate concerns.
- **Consequences:** The repository is publicly viewable; reuse permissions remain unspecified.

## ADR-0012 — No CI workflow before a valid Flutter project exists

- **Status:** Superseded by ADR-0013
- **Decision:** CI was intentionally deferred until the app scaffold and initial test structure existed.
- **Reason:** A workflow against an empty repository would fail by design and create misleading red CI.
- **Outcome:** The prerequisite was satisfied when the Flutter scaffold and smoke test were committed.

## ADR-0013 — GitHub Actions is the verification environment

- **Status:** Accepted
- **Decision:** Run the repository's formatter, strict analyzer, widget tests, and Android debug build in GitHub Actions using the pinned Flutter 3.47.9 SDK.
- **Reason:** Keep verification reproducible and avoid requiring the maintainer's local machine for repository changes.
- **Consequences:** Normal verification has read-only repository permissions. iOS build verification requires a separate macOS/Xcode runner and is not claimed yet.

## ADR-0014 — Pin direct dependencies and enforce the lockfile

- **Status:** Accepted
- **Decision:** Use exact direct dependency versions in pubspec.yaml, commit pubspec.lock, and run flutter pub get --enforce-lockfile in CI.
- **Reason:** Prevent unreviewed dependency drift and make CI resolve the same graph as the committed repository.
- **Consequences:** Any intentional dependency change must update pubspec.yaml and pubspec.lock together, with compatibility evidence and a focused verification run.


## ADR-0015 — Centralized monochrome Forui and Material theme foundation

- **Status:** Accepted
- **Decision:** Keep app-owned visual tokens in `lib/app/theme/app_theme_tokens.dart` and construct complete Light/Dark Forui 0.27.7 and Material 3 themes from that shared source.
- **Reason:** Maintain one visual source of truth while supporting both Forui-first UI and Flutter platform widgets.
- **Consequences:** The app root maps effective system brightness to the matching Forui theme. Touch-optimized Forui styles are used. Feature UI must consume shared tokens rather than introduce competing palettes or arbitrary per-screen styling. Theme preference persistence (System/Light/Dark) is a separate milestone. Theme source is handwritten; no Forui generator or code-generation tooling is allowed.


## ADR-0016 — Persist the app theme preference with SharedPreferencesAsync

- **Status:** Accepted
- **Decision:** Represent System/Light/Dark as a typed app-owned preference, restore it before launching the first app frame, and persist changes through the approved SharedPreferencesAsync API.
- **Reason:** Provide predictable user control while keeping system brightness behavior and explicit overrides centralized.
- **Consequences:** Missing or unknown stored values resolve to System. A preference-read failure is reported and falls back to System so a non-critical setting cannot prevent startup. A failed write does not publish the new in-memory value. Riverpod owns the live preference state; the storage adapter is replaceable in tests. This preference is not suitable for secrets or critical data.


## ADR-0017 — Adopt expanded engineering standards and acceptance model

- **Status:** Accepted
- **Decision:** Adopt the decision matrix, engineering responsibility map, failure-mode prevention rules, centralization principles, design-system requirements, 12-point Feature Definition of Done, and separate Product Acceptance Checklist in ENGINEERING_STANDARDS.md and QUALITY_CHECKLIST.md.
- **Reason:** Make the maintainer's requirements actionable and auditable without creating unnecessary teams, folders, layers, or duplicate sources of truth.
- **Consequences:** Conflicting proposals require evidence, tradeoffs, migration analysis, an ADR, and explicit maintainer approval before implementation. Feature completion and product readiness are tracked separately. N/A criteria require a reason; completion claims require evidence. Documentation subdirectories are introduced only when real maintained content justifies them.
