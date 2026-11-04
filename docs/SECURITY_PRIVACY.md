# Security and Privacy Baseline

**Status:** Baseline requirements; implementation review pending.

## Principles

- Minimize data collection and persistence.
- Apply least privilege.
- Keep secrets out of source control, logs, screenshots, and test fixtures.
- Validate untrusted data at boundaries.
- Make failure behavior safe and observable without exposing sensitive information.
- Prefer platform-supported security capabilities over custom cryptography.

## Data classification before storage

Every persisted value must be classified before implementation:
- Public/non-sensitive preference.
- Personal data.
- Authentication credential or token.
- Secret or cryptographic material.
- Diagnostic/telemetry data.

SharedPreferencesAsync is approved for ordinary preferences such as theme and locale choice. It is not approved for passwords, access tokens, refresh tokens, private keys, or other secrets.

A secure-storage package and key-management design must be researched and approved before the app stores sensitive credentials.

## Logging and diagnostics

- Never log passwords, tokens, authorization headers, private keys, or full sensitive payloads.
- Avoid logging personal identifiers unless necessary and explicitly justified.
- Sanitize exceptions from external services.
- Keep debug diagnostics separate from production telemetry policy.
- Define retention and access controls before adding remote reporting.

## Networking

When Dio is introduced:
- Require TLS for production endpoints.
- Define connect, send, and receive timeouts.
- Support cancellation for obsolete requests.
- Do not retry non-idempotent operations blindly.
- Redact sensitive headers and payload fields.
- Treat server responses as untrusted input.
- Define authentication expiry and logout behavior when authentication exists.

## Platform permissions

Request permissions only when a real feature requires them. Explain purpose in context. Handle denial, permanent denial, and revocation. Do not request broad permissions preemptively.

## Dependencies and supply chain

Before adoption, inspect package maintenance, release history, known advisories, license, transitive dependencies, and platform behavior. Pin compatible constraints and commit the lockfile for the application.

## Release security

Signing material, provisioning profiles, certificates, keystores, passwords, and CI secrets must never be committed. Use protected GitHub secrets/environments only when release automation is deliberately introduced.

## Required future review

Before first production-ready release, document a lightweight threat model covering assets, trust boundaries, entry points, sensitive data, platform storage, network communication, logging, and recovery behavior.
