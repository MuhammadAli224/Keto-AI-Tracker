# MASTER TASK — Execute the Keto AI Tracker task pack

## Mission
Implement every numbered task in this folder sequentially **inside the existing local clone** of `MuhammadAli224/Keto-AI-Tracker`. You are an autonomous coding agent for this execution, not an assistant drafting more tasks. Preserve the architecture and Firebase configuration already present. Android first, iOS-ready.

## Start / discovery
1. Confirm you are at repository root (look for `AGENTS.md`, `pubspec.yaml`, `codex_ai_system/`, `lib/feature/`). If missing, stop with a precise message; never create a replacement project.
2. Read `AGENTS.md`, `codex_ai_system/rules/*.md`, `codex_ai_system/README.md`, `README.md` and `TASKS/README.md`; inspect actual Firebase and Git status.
3. Read and follow every task `TASKS/01_*.md` through `TASKS/14_*.md` in ascending order, including `TASKS/02A_first_run_profile_gate.md` immediately after Task 02.
4. Report the execution plan to the terminal/session log, then execute; **do not wait for routine approvals**. Use defaults explicitly documented here.

## Autonomous execution rules
- You have permission to make local code changes, create local files, add compatible dependencies, run pub/build_runner/analyze/format and make local commits and **push each successfully completed task to a dedicated remote feature branch**, as expressly authorized by the user, subject to the Git safety protocol below. Never force-push, merge, delete branches, push to `main`, deploy Firebase rules/Functions, create paid cloud resources, or turn on paid OpenAI usage.
- Never bypass an authentication prompt or attempt to obtain private keys. If external provider setup is missing, finish all locally implementable code with a mock adapter and record `BLOCKED_EXTERNAL`; continue remaining tasks.
- Only change scope necessary for each task. If canonical rules conflict with a feature, stop that feature and record a reason or update rules + templates together when authorized by task.
- Respect `AGENTS.md`: **do not create or run tests**; only analyze, format, codegen, generator verification when appropriate and build checks.
- Reuse existing app structure: `lib/feature` (not `lib/features`), `AppText`, Freezed, AutoMappr, GetIt, Hive CE, HydratedBloc, EasyLocalization, Mason.
- Keep offline notes honest: Firestore pending writes ≠ server confirmed; Firebase Storage upload/AI needs network; Android/iOS background delivery is OS-governed.
- Prefer user editability and consent. Prepopulate health/water/fasting goals as initial suggestions only; never force a restrictive diet or make treatment recommendations autonomously.
- Do not leave a destructive or expensive step queued for unattended execution.

## Non-negotiable first-run gate before analysis
Before developing or activating nutrition analysis, photo scanning, AI Coach, meal recommendation, or calorie interpretation, implement `TASKS/02A_first_run_profile_gate.md` after Task 02. The user must review and confirm or edit age/date of birth, height, current weight, weekly food budget, and nutrition targets. BMI must be calculated from current weight and height (kg/m²), read-only, and update on changes; it must never be a manually editable source field. A missing/unconfirmed profile redirects into onboarding or a non-analysis setup view; do not open an analysis flow or send health data to AI until confirmed. All these fields must remain editable after onboarding in Profile/Settings, with persistence and offline handling. Never treat example health values as confirmed personal data. This is a local implementation gate, not a reason to wait for the user's real data during unattended coding.

## Task order and checkpoint protocol
For each 01..14:
1. Read its full `.md` and relevant source files.
2. Implement the smallest complete coherent feature, using existing generator when feasible.
3. Run `dart format` on changed Dart files, `flutter analyze --no-pub`; run generators if affected.
4. Write `TASKS/RUN_STATUS.md` with task number, status (`DONE`, `PARTIAL`, `BLOCKED_EXTERNAL`, `BLOCKED_CODE`), files, checks, decisions and next step; append to `TASKS/RUN_LOG.md`.
5. Continue to next task if safe. If a task cannot be fully completed due to unavailable credentials/billing/deployment/device, produce its locally verifiable scaffold, mark blocked, and continue with independent tasks. If a code blocker contaminates dependent tasks, skip those and pursue remaining independent tasks.
6. For tasks with status `DONE`, perform the **commit-and-push checkpoint** below before starting the next task. For `PARTIAL` or `BLOCKED_*`, record progress locally but do not claim a successful pushed checkpoint. If a dependency remains unfinished, continue only when the next task is independent.
7. After completing Task 14, commit and push the final report/status changes as a separate documentation checkpoint if safe.

