# Android backend readiness

## Task 15 — Firebase Authentication and Firestore ownership

- The configured client signs in with Firebase Email/Password and uses Firebase Auth for session restoration and sign-out. The operator reported enabling the provider. The project and live rules were not independently verified.
- Firestore isolates profiles, meals, water, fasting state and history, and weights under `users/{uid}`. The previous rules compared the caller UID with the path but let any authenticated account create its own confirmed profile. The rules now also require the server-issued boolean `ketoAiOwner` claim. Unmatched paths, including the AI quota and request-marker collections, remain denied to clients.
- Cloud Functions use the Admin SDK, so Firestore client rules do not govern their reads. Both gateway modes now check the owner claim before looking up the authenticated UID's profile. The profile confirmation gate and scoped meal lookup still apply.
- The Firestore review covered profile timestamps and field constraints, tracking document validation, tombstones, and paired fasting-history writes. Nested meal servings are bounded by list length; individual entries are not schema-validated in rules.
- Validation passed for the Functions TypeScript build and local Firestore rules compilation with Firestore Emulator 1.22.0. The compiler reported no issues. Runtime authorization checks are pending.

### Manual cloud setup and runtime prerequisites

1. Confirm Email/Password is enabled for the intended project and provision the designated owner through Firebase Authentication. Use trusted Admin SDK tooling to merge `ketoAiOwner: true` into that UID's existing custom claims. Refresh the owner's ID token by signing out and back in after the grant. Keep the claim exclusive to the designated account. [Firebase custom claims](https://firebase.google.com/docs/auth/admin/custom-claims)
2. Confirm the intended project, Android app registration, and Firestore database before deploying. The operator can manually publish the reviewed rules with `firebase deploy --only firestore:rules --project APPROVED_PROJECT_ID`.
3. Once runtime checks are authorized, verify the claimed owner can sign in, confirm a profile and perform owner-scoped reads and writes. Verify that an unclaimed account is denied even on its own path and that the owner cannot access another UID's data. Use disposable accounts and synthetic records in a nonproduction project.

## Task 16 — Meal photo storage and deletion

- The client and callable use `users/{uid}/mealPhotos/{mealId}.jpg`. Storage rules now require both the matching UID and `ketoAiOwner` for get, create, update and delete. Rules deny listing and constrain names and uploaded JPEG metadata and size. The gateway independently checks the stored object's size and JPEG signature before provider use.
- Camera and gallery selections remain in app-private storage after JPEG re-encoding strips metadata. Upload is opt-in per photo, including after replacement or redaction. The durable queue records approval and resumes approved uploads on connectivity changes. The client does not request or share download URLs.
- An explicit removal queues deletion at the known path even on a device without a local attachment record when photo Storage is enabled. Pending deletions remain eligible when new uploads are disabled. The queue waits for the native delete to settle before reusing the path, and treats a missing object as successful deletion.
- The local Firebase Storage Rules Runtime compiled the rules with zero errors and warnings. Cross-device retry, removal after process death, and cloud deletion are pending runtime verification.

### Manual Storage configuration and runtime prerequisites

1. Confirm the intended bucket and Android configuration, and keep bucket IAM private. Review any previously issued download links and revoke exposed tokens through the approved administrative workflow. Review bucket soft-delete and retention settings so the retention policy matches the app's deletion disclosure.
2. The operator can manually publish the reviewed Storage rules with `firebase deploy --only storage --project APPROVED_PROJECT_ID`. Keep `MEAL_PHOTO_STORAGE_ENABLED` off until the bucket and owner claim are ready.
3. In a nonproduction Android run, verify local-only capture, explicit consent, redaction resetting consent, interrupted transfer retry, and removal on another device. A permanent cloud deletion error may need administrative cleanup if the diary entry has already been removed from the UI. Confirm deletion in the intended bucket before treating a failed or queued removal as complete.

## Task 17 — Android App Check

- Android activates App Check after Firebase initialization and before feature services start. Debug builds use the Debug provider. Profile and release builds use Play Integrity. The AI client reuses the startup configuration on Android.
- This change adds client attestation without turning on any Firebase console enforcement. The callable scaffold already requires App Check outside the Functions emulator. Production callable deployment requires a working Android attestation setup.

### Manual App Check configuration and runtime prerequisites

1. In Play Console, link Play Integrity to the intended Firebase project. Register the Android app in Firebase App Check with its intended signing certificate SHA-256. The current Gradle release block uses debug signing and requires production signing configuration before Play validation. [Play Integrity setup](https://firebase.google.com/docs/app-check/android/play-integrity-provider)
2. Register only the authorized development device's Debug provider token in a nonproduction Firebase project after runtime work is approved. Keep the token out of source, shared logs, and release builds. [Flutter debug provider](https://firebase.google.com/docs/app-check/flutter/debug-provider)
3. Verify valid token traffic in App Check metrics for a debug build and a Play-distributed build signed as intended. Leave Firebase console enforcement disabled for this readiness pass.

## Task 18 — Cloud Functions deployment and OpenAI contract

- Firebase deploy targets Node.js 22 and runs the TypeScript build before publishing. The two Gen 2 callables use `us-central1`, Firebase callable authentication, strict request schemas, explicit consent and an owner-confirmed profile. The Flutter caller uses the same region and operation names.
- The gateway now requires a dedicated runtime identity via `AI_GATEWAY_SERVICE_ACCOUNT` for cloud deployment. Local emulation still uses the mock without a service account parameter or provider credential. The production transport defaults to mock via `AI_GATEWAY_LIVE=false`.
- The approved live path uses the pinned `gpt-5.4-mini-2026-03-17` snapshot through the Responses API. The model supports image input and structured output. The gateway validates returned data before giving it to the client. Live compatibility and credential access remain unverified. [OpenAI model documentation](https://developers.openai.com/api/docs/models/gpt-5.4-mini)
- The TypeScript build passed with the workspace's Node.js 24 installation. Cloud deployment remains configured for Node.js 22.

### Manual Functions configuration and deployment

1. After separate authorization for billing and cloud deployment, confirm the Firebase plan and required Google Cloud APIs. Set `AI_GATEWAY_SERVICE_ACCOUNT` to a dedicated runtime account. Grant the deployer permission to use it. Scope the runtime identity to Firestore reads and quota writes, object reads in the intended Storage bucket and access to the named secret. Review IAM separately because the Admin SDK bypasses client rules.
2. In approved Firebase Functions deployment parameters set `AI_GATEWAY_LIVE=false`. The static Secret Manager binding is required even when the cloud revision runs in mock mode. Provider secret provisioning is a separate operator action. Keep the value out of dotenv, Flutter defines, Git and shell arguments. [Firebase Functions configuration](https://firebase.google.com/docs/functions/config-env)
3. Once approved, use Node.js 22 and the following commands from the repository root. The first Firebase command takes the provider key via protected input. The Functions deployment targets only the two named callables.

   ```sh
   npm --prefix functions ci
   npm --prefix functions run build
   firebase functions:secrets:set OPENAI_API_KEY --project APPROVED_PROJECT_ID
   firebase deploy --only functions:interpretMeal,functions:askCoach --project APPROVED_PROJECT_ID
   ```

## Task 19 — Quotas, errors and health-data privacy

- Both live operations reserve capacity atomically before sending anything to OpenAI. The shared limits are four reservations per owner per UTC day, 20 per project per UTC day and one reservation per owner per 30 seconds. Quota time now comes from the Firestore transaction snapshot, and invalid quota counters fail closed. Duplicate request IDs are rejected while their markers exist. A failure after reservation uses a slot even when it occurs before any provider charge.
- Each callable is capped at two instances with concurrency one and a 45-second timeout. The provider request has a 30-second timeout, one attempt, 900 meal or 650 coach output tokens, and a fixed model. HTTP redirects fail without resending submitted data. The UI maps gateway quota and duplicate errors to a limited state and offers manual fallback. Closing a route discards local results, while an already dispatched request may finish.
- Meal review now sends the approved photo's opaque reference. The gateway requires that reference in object metadata and reads the exact Storage generation it validated. A replaced or legacy photo is rejected before contacting OpenAI. Reupload older photos with fresh consent for live review. Meal analysis sends the image and locale. Coach sends the submitted message, locale and, only when selected, the five approved daily goal fields.
- The gateway stores timestamps, counters and hashed request identifiers. It has no content logging or persistence for AI prompts, results or photo bytes. `store: false` is set for the provider request. Review OpenAI's abuse-monitoring retention and image exceptions before approving live health-data processing. [OpenAI data controls](https://developers.openai.com/api/docs/guides/your-data)

### Manual quotas, privacy and runtime prerequisites

1. Configure Firestore TTL for `_aiGatewayRequests.expiresAt` if approved. The application sets the marker expiration to seven days. Account for TTL deletion costs and asynchronous cleanup.
2. Configure provider alerts and confirm approved model access, project rate limits, usage reporting and applicable privacy terms. Keep cloud and client live flags off pending approval. Establish an operator process to disable live mode and redeploy the callables if needed.
3. With synthetic data and explicit runtime authorization, verify the newer client and callable revision together. Check replacement between approval and dispatch, old photo rejection, simultaneous quota reservations, repeated IDs, UTC rollover, timeout and refusal handling, and opt-in goal sharing. Provider behavior needs a separately approved live request.

## Task 20 — Static integration and release blockers

| Check | Result |
| --- | --- |
| `flutter analyze --no-pub` | Passed in the current workspace with no analyzer findings. |
| `dart format --output=none --set-exit-if-changed` | Passed for all eight Dart files changed in Tasks 15–19. |
| `npm --prefix functions run build` | Passed using Node.js 24. The declared deployment runtime is Node.js 22. |
| Firestore and Storage rules | Passed local compilation with no rules diagnostics. Both rulesets also loaded in the Firebase emulators on a disposable demo project. Java 25 emitted a pre-existing Storage runtime dependency warning about `sun.misc.Unsafe`. |
| Android Firebase registration | The package name, Firebase project and Android app registration agree across Gradle and the checked-in Firebase configuration. |
| Git whitespace check | Passed across the backend change set. |

The committed Android tree lacks the manifest's `.MainActivity` and contains the widget receiver in the old package. The working tree contains uncommitted Kotlin replacements that were excluded from this backend change set. A clean checkout needs the manifest classes and the Android photo, export and widget channel implementations before device validation. Release signing also needs the intended certificate before Play Integrity validation.

The Firebase project was not modified. Live project settings, deployed rules, IAM, storage retention, Android attestation and provider availability still require operator verification. The tracked legacy root dotenv remains outside Flutter assets and the Functions deployment source. This review did not audit Git history for secrets.

The mobile app and Android emulator were not run. No test cases were created or executed. Local rules checks compiled and loaded the rules without authorization requests. No Firebase deployment, billing change, provider request, credential provisioning or iOS work was performed.
