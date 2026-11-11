# Task 01 — Security and Firebase Foundation

### Goal
Stabilize the existing Firebase-enabled app rather than recreating it.
### Deliverables
- Confirm Firebase initialization currently occurs in `AppServices.initAppServices` and `lib/firebase_options.dart` exists; make initialization idempotent and correctly ordered if necessary.
- Remove the global `HttpOverrides` / `badCertificateCallback => true` TLS bypass in `lib/core/bootstrap/app_initializer.dart`. Enforce normal certificate verification across HTTP clients.
- Review `.env` packaging (`pubspec.yaml` currently includes `.env` asset), tracked secret exposure, and safe Git ignore strategy. Do not print `.env` contents. If leaked, note key rotation as a human action.
- Add Firebase Auth, Firestore, Storage, Functions, App Check packages with versions compatible with installed Flutter; only if not already present. Do not invent Firebase config.
- Create deny-by-default Firestore/Storage security rules and local documentation, but DO NOT deploy. Document owner-UID restriction and App Check enforcement considerations.
- Document the current distinction between Hive cache and Firestore offline persistence; Hive remains for existing infrastructure/settings, not a competing cloud replica.
- Verify Android build capability and document iOS follow-up constraints without trying an iOS build on Windows.
### Acceptance
Startup still works without TLS bypass; Firebase configured for Android; privacy and permission boundaries documented; no secrets leaked.

## Repository rules (mandatory)
- Inspect current branch and Git working tree first. Never overwrite uncommitted changes.
- Read `AGENTS.md` and all `codex_ai_system/rules/*.md` before editing. These are canonical; update them and the Mason brick together only if an intentional architectural change is needed.
- Keep `lib/feature/` (singular), `lib/core/`, `AppText`, `context.tr(LocaleKeys...)`, Freezed/AutoMappr, GetIt and Cubit conventions. Use `mason make feature --name <name> --with_cache false --on-conflict skip` when appropriate; adapt generated template to actual Firebase contracts, never assume the template's HTTP list API is applicable.
- Business flow: UI → Cubit → UseCase → domain Repository → RepositoryImpl → DataSources. Domain has no Flutter/Firebase/Dio/GetIt imports. Never expose DTOs in states.
- Preserve existing session/secure-storage abstractions where appropriate; no parallel competing auth/session source of truth.
- Do NOT write/run tests unless explicitly asked by the user; verify via `flutter analyze --no-pub`, `dart format`, and code generation where required. Log any unverified runtime behavior clearly.
- No auto-deploy, billing upgrades, production data writes, secret creation, external network API calls billed to an account, or destructive cleanup. Changes that need these are staged and marked BLOCKED_EXTERNAL.
- No API key in Flutter, .env bundled assets, Firestore or logs. Never print secrets or private health records. Avoid committing `.env` with sensitive content.
- Do not change user-defined health goals automatically. Nutrition numbers/photo readings are estimates and require user confirmation.

### Verification and status
Update `TASKS/RUN_STATUS.md` and append to `TASKS/RUN_LOG.md`; clearly separate implementation from runtime/cloud verification.
