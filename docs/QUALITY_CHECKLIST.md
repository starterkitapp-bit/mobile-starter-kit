# Quality Checklist

Use this checklist during planning, implementation, and review. Mark an item complete only when evidence exists. Not every item applies to every change; mark N/A with a reason.

## Scope and planning

- [ ] Goal and user-visible outcome are explicit.
- [ ] Scope and non-goals are explicit.
- [ ] Acceptance criteria are testable.
- [ ] Existing behavior and dependencies were inspected.
- [ ] Relevant official documentation and compatibility were checked.
- [ ] Assumptions, tradeoffs, and unresolved questions are documented.
- [ ] The solution is the simplest complete approach.

## Architecture and code

- [ ] Responsibilities and ownership are clear.
- [ ] Dependencies point in the intended direction.
- [ ] No circular or cross-feature implementation coupling.
- [ ] No speculative abstraction, unnecessary interface, or duplicate mechanism.
- [ ] Async work has clear cancellation, lifetime, and error behavior.
- [ ] No swallowed errors, unsafe force unwraps, or hidden mutable globals.
- [ ] No dead code, fake functionality, or unexplained TODOs.
- [ ] No prohibited code generation.
- [ ] Documentation matches implementation.

## UI, UX, and accessibility

- [ ] Shared design tokens and components are used.
- [ ] Light, Dark, and System behavior remains correct.
- [ ] Arabic RTL and English LTR behavior remains correct.
- [ ] Long text, overflow, text scaling, and small screens are considered.
- [ ] Semantics and screen-reader labels are meaningful.
- [ ] Contrast and touch targets are sufficient.
- [ ] Focus and keyboard behavior are correct where relevant.
- [ ] Motion is purposeful and does not delay task completion.
- [ ] Loading, empty, success, error, and recovery states are handled where relevant.

## Security and privacy

- [ ] No secret, credential, signing key, token, or personal data is committed.
- [ ] Sensitive values are not logged.
- [ ] Input is validated at trust boundaries.
- [ ] Persistence is appropriate for data sensitivity.
- [ ] Permissions follow least privilege.
- [ ] Data retention, reset, and deletion behavior are understood.
- [ ] New dependencies and transitive risk were reviewed.

## Performance and reliability

- [ ] No unnecessary expensive work in build or startup paths.
- [ ] Rebuild scope and provider lifetimes are deliberate.
- [ ] Memory, stream, controller, and subscription lifetimes are managed.
- [ ] Network timeouts, cancellation, and retry safety are considered where relevant.
- [ ] Lifecycle transitions and interrupted operations are considered.
- [ ] Failure and offline behavior are predictable.

## Tests and verification

- [ ] Tests cover meaningful behavior, not implementation trivia.
- [ ] Normal and edge cases are covered.
- [ ] Failure and recovery paths are covered where relevant.
- [ ] Tests are deterministic and do not rely on arbitrary sleeps.
- [ ] Formatting check passed.
- [ ] Analyzer passed without suppressing valid findings.
- [ ] Relevant tests passed.
- [ ] Platform build checks were run where possible.
- [ ] Not-run checks are explicitly identified.
- [ ] No success claim exceeds available evidence.

## Delivery

- [ ] Changes are focused and reviewable.
- [ ] Commit/PR description explains why and what changed.
- [ ] Project status is updated.
- [ ] Remaining risks and follow-up work are recorded.
