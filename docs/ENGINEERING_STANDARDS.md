# Engineering Standards

**Authority:** Subordinate to the Engineering Constitution. Applies to every milestone and change.

## 1. Approved project decision matrix

| Area | Approved decision |
|---|---|
| Framework / language | Flutter / Dart |
| Platforms | Android + iOS only |
| Localization / direction | Arabic + English; RTL + LTR |
| Themes | Complete Light + Dark; System / Light / Dark preference |
| Architecture | Feature-first, pragmatic boundaries |
| Routing | GoRouter |
| State management / composition | Riverpod |
| Code generation | Prohibited, except official Flutter gen-l10n |
| Models / serialization | Handwritten Dart |
| Design | Centralized custom design system; Forui primary UI |
| Principles | SOLID and separation of concerns, applied pragmatically |
| Documentation | Maintained continuously with material changes |
| Quality | Testable acceptance criteria and Definition of Done |

Exact versions and SDK constraints remain in the Engineering Constitution and lockfile. This matrix does not authorize package upgrades or substitutions.

Any conflict with an approved decision requires a formal proposal: concrete problem, current authoritative evidence, alternatives and tradeoffs, compatibility/migration impact, ADR, and explicit maintainer approval before implementation.

## 2. Engineering responsibilities

| Domain | Responsibility |
|---|---|
| Architecture & code quality | Feature ownership, dependency direction, modularity, naming, selective refactoring |
| Design system & UI | Tokens, themes, shared components, patterns, interaction and motion rules |
| Localization & accessibility | Arabic/English, RTL/LTR, scaling, semantics, screen readers, contrast |
| Security & privacy | Secrets, storage classification, permissions, data protection, threat assumptions |
| Data & networking | API client policy, handwritten models, caching, offline and error behavior |
| Testing & reliability | Unit/widget/integration/regression tests, edge cases, failure and recovery |
| Performance & platform | Rendering, memory, battery, lifecycle, Android/iOS behavior |
| DevOps & release | Reproducible builds, CI/CD, environments, signing boundaries, release readiness |
| Documentation & DX | Setup, architecture, ADRs, standards, skills, examples, maintenance |

These are responsibilities, not a mandate to create a team, package, layer, or folder for every row.

## 3. Failure modes to prevent

- **Architecture:** God classes, circular dependencies, mixed responsibilities, premature generalization.
- **Feature-first:** feature-to-feature private implementation coupling; shared/core as a miscellaneous dumping ground.
- **SOLID:** interfaces and indirection without a concrete testing or change-isolation benefit.
- **Riverpod:** oversized providers, hidden dependencies, duplicated state, incorrect lifetimes, avoidable rebuilds.
- **GoRouter:** routing logic inside widgets, duplicated guards, untested redirects and deep links.
- **Design system:** hardcoded scattered colors/styles, duplicate components, inconsistent APIs.
- **Themes:** incomplete Dark mode, semantic color drift, weak contrast, mismatched Forui/Material behavior.
- **Localization:** hardcoded user strings, broken RTL, concatenated translated fragments, overflow from long translations.
- **UX:** crowded screens, unnecessary cards, gratuitous motion, inconsistent spacing, missing state feedback.
- **Dart:** unnecessary dynamic, unsafe null handling, unclear names, over-clever code.
- **Networking:** duplicated API logic, missing timeouts/cancellation, unclear errors, unsafe retries, race conditions.
- **Security:** secrets in binaries/source, sensitive data in ordinary preferences/logs, unjustified permissions.
- **Testing:** implementation-coupled tests, happy-path-only coverage, arbitrary sleeps, ignored failure paths.
- **Performance:** avoidable rebuilds, unbounded caches, oversized images, heavy UI-isolate work.
- **Dependencies:** unmaintained or duplicate packages, unreviewed transitive risk, arbitrary upgrades.
- **Documentation:** stale instructions, decisions without rationale, missing setup/release guidance.
- **Maintenance:** temporary workarounds becoming architecture, untracked debt, unrelated changes.

A best practice is used only when it solves a real project problem. Document material tradeoffs; do not copy patterns mechanically.

## 4. Centralization and source-of-truth rules

Centralization means one authoritative definition for shared decisions, not one giant file/module.