## Git commit-and-push protocol — user authorized remote pushes for each completed task
1. Before modifying code, run `git status --porcelain=v1`, `git branch --show-current`, `git remote -v`, `git fetch origin` and `git ls-remote --heads origin`. Confirm `origin` points to `MuhammadAli224/Keto-AI-Tracker` (or pause for confirmation if not). Verify Git credentials can push using the existing authenticated Git setup; never ask for or print tokens. If the working tree contains pre-existing changes, **stop** rather than incorporating, discarding, or stashing them unattended.
2. Create or reuse a dedicated non-protected branch named `codex/keto-ai-tracker-implementation` from the current clean `main` HEAD. Do not reset, rebase or force-create it if the branch already exists; verify the existing remote branch is compatible before reuse. Never push directly to `main` or merge automatically. If the branch is diverged or conflicting, stop and report instead of rewriting history.
3. After each task that meets all its local acceptance criteria and has status `DONE`: format and analyze as directed, inspect `git diff`, `git status`, and the staged file list, then **stage only explicit paths changed for that task** using `git add -- <paths>`. Include relevant task checkpoint docs. Never use `git add .`, `git add -A`, or blanket staging.
4. Run `git diff --cached --check`, inspect `git diff --cached --name-only`, and scan staged contents for private keys, access tokens, credentials, private `.env` values, real personal health records, signing materials, and accidental generated private artifacts. In particular, the repository already contains a tracked `.env`: **do not stage or modify `.env`**, and flag potential committed secrets for separate manual remediation. Never print secret values in logs. If anything sensitive may be included, stop before committing or pushing.
5. Commit with the format `feat(keto): task 01 security and firebase foundation` (substitute task number and description). For the first successful checkpoint, `git push -u origin codex/keto-ai-tracker-implementation`; subsequently, `git push origin codex/keto-ai-tracker-implementation`. Push only after the local commit succeeds.
6. After each push, verify that `origin/codex/keto-ai-tracker-implementation` resolves to the pushed commit using `git ls-remote` or a subsequent `git fetch` comparison, and append the task, commit SHA, branch, timestamp and result to `TASKS/RUN_LOG.md`. Add this information to `TASKS/RUN_STATUS.md` (and include it in the checkpoint whenever practical). A successful local commit is **not** equivalent to a successful push.
7. If Git authentication prompts, the push is rejected, the remote moves unexpectedly, branch protection intervenes, or network access is unavailable: retry at most once for an obviously transient transport error, then **STOP the autonomous run** with `BLOCKED_GIT_PUSH`, preserving local work and writing precise recovery instructions. Do not move on to the next task as though it had been backed up. Never bypass protections, create tokens, alter remotes, or force-push.
8. Never use `git reset --hard`, `git clean -fd`, `git push --force`, or destructive Git commands. Do not execute an automatic PR merge or modify repository settings. Keep a final report of commit SHAs and verified push status.

## Stop conditions
Stop immediately if: the authorized Git push cannot be verified, secrets may be exposed to public source; required work would modify unrelated user changes; destructive migration/data deletion is needed; security rules would have to become permissive; an irreversible cloud action/billing charge is needed; no safe way to resolve a critical contradiction. Record exact blocker.

## Finish
Generate `TASKS/FINAL_REPORT.md` with implemented modules, skipped/blocked modules, validations run and outcome, verified pushed commits/branch, Firebase manual steps, security risks, platform limitations, next manual validation steps and a concise summary. Do not report features as operational without proof.

## Task files
- [01_security_and_firebase_foundation.md](01_security_and_firebase_foundation.md)
- [02_authentication_and_owner_profile.md](02_authentication_and_owner_profile.md)
- [02A_first_run_profile_gate.md](02A_first_run_profile_gate.md)
- [03_food_catalog_and_nutrition_engine.md](03_food_catalog_and_nutrition_engine.md)
- [04_meal_diary_and_offline_data_sync.md](04_meal_diary_and_offline_data_sync.md)
- [05_water_tracker_and_fasting_tracker.md](05_water_tracker_and_fasting_tracker.md)
- [06_weight_tracker_and_progress_reports.md](06_weight_tracker_and_progress_reports.md)
- [07_dashboard_navigation_and_localization.md](07_dashboard_navigation_and_localization.md)
- [08_local_reminders_and_fcm_setup.md](08_local_reminders_and_fcm_setup.md)
- [09_android_home_screen_widget_and_ios_preparation.md](09_android_home_screen_widget_and_ios_preparation.md)
- [10_meal_photo_capture_and_review.md](10_meal_photo_capture_and_review.md)
- [11_cloud_functions_openai_gateway_scaffold.md](11_cloud_functions_openai_gateway_scaffold.md)
- [12_ai_meal_interpretation_and_coach_integration.md](12_ai_meal_interpretation_and_coach_integration.md)
- [13_weekly_budget_planner_and_data_export.md](13_weekly_budget_planner_and_data_export.md)
- [14_integration_review_and_release_readiness.md](14_integration_review_and_release_readiness.md)
