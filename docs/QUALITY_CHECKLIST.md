# Quality Checklist

Use during planning, implementation, review, and release. Mark an item complete only with evidence. Mark N/A with a reason.

## Scope and planning
- [ ] Goal, user-visible outcome, scope, and non-goals are explicit.
- [ ] Acceptance criteria are testable.
- [ ] Existing behavior, repository state, dependencies, and relevant official documentation were inspected.
- [ ] Assumptions, tradeoffs, risks, and unresolved questions are documented.
- [ ] The simplest complete solution is chosen.
- [ ] No approved project decision is changed silently.

## Architecture and code
- [ ] Feature ownership and responsibilities are clear.
- [ ] Dependency direction is intentional; no cycles or private cross-feature coupling.
- [ ] Shared/core contains only genuinely cross-feature capabilities.
- [ ] No speculative abstraction, unnecessary interface, duplicate mechanism, or ceremonial layer.
- [ ] SOLID and separation of concerns improve clarity, not indirection.
- [ ] Riverpod responsibilities, dependencies, lifetimes, and rebuild scope are deliberate.
- [ ] Routing policy is centralized under app/navigation/ and not duplicated in widgets.
- [ ] Async work has explicit cancellation, lifetime, and error behavior.
- [ ] No swallowed errors, unsafe force unwraps, hidden mutable globals, dead code, or fake functionality.
- [ ] No prohibited code generation.
- [ ] Documentation matches implementation.

## UI, design system, and accessibility
- [ ] Shared tokens and appropriate shared components are used.
- [ ] No scattered hardcoded colors, typography, spacing, radii, or elevation.
- [ ] Light, Dark, and System behavior is correct.
- [ ] Semantic roles and contrast are correct in both themes.
- [ ] Arabic RTL and English LTR are correct where relevant.
- [ ] Locale preference (System/Arabic/English) restores before first frame and safely handles missing, invalid, read-failure, and write-failure states.
- [ ] Long text, overflow, scaling, and small screens are considered.
- [ ] Semantics, screen-reader labels, touch targets, focus, and keyboard behavior are correct where relevant.
- [ ] Motion is purposeful, consistent, and respects reduced-motion behavior.
- [ ] Loading, empty, success, error, disabled, and recovery states are handled where relevant.

## Security and privacy
- [ ] No secrets, credentials, signing keys, tokens, or personal data are committed.
- [ ] Sensitive values are not logged or exposed in error reporting.
- [ ] Input is validated at trust boundaries.
- [ ] Persistence is appropriate for data sensitivity; ordinary preferences are not used for secrets.
- [ ] Permissions follow least privilege.
- [ ] Retention, reset, and deletion behavior are understood.
- [ ] New dependencies and transitive supply-chain risks were reviewed.

## Data, networking, and reliability
- [ ] Models and serialization are explicit and handwritten.
- [ ] Shared transport is centralized only when genuinely common; feature policy remains local.
- [ ] Timeouts, cancellation, retries, idempotency, and error mapping are deliberate where relevant.
- [ ] Offline and server-unavailable behavior are distinguished where relevant.
- [ ] Race conditions, lifecycle transitions, and interrupted operations are considered.
- [ ] Failure and recovery paths are predictable.

## Performance and platform quality
- [ ] No unnecessary expensive work in build or startup paths.
- [ ] Rebuild scope and provider lifetimes are deliberate.
- [ ] Memory, streams, controllers, and subscriptions have managed lifetimes.
- [ ] Caches are bounded and appropriate.
- [ ] UI-isolate work is appropriate; heavy work is offloaded when justified.
- [ ] Battery and platform behavior are considered where relevant.
- [ ] Android/iOS checks are run where possible; unverified platforms are clearly identified.

## Verification
- [ ] Tests cover meaningful behavior, edge cases, failures, and regressions as appropriate.
- [ ] Tests are deterministic; no arbitrary sleeps or live network dependencies.
- [ ] Formatting passed.
- [ ] Static analysis passed without suppressing valid findings.
- [ ] Relevant unit/widget/integration tests passed.
- [ ] Platform build checks were run where possible.
- [ ] Not-run, blocked, failed, and N/A checks are identified.
- [ ] No success claim exceeds available evidence.

## Feature Definition of Done — 12 criteria

A feature is complete only when each applicable criterion is evidenced:

1. [ ] Requirements and expected behavior are clear and satisfied.
2. [ ] Architecture and SOLID/separation of concerns are respected without unnecessary complexity.
3. [ ] Naming, formatting, and static analysis are clean.
4. [ ] UI uses the approved design system and shared components.
5. [ ] Light and Dark themes work correctly.
6. [ ] Arabic/English and RTL/LTR are tested when relevant.
7. [ ] Loading, empty, error, success, disabled, and recovery states exist where applicable.
8. [ ] Relevant unit, widget, integration, and regression tests pass.
9. [ ] No known high-severity defect or introduced regression remains.
10. [ ] Performance, memory, rendering, and lifecycle behavior are acceptable.
11. [ ] Security and privacy implications are reviewed for the feature.
12. [ ] Documentation, ADRs, changelog, and project status are updated when applicable.

**Rule:** N/A requires a reason. Any unchecked applicable item means Not Done.

## Product Acceptance Checklist — starter kit

- [ ] Clean setup and reproducible Android/iOS configuration.
- [ ] No unsupported Web/Desktop targets or configuration.
- [ ] System/Light/Dark themes and preference persistence work.
- [ ] Arabic/English localization and RTL/LTR are complete and verified.
- [ ] Feature-first structure and dependency rules are clear and demonstrated.
- [ ] Riverpod and GoRouter are used consistently.
- [ ] No prohibited code generation or Freezed.
- [ ] Central design system is used by a real example feature.
- [ ] Core tests and CI quality gates pass.
- [ ] Build/release configuration, environments, and signing boundaries are documented.
- [ ] Clean setup is repeatable from documentation.
- [ ] No critical technical decision is undocumented.
- [ ] Skills, standards, examples, and maintenance guidance are current.
- [ ] Android is verified; iOS is verified on macOS/Xcode or explicitly marked blocked/not run.
- [ ] Security, accessibility, performance, and release-readiness reviews are documented.

## Delivery
- [ ] Changes are focused and reviewable.
- [ ] Commit/PR explains why and what changed.
- [ ] Relevant ADRs and standards are updated.
- [ ] Project status and verification ledger are updated.
- [ ] Remaining risks, technical debt, and follow-up work are recorded.