| Concern | Authoritative home |
|---|---|
| Colors, typography, spacing, radii, elevation, motion | App-owned design tokens and theme configuration |
| Shared UI behavior | Shared Forui components when repeated/stable reuse exists |
| Theme selection | Central theme configuration and typed preference state |
| Routes and route policy | `app/navigation/` |
| Shared errors | Central error model only for genuinely cross-feature errors |
| API transport | Shared networking infrastructure; feature policy stays local |
| Logging | Central privacy-safe logging boundary if/when introduced |
| Localization | Official Flutter gen-l10n resources and app locale configuration |
| Dependencies | Constitution, pubspec.yaml, pubspec.lock, CI lockfile enforcement |
| Technical decisions | Architecture documentation and ADRs |
| Acceptance and verified progress | Quality Checklist and Project Status |

Do not create empty folders, speculative components, generic managers, or wrappers to reserve a future central home. Shared/core contains only genuinely cross-feature responsibilities.

## 5. Design system standard

The design system covers:
1. Foundations: semantic colors, typography, spacing, sizing, shape, borders, elevation.
2. Named design tokens instead of arbitrary feature-level values.
3. Shared components with consistent APIs, semantics, touch behavior, and states.
4. Composition patterns for predictable screens and sections.
5. Loading, empty, error, success, disabled, focus, and pressed states.
6. Motion duration/curve tokens, purposeful transitions, and reduced-motion behavior.
7. Complete Light/Dark semantic roles and accessible contrast.
8. RTL/LTR, long text, and locale-aware dates/numbers.
9. Scaling, semantics, focus, touch targets, and contrast.
10. Design-system review before accepting UI.

A feature reuses an appropriate shared component rather than inventing a competing Button, Input, or Loading Indicator. If none exists, determine whether the pattern is genuinely reusable before extending the shared library. Avoid duplicate one-off controls.

## 6. Feature Definition of Done — 12 criteria

A feature is complete only when every applicable criterion has evidence. Mark N/A with a reason.

1. Requirements and expected behavior are clear and satisfied.
2. Architecture and SOLID/separation of concerns are respected without unnecessary complexity.
3. Naming, formatting, and static analysis are clean.
4. UI uses the approved design system and shared components.
5. Light and Dark themes work correctly.
6. Arabic/English and RTL/LTR are tested when relevant.
7. Loading, empty, error, success, disabled, and recovery states exist where applicable.
8. Relevant unit, widget, integration, and regression tests pass.
9. No known high-severity defect or introduced regression remains.
10. Performance, memory, rendering, and lifecycle behavior are acceptable.
11. Security and privacy implications are reviewed for the feature.
12. Documentation, ADRs, changelog, and project status are updated when applicable.

An unchecked applicable item means the feature is not Done. Completion percentage is evidence-based, never inferred from code volume.

## 7. Product Acceptance Checklist — starter kit

- [ ] Clean setup and reproducible Android/iOS configuration.
- [ ] No unsupported Web/Desktop targets or configuration.
- [ ] System/Light/Dark behavior and preference persistence work.
- [ ] Arabic/English localization and RTL/LTR are complete and verified.
- [ ] Feature-first structure and dependency rules are clear and demonstrated.
- [ ] Riverpod and GoRouter are used consistently.
- [ ] No prohibited code generation or Freezed.
- [ ] Central design system is used by a real example feature.
- [ ] Meaningful tests and CI quality gates pass.
- [ ] Build/release configuration, environments, and signing boundaries are documented.
- [ ] Clean setup is repeatable from documentation.
- [ ] No critical technical decision is undocumented.
- [ ] Skills, standards, examples, and maintenance guidance are current.
- [ ] Android build is verified; iOS build is verified on macOS/Xcode or explicitly marked blocked/not run.
- [ ] Security, accessibility, performance, and release-readiness reviews are documented.

## 8. Documentation map

Keep the current concise authoritative documents; create subdirectories only when real maintained content justifies them. Avoid duplicate sources.

| Area | Current source of truth |
|---|---|
| Project identity / setup | README.md, DEVELOPMENT.md |
| Architecture / dependency rules | ARCHITECTURE.md |
| Decisions / rationale | DECISIONS.md |
| Design and engineering standards | ENGINEERING_STANDARDS.md and token/theme docs |
| Coding rules | ENGINEERING_CONSTITUTION.md and AGENTS.md |
| Test strategy / acceptance | QUALITY_CHECKLIST.md |
| Security / privacy | SECURITY_PRIVACY.md |
| Platform configuration | DEVELOPMENT.md and platform docs when needed |
| Release history | CHANGELOG.md when versioned releases begin |
| Specialist workflows | skills/ when real reusable workflows exist |
| Verified progress | PROJECT_STATUS.md |

Directories are introduced when they contain real maintained content, not as empty placeholders.
