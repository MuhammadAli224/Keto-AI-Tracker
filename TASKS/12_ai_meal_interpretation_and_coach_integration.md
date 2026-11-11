# Task 12 — AI Meal Interpretation and Coach Integration

### Goal
Connect UI with the prepared gateway without using AI as authoritative nutrition database.
### Deliverables
- Add meal scanner flow through remote datasource/domain usecase and Cubit with cancellable request/lifecycle policy.
- Show detected foods as suggestions with `estimated` status, ingredient confidence notes, portion/hidden-oil questions and editable quantities. Pull nutrients from validated catalog/manual entry and calculate locally.
- Add AI Coach screen with minimal, consented daily context; never share entire history by default. Enable manual review of any proposed goal changes and safety protections.
- For unconfigured Function/OpenAI credentials, show clear 'AI unavailable' and keep manual entry functional.
- Document data retention/cost settings; no definitive health diagnosis or guaranteed weight loss predictions.
- **First-run prerequisite:** Block all image analysis and AI Coach gateway calls until ProfileConfirmed from Task 02A. Use the latest user-approved goals; never accept default demographic data as confirmed.
### Acceptance
No image estimate auto-commits calories; confirmed items update diary; offline/failed AI requests fail gracefully.

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
