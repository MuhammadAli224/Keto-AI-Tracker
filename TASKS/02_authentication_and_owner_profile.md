# Task 02 — Authentication and Owner Profile

### Goal
Single-owner authentication and editable profile, without new multi-user product complexity.
### Deliverables
- Introduce FirebaseAuth through data-source/repository/use-case/Cubit; use an auth provider supported by the configured Firebase project. If provider is not enabled, implement an explicit disabled/setup state and mark integration BLOCKED_EXTERNAL rather than changing console settings.
- Implement sign-in, sign-out, session restoration, auth state listener, route guard and account-scoped data paths. Integrate existing `SessionManager` thoughtfully: one authoritative Firebase identity, no duplicate access token mechanism.
- Profile fields: birth year/age, height (cm), starting/current weight (kg, current weight from logged entries), activity, meal window, locale, timezone, weekly JOD budget, configurable daily calorie/macronutrient/water goals. Initial examples may be displayed as suggestions but must require explicit review, editing and confirmation.
- Compute BMI live as currentWeightKg / (heightMeters * heightMeters); round to one decimal for display. BMI is derived and read-only, never an editable authoritative field.
- Persist profile setup status (`isProfileConfirmed` or equivalent with version) and profile edit timestamps; allow profile changes later with clear sync states.
- Profile route, editor, Firestore persisted document (user UID-scoped), offline UI states, reasonable validation.
- Owner-only rules are prepared; no permissive rules.
### Acceptance
No unauthenticated private data shown; profile has editing/error/offline states; route redirects do not loop. User may edit all measurements, goals, and weekly budget. BMI reacts to weight/height edits and is not manually editable. Profile confirmation remains mandatory before analysis (implemented in Task 02A).

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
