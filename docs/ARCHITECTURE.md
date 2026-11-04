# Architecture Baseline

**Status:** Direction approved; implementation not yet created.

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

The project constitution calls for a clear `init_app` entry point. Its final signature and dependency contract must be established during bootstrap implementation. It should:
- Make initialization order explicit.
- Separate required initialization from optional warm-up.
- Be deterministic and testable.
- Avoid arbitrary fixed delays.
- Surface recoverable and fatal failures distinctly.
- Avoid doing network-dependent work that is not required to show a usable first frame.

## Testing boundaries

Test pure logic without Flutter where possible, providers/state transitions with deterministic dependencies, widgets for user-visible behavior, and critical end-to-end journeys at integration level. Avoid tests that merely mirror implementation details.

## Open architecture questions

- Exact app startup state model and recovery UX.
- Exact route set for the neutral starter shell.
- Secure storage package and platform threat model, if secrets become necessary.
- Logging/crash reporting strategy, if a vendor is later required.
- Whether any optional modules merit extraction after real usage demonstrates a stable boundary.
