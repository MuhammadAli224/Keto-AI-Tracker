# Task 04 — Meal Diary and Offline Data Sync

### Goal
Offline-first meal diary with cloud sync using existing Firebase integration.
### Deliverables
- Firestore meal documents under owner UID with stable client-generated IDs; nested item snapshots and per-meal statuses Draft/Confirmed/Deleted (soft-delete tombstones when needed).
- Implement capture of meal timestamp, type, local timezone, nutrition snapshots, and optional local image reference; add/edit/delete via use cases.
- Use Firestore offline persistence, local-write acknowledgement vs server-acknowledgement (`hasPendingWrites`), explicit sync states and error messages. Do not promise instant background sync while app is terminated.
- Avoid duplicate daily totals through deterministic aggregation from meal entries; do not independently mutate counters on each device. Document last-write-wins conflicts and avoid editing same daily aggregate from multiple devices.
- Create meal diary pages and day selector, with user-readable pending/error states.
### Acceptance
Offline adds/edits remain visible, queued writes represent pending status, meal totals recalc after editing, and repeated submission of same ID does not duplicate.

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
