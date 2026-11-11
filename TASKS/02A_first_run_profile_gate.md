# Task 02A — Mandatory First-Run Profile Setup and Editable Goals

### Goal
Ensure the owner can review or edit personal measurements, budget, and goals **before any nutritional analysis, AI use, or meal recommendations**. This task is a prerequisite for Tasks 03–14.

### First-run flow
1. Firebase Auth resolves the owner identity. If authentication is not configured, provide a development-only non-analysis setup preview and flag the external configuration blocker; never bypass access controls for production.
2. Load owner profile from Firestore using mobile offline persistence, showing loading, pending-sync, missing-profile and error states. Do not interpret missing cache as proof that a profile does not exist on server; allow safe review and do not overwrite remote profile accidentally.
3. If missing, incomplete, or unconfirmed, navigate to `/profile/setup`. Prevent navigation to calorie analysis, AI Coach, meal scanner, meal recommendations and their gateway calls. Do not globally lock out basic settings or sign-out.
4. Prefill known user values only as **editable suggested fields** where appropriate: age 35, height 188.2 cm, current/starting weight 168.4 kg, very low activity, food budget 20 JOD/week, meal window 14:00–21:00, provisional energy goal 2200 kcal, water goal 3000 ml. These are user-provided earlier but MUST be reviewed/confirmed in-app; avoid inferring sex or diagnoses. Do not claim validated medical targets.
5. Show calculated BMI (weightKg / heightMeters²), to one decimal, **read-only**. Recalculate instantly as the user edits current weight or height. On current-weight log changes, reflect latest recorded weight in the displayed BMI. Do not persist BMI as independent authoritative input.
6. Allow the owner to change age or date of birth, height, starting/current weight, weekly budget in JOD, activity level, calorie/protein/net carbs/fat goals, daily water goal and fasting window. Require reasonable input validation and explicit confirmation. Keep field units visible and support Arabic and English.
7. Save through UseCase → repository abstraction → Firestore and display pending/synced/offline/error state. Profile confirmation should be persisted per owner with appropriate version/timestamp. Avoid claiming server sync on mere cache acknowledgment.
8. On confirmation, allow Dashboard access; require confirmation before any actual analysis or AI request. If profile data changes later, recompute derived BMI and future goal displays, but do not silently modify historic logged nutrition or past weight entries.
9. Make the same editable form accessible from Profile/Settings at any time, not only onboarding. No need to restart or clear data.
10. Handle profile deletion/reset/re-authentication safely without leaking one owner's cached data to another session.

### User experience
- Simple form grouped into Personal Measurements, Nutrition Goals, Fasting & Water, and Weekly Budget.
- Show BMI explanation and that it is an indicator, not a diagnosis.
- `Continue` is disabled until mandatory inputs are valid and user confirms.
- If offline on the first run, support local draft without falsely marking remote confirmation; choose a safe implementation consistent with available Firebase auth/cache state. Do not send AI requests until confirmation.
- Show a lightweight summary/review step before confirming.

### Acceptance criteria
- [ ] New owner cannot start meal/AI analysis before confirming profile.
- [ ] Weight, height, age, budget and goals are editable before confirmation.
- [ ] BMI is automatically computed and updates when weight or height changes; not manually editable.
- [ ] Confirmed owner can later edit profile and budget in Settings/Profile.
- [ ] Existing confirmed owner is not forced through onboarding on every startup.
- [ ] Correct offline/pending/remote-sync states, validation, localization and RTL.
- [ ] Unconfirmed/missing data is never silently replaced by fake defaults.
- [ ] All implementation respects `AGENTS.md` and canonical rules; do not add/run tests unless explicitly authorized. Run formatting and analyzer; record any runtime checks not completed.

### Execution dependency
Run this **immediately after Task 02**, before Task 03. Later tasks must check `ProfileConfirmed` (or equivalent state) before any analysis or external AI call.
