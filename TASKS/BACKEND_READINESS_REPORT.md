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
