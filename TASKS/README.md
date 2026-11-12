# Keto AI Tracker — Codex task pack

These tasks target the **existing** repository `MuhammadAli224/Keto-AI-Tracker` on `main` (inspected 2026-11-12), not a fresh Flutter project. At inspection time Firebase options and `firebase.json` were present and Firebase initialized in `AppServices`.

## Install pack
Copy this `TASKS` folder to the root of your local repository (next to `AGENTS.md`). Start Codex in that root and give it: `Read TASKS/00_MASTER_RUN_ALL.md and execute it sequentially. Do not stop for routine choices. Commit and push each completed task to the dedicated codex/keto-ai-tracker-implementation branch, using the master Git safety protocol. Never deploy or access paid APIs.`

## Automatic Git checkpoints
The user explicitly authorized a commit + push after each successfully completed task. Codex must work on `codex/keto-ai-tracker-implementation` (not `main`), stage only task-specific files, scan for secrets, commit, push and verify each remote checkpoint before continuing. If the push fails, the autonomous run must stop safely and report why. Existing uncommitted work must not be touched.

## What can run while you're away
Local code changes, documentation, Dart generation, analysis and Android build attempts (if CLI dependencies exist). The agent may still require execution approval or pause when its host session expires. This pack cannot force Codex to stay active or bypass host permissions. Keep the PC awake, the workspace accessible, and configure agent permission mode yourself. Never use unrestricted permissions on a workstation with sensitive credentials.

## Mandatory profile confirmation before analysis
After Task 02, Task 02A implements first-run profile review, editable age/height/current weight/budget/goals, and automatically computed read-only BMI. Analysis and AI requests remain unavailable until profile confirmation. The owner can edit these values later.

## Important scope decisions
- Android first. iOS integration and required toolchain are documented.
- Flutter existing Feature-First Clean Architecture, GetIt/Cubit, Freezed/AutoMappr, Mason, Hive CE for existing app cache and Firestore offline for owner data.
- No automatic Firebase deployment or paid OpenAI calls.
- No tests by default because repo `AGENTS.md` explicitly forbids them without explicit user instruction.
- AI photo estimates must be confirmed by user and backed by nutrition facts rather than assuming vision guesses are authoritative.
- Firebase console Auth provider, billing, App Check, Firestore rules, Functions secrets/deployment require deliberate manual review.

## Review after the run

Read the [final report](FINAL_REPORT.md) for the verified checkpoints and
remaining limitations. Follow the [manual release checklist](RELEASE_CHECKLIST.md)
before deploying rules, configuring cloud services or distributing a build.
