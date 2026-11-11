# Task 13 — Weekly Budget Planner and Data Export

### Goal
Manage JOD 20 weekly budget and portable data.
### Deliverables
- User-configured weekly food budget default 20 JOD, purchase/expense entries (JOD), weekly rollovers and receipt-free manual entry.
- Suggested low-cost foods/recipes based only on entered prices or traceable product data, not invented local prices; show unknown prices.
- Weekly meal plan as optional editable draft, not forced food regimen.
- Export meals/water/weight/goals/expenses to structured JSON or CSV locally with user confirmation and privacy-safe sharing; document deletion/account reset behavior.
- **First-run prerequisite:** The 20 JOD weekly budget is a suggested initial value only, confirmed in onboarding and editable at any time in Profile/Settings. Planner uses latest approved budget, not hardcoded 20.
### Acceptance
All expense math exact for JOD decimals; exports preserve timestamp/units and no secrets.

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
