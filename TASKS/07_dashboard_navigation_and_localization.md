# Task 07 — Dashboard Navigation and Localization

### Goal
Polished connected Dashboard without deviating from existing UI rules.
### Deliverables
- Integrate existing GoRouter and theme; Dashboard shows logged calorie target/protein/net carbs/water, fasting phase and weight trend, with offline/pending indications.
- Reuse AppText, AppColor, AppTextStyle, spacing conventions and the Almarai typography.
- Add all feature keys inside existing ar.json/en.json with parity; run locale key generator. Do not create per-feature translation sources.
- Proper RTL/LTR layouts and locale-aware date/time/number units and JOD formatting.
- Bottom navigation or clear primary navigation with routes and safe deep-link handling.
- **First-run prerequisite:** Show first-run onboarding route until ProfileConfirmed; include Settings/Profile entry to edit weight, height, age, budget and goals. Display read-only calculated BMI.
### Acceptance
All strings localized; no hardcoded user-visible text; data shown comes from repositories and never demo placeholder values.

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
