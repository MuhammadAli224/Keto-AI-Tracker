# Task 14 — Integration Review and Release Readiness

### Goal
Review completed work and leave an honest usable Android development build where possible.
### Deliverables
- Run format, code generation if needed, `flutter analyze --no-pub`, generator verification only if Mason changed, and attempt Android debug build when environment allows. Do not run tests unless explicitly authorized.
- Review security boundaries for Firebase rules, App Check, image storage, OpenAI gateway, log redaction and TLS. Audit dependency usage/unused packages without sweeping refactor.
- Review navigation, localization parity, sync behavior, offline states, notifications, widget privacy and backup/export.
- Update docs/README/task runbook, leave precise manual checklist for console settings, Firebase rules deployment, Functions deployment, iOS macOS build and paid API enablement.
- Do not claim multi-device sync, notifications or widgets are fully tested without appropriate runtime verification.
- **First-run prerequisite:** Manually review first-run gating: unconfirmed profile cannot reach analysis or AI; editing height/weight immediately recalculates read-only BMI; budget and goals stay editable after onboarding.
### Acceptance
Final report explicitly lists complete, incomplete, blocked and unverified items; exact commands and errors; no cloud deployment.

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
