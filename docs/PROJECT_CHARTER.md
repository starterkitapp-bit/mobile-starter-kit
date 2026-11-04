# Project Charter

## Vision

Create a reusable Flutter mobile starter kit that gives future applications a carefully engineered foundation without imposing unnecessary architecture or product assumptions.

## Outcomes

- A clear, documented, maintainable project structure.
- Consistent navigation, state, theming, localization, and persistence foundations.
- A coherent design system based on Forui.
- Reliable startup, lifecycle, error, and recovery behavior.
- Secure defaults and privacy-conscious data handling.
- Automated quality gates and meaningful tests.
- Optional capabilities that can be adopted or removed deliberately.

## Non-goals

- A finished business application.
- A web or desktop application.
- A generic framework that replaces Flutter conventions.
- A large sample app used to justify unnecessary abstractions.
- Support for arbitrary localization or theme engines beyond the approved baseline.
- Code generation other than official Flutter gen-l10n.

## Users and maintainers

The primary maintainer works on Windows and uses PowerShell scripts supplied as complete implementation steps. The repository must therefore document commands clearly, keep execution steps coherent, and avoid requiring the maintainer to manually assemble many small code fragments.

## Scope

### Included

- Flutter app foundation for Android and iOS.
- Feature-first pragmatic architecture.
- Forui design system integration.
- Riverpod state management and go_router navigation.
- Arabic/English localization and RTL/LTR.
- System/Light/Dark theme behavior.
- Preference persistence.
- Startup and lifecycle coordination.
- Networking foundation when needed.
- Error handling, logging, testing, accessibility, performance, security, and CI.
- Developer documentation and reusable contribution workflow.

### Excluded unless approved

- Web, Windows, macOS, Linux.
- Application-specific business features.
- Backend infrastructure.
- Authentication provider selection.
- Analytics/crash-reporting vendor selection.
- Secure credential storage package selection.
- Push notification vendor selection.
- A license grant or open-source reuse terms.

## Success criteria

The starter kit is ready for reuse only when:
- The approved toolchain and dependencies resolve reproducibly.
- The app starts and handles initialization and recovery correctly.
- Navigation and state ownership are clear.
- Theme and locale preferences persist and restore correctly.
- Arabic RTL and English LTR layouts are verified.
- Shared UI components are consistent and accessible.
- Meaningful tests cover normal, edge, and failure behavior.
- CI quality gates pass.
- Android verification is recorded.
- iOS verification is recorded on macOS/Xcode, or explicitly marked blocked/not run.
- Security, privacy, performance, and maintainability reviews are documented.
- Setup and extension instructions are sufficient for a new project.

## Quality philosophy

Build it right. Keep it clean. Make it last.

The objective is to exceed common industry practice through evidence, careful decisions, and repeatable verification—not through claims of superiority or unnecessary complexity.
