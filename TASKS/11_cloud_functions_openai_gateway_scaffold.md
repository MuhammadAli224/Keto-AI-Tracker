# Task 11 — Cloud Functions OpenAI Gateway Scaffold

### Goal
Build secure server-side AI infrastructure without spending money or deploying automatically.
### Deliverables
- Scaffold Firebase Cloud Functions with runtime officially supported by current Firebase SDKs, selecting TypeScript/Node versions after checking local environment.
- Callable or HTTPS endpoint for meal image interpretation and another for AI coach; verify Firebase Auth UID and App Check strategy, validate image reference ownership, size/MIME limits and rate limit/budget strategy.
- Integrate OpenAI Responses API with a vision-capable model and strict structured schema for detected ingredients, uncertain quantities, sauces/oils and clarification questions. Treat output as untrusted estimate.
- Use Firebase Secret Manager/Cloud Functions secrets: never hardcode OpenAI API key; never ship it to client or log requests containing health data.
- Add safe mock/fake transport for unconfigured offline development; do not present fabricated AI findings as real.
- Clearly mark API provisioning, secret creation, deployed endpoints, billing as BLOCKED_EXTERNAL until authorized. Do not enable billing, call paid API or deploy.
### Acceptance
Scaffold has a coherent authenticated security model and documentation; no key leak and no unapproved cloud actions.

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
