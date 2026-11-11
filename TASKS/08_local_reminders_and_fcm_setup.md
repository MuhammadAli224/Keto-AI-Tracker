# Task 08 — Local Reminders and FCM Setup

### Goal
Reliable local reminders with optional remote messaging.
### Deliverables
- Review existing `awesome_notifications` and OneSignal integrations before choosing; avoid simultaneous competing local notification frameworks. Prefer reusing the existing notification infrastructure if compatible.
- Permission education and runtime request; user-controlled reminder preferences for water, first/last meal, fasting and weekly weigh-in.
- Schedule local notifications with timezone correctness and Android 13+ permissions; explain exact alarm restrictions and do not demand exempted permissions without genuine need.
- Integrate FCM token lifecycle and permissions as infrastructure; remote message delivery must not be required for local reminders. Do not transmit health data in notification payloads.
- No external push service configuration/deployment without consent.
### Acceptance
Local reminders configurable/cancellable, survive ordinary app restarts where supported, no false guarantees in force-stop/background restrictions.

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
