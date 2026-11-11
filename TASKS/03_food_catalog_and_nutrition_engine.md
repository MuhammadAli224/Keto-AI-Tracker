# Task 03 — Food Catalog and Nutrition Engine

### Goal
Deterministic food nutrition math independent of AI.
### Deliverables
- Add pure domain Food/Nutrients/Serving/Recipe models, per-100g nutrition with provenance, units, edible portion and net carbs defined explicitly.
- Implement portion math, calorie calculation, meal totals and day totals with predictable precision/rounding. Use validated labeled food data and manual foods/recipes; no invented nutrition database values.
- Add manual food/recipe entry and common locally curated foods; editable values with source labels, not fictitious certainty.
- Support target calories, protein, net carbs, fat; user-editable targets. Do not infer medical safe range or auto-lower goals.
- Design a Firestore-friendly schema and repository mapping for logged snapshots (keep values as consumed), distinct from reusable food catalog.
- **First-run prerequisite:** Before exposing nutrition analysis or goals, require confirmed profile from Task 02A; profile goals remain editable and BMI is derived (not stored as an editable input).
### Acceptance
All calculations are deterministic, validated for negative/unknown weights and absent nutritional data; analytics don't rely on AI.

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
