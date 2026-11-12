# Manual release checklist

The implementation branch is suitable for local Android development. Verify
the following in an authorized development project and on physical devices
before distributing a build. Use synthetic records for verification.

## Local toolchain and Android build

From the repository root run the following commands.

```sh
flutter pub get
flutter analyze --no-pub
flutter build apk --debug
npm --prefix functions ci
npm --prefix functions run build
firebase emulators:exec --only auth,firestore,storage,functions --project demo-keto-tracker 'true'
```

The demo emulator command loads rules and registers the mock callables.
There is no paid model request. No test suite is required by this runbook.

On the original machine, the standard Android build could not write to the
shared Flutter SDK Gradle cache. The app-only debug build succeeded with JDK
17, Gradle file watching disabled, and writable caches. If the same error
occurs, create a Gradle init script outside the repo and substitute the
canonical path to the installed Flutter SDK and an available scratch directory.

```groovy
gradle.beforeProject { project ->
    if (project.projectDir.canonicalPath == '/path/to/flutter/packages/flutter_tools/gradle') {
        project.layout.buildDirectory.set(new File('/path/to/writable/flutter-gradle-build'))
    }
}
```

Run the app target from `android/`.

```sh
JAVA_HOME=/path/to/jdk17 ./gradlew :app:assembleDebug --no-daemon --no-watch-fs \
  --project-cache-dir /path/to/writable/project-cache \
  -I /path/to/writable/flutter-gradle.init.gradle --console=plain
```

Use the debug APK at `build/app/outputs/apk/debug/app-debug.apk` for local
development. Before release, choose the production application ID, register
that ID with Firebase, update its matching client configuration and configure
release signing securely. The current Android release build type uses debug
signing. Verify signing separately on iOS.

## Firebase console and rules

1. In the approved project, confirm Android and iOS registrations match the
   installed package/bundle IDs. Check that Authentication → Sign-in method
   enables Email/Password and provision only the intended owner account.
2. Verify Firestore database and optional Storage bucket settings, project
   aliases and permission boundaries. In a sandbox verify signed-out and
   cross-account denials, confirmed-owner profile, meal, water, fasting and
   weight writes, and deny-by-default coverage for unmatched paths.
3. Review the rules changes and current production rules with an authorized
   operator. If approved, deploy Firestore and Storage independently against
   the explicitly selected project. Replace `APPROVED_PROJECT_ID` before running the commands.

   ```sh
   firebase deploy --only firestore:rules --project APPROVED_PROJECT_ID
   firebase deploy --only storage --project APPROVED_PROJECT_ID
   ```

4. Register the intended Android build for Play Integrity and iOS build for
   App Attest. Verify attestation on those actual distributions before
   turning on client access. Treat Firestore and Storage App Check enforcement
   as separate rollout decisions. The AI callables enforce App Check outside
   the emulator.
5. Review the existing tracked `.env` and its Git history privately. Rotate
   credentials if the review finds any. Keep private values out of Firebase
   client config, Flutter defines, Git and issue logs.

## Manual device verification

- Sign in with an owner account without a confirmed profile. Try opening
  the home, diary, coach, widget link and export entry points before confirming.
  Confirm the app stays in setup and sends no AI request. Change the height and
  weight fields and verify the read-only BMI updates immediately. Confirm
  setup online and then edit the approved budget and goals through Profile.
- On two devices, verify draft and confirmed meal behavior, deterministic
  nutrition totals, water and weight entries, and fasting completion. On one
  device disable connectivity, edit records and check cached/pending labels.
  Reconnect and check server acknowledgement, conflicts and tombstones. Sign
  out and switch accounts to check that private records remain isolated.
- Check Arabic RTL and English LTR layouts, units, local day and Monday
  rollover, and an owner time zone different from the device time zone.
- On Android, approve, deny and revoke notifications. Check scheduled
  delivery across app restarts, reboot and time zone changes. For opted-in
  FCM, verify registration, revocation, delivery and deep links. Use generic
  lock-screen text. For iOS FCM, configure APNs and signing separately.
- Place the Android widget. Check its hidden default, health-data opt-in,
  sign-out reset, stale state, date rollover, and protected tap destinations.
  Background refresh and delivery depend on the OS and launcher.
- Verify camera/gallery permissions, rotation, visible redaction, metadata
  stripping, discard and upload consent. Enable Storage only after rule review
  and verify offline retry, photo replacement and deletion. Use synthetic
  photos and no personal information in device logs.
- Enter JOD amounts with three decimal places and Arabic digits, edit and
  delete expenses, and confirm weekly totals. Test budget changes, unknown
  prices and optional meal drafts. Confirm, cancel and save an export in the
  native picker. Inspect its timestamps, units, and absence of UID,
  credentials, photos and deleted records. Review the account-reset notes
  in the [project README](../README.md#weekly-budget-and-portable-data).

## iOS and optional AI

- Install and select Xcode 26.2 or newer with Swift 6.2.3 or newer. Verify
  package resolution and a simulator build following the
  [iOS setup guide](../ios/README.md). Run device signing, permissions,
  notifications, photo and export checks separately. A WidgetKit extension
  requires approved App Group entitlements and separate implementation.
- Use Node.js 22 for Functions. Review the
  [gateway contract](../functions/README.md) and verify local Auth, owner
  checks and mock behavior before planning deployment. For the intended
  Functions service account, review required Firestore, Storage and Secret
  Manager access. Review request-marker TTL and quota behavior.
- After separate authorization for provider use, review OpenAI retention
  terms, approved model, spend caps and alerting. Create the server secret
  `OPENAI_API_KEY` using Firebase's protected input and grant the intended
  owner the `ketoAiOwner` custom claim through trusted admin tooling. Keep
  `AI_GATEWAY_LIVE` false during deployment validation. With the approved
  project and only those callables selected, the operator can set the secret
  and deploy the callables.

  ```sh
  firebase functions:secrets:set OPENAI_API_KEY --project APPROVED_PROJECT_ID
  firebase deploy --only functions:interpretMeal,functions:askCoach --project APPROVED_PROJECT_ID
  ```

- Confirm App Check and cost controls before enabling live mode. Enable the
  client using `--dart-define=AI_ASSISTANCE_ENABLED=true` only in approved
  builds. For image review also set
  `--dart-define=MEAL_PHOTO_STORAGE_ENABLED=true`. Verify cancellation, rate
  limits and fallback. Check that suggestions never commit a diary entry or
  modify a profile goal without owner review.
