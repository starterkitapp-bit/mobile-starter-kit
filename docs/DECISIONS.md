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
- **Decision:** Use Riverpod 3; do not add a separate DI framework by default.
- **Reason:** Avoid overlapping mechanisms and unnecessary dependencies.
- **Consequences:** Provider scopes and lifetimes must be explicit.

## ADR-0004 — go_router is the navigation baseline

- **Status:** Accepted
- **Decision:** Use go_router and keep route definitions under app/navigation/.
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
- **Decision:** Flutter 3.47.9, Forui 0.27.7, Dio 5.11.1, shared_preferences 2.5.6, intl 0.20.3, very_good_analysis 11.0.0, mocktail 1.0.5, and Riverpod 3 are the approved baseline targets.
- **Reason:** Preserve the user's chosen stack while requiring compatibility verification before installation.
- **Consequences:** Record deviations with evidence and explicit approval.

## ADR-0011 — Public repository does not imply an open-source license

- **Status:** Accepted
- **Decision:** Do not add a LICENSE file or claim reuse rights until the maintainer explicitly chooses a license.
- **Reason:** Repository visibility and copyright licensing are separate concerns.
- **Consequences:** The repository is publicly viewable; reuse permissions remain unspecified.

## ADR-0012 — No CI workflow before a valid Flutter project exists

- **Status:** Accepted
- **Decision:** Add Flutter CI after the app scaffold, pubspec, localization configuration, and initial test structure exist.
- **Reason:** A workflow that runs flutter analyze/test against an empty repository would fail by design and create misleading red CI.
- **Consequences:** CI is a required upcoming milestone, not falsely represented as active.
