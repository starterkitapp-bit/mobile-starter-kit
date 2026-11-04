# Architecture Baseline

**Status:** Bootstrap baseline implemented; shared app capabilities are next.

## Guiding approach

Use feature-first organization with pragmatic boundaries. Keep the app idiomatic to Flutter. Introduce layers only when they clarify ownership, isolate change, or improve meaningful testing.

## Proposed top-level organization

```text
lib/
  app/
    app.dart
    bootstrap/
    navigation/
    theme/
    localization/
  core/
    errors/
    logging/
    network/
    storage/
    platform/
    design_system/
  features/
    <feature>/
      presentation/
      application/
      domain/
      data/
```

This is a starting boundary map, not a requirement to create every directory or layer immediately. Empty folders and ceremonial layers are not deliverables.

## Responsibilities

### app/

Composition root and app-wide behavior:
- App widget and root configuration.
- Startup orchestration and lifecycle integration.
- Navigation configuration under app/navigation/.
- Theme and locale selection.
- Wiring of app-wide providers.

### core/

Only capabilities with genuine cross-feature ownership:
- Shared error types and mapping.
- Structured, privacy-safe logging.
- Shared network transport policy.
- Preference and platform boundaries.
- Shared design tokens and components.

Do not move feature-specific policy into core merely to make it appear reusable.

### features/

Each feature owns its user-facing behavior and relevant state/data policy. A feature may use fewer than four layers. Add domain/data/application separation only where the feature's complexity and boundaries justify it.

## Dependency direction

- Presentation depends on application-facing contracts/state.
- Application coordinates feature use cases and policies when they are meaningful.
- Domain contains business rules only when the app has actual domain behavior.
- Data implements external persistence/network boundaries.
- Core must not depend on feature implementations.
- Features must not reach into another feature's private implementation.
- Avoid cycles.

## State management

Use flutter_riverpod 3.4.3 as the approved state-management and composition tool. Provider scope and lifetime must be deliberate. Avoid global mutable singletons and duplicated sources of truth. Keep ephemeral widget state local unless it is shared or must survive navigation/lifecycle boundaries.

## Navigation

Use go_router 18.1.2. Keep route declarations and route-level policy in app/navigation/. Define authentication/authorization redirects only when the product actually has such requirements. Avoid embedding business logic in route builders.

## UI system

Forui 0.27.7 is the primary UI foundation. Establish centralized tokens and shared components before building feature screens. Avoid parallel component libraries and scattered raw styling.

## Startup

Keep native launch presentation separate from Flutter initialization UI. Initialization should represent real tasks, have explicit failure behavior, and avoid arbitrary timers. The startup flow must be testable without relying on wall-clock sleeps.

## Persistence

Use SharedPreferencesAsync for non-sensitive user preferences only. Do not store credentials, tokens, or secrets there. A secure-storage strategy requires a separately researched and recorded decision before sensitive persistence is implemented.

## Networking

Dio 5.11.1 is the approved HTTP client. Add interceptors and shared policy only for concerns genuinely shared across features. Define timeout, cancellation, error mapping, and retry semantics explicitly. Do not add an API client abstraction before a real API contract exists.

## Initialization contract

Implemented in `lib/app/bootstrap/app_bootstrap.dart` as `initApp`:

1. Ensure Flutter bindings exist before invoking platform/plugin initialization.
2. Await optional required initialization before launching the app. Required initialization errors propagate; the app is not launched in a partially initialized state.
3. Register optional warm-up as a post-frame callback before calling `runApp`, so the callback cannot miss the initial frame.
4. Launch the root widget inside Riverpod's `ProviderScope`.
5. Run optional warm-up after the first frame without blocking that frame. Report warm-up errors through `FlutterError.reportError`; do not silently discard them.

`main()` delegates to this single entry point. No real startup tasks are registered yet, so the current app starts without artificial delays, network calls, or placeholder initialization work.

The bootstrap deliberately does not impose one global timeout on unrelated future tasks. Each required initializer must bound its own I/O and platform operations with task-appropriate timeouts and cancellation. When real required tasks are introduced, classify fatal versus recoverable failures and provide recovery UX for recoverable cases; do not hide failures with silent fallback.

## Testing boundaries

Test pure logic without Flutter where possible, providers/state transitions with deterministic dependencies, widgets for user-visible behavior, and critical end-to-end journeys at integration level. Avoid tests that merely mirror implementation details.

## Open architecture questions

- Recovery UX for concrete required startup tasks once those tasks exist.
- Exact route set for the neutral starter shell.
- Secure storage package and platform threat model, if secrets become necessary.
- Logging/crash reporting strategy, if a vendor is later required.
- Whether any optional modules merit extraction after real usage demonstrates a stable boundary.
