# AI callable gateway

The local Functions emulator always uses a mock transport and makes no OpenAI
request. The production transport starts disabled. Real Firebase deployment,
billing, provider provisioning, secret creation, role grants and device
App Check configuration are **BLOCKED_EXTERNAL**.

## Callable contract

Both operations use Firebase's callable JSON envelope and run in
`us-central1`. The Firebase client SDK supplies Auth and App Check tokens.
Send `requestId` as a new lowercase UUID for each intentional request,
`locale` as `en` or `ar`, and `consent: true` after explicit user approval.

| Callable | Additional input | Result fields |
| --- | --- | --- |
| `interpretMeal` | `mealId`, an existing UID-owned draft or confirmed meal UUID, and `photoRef`, the approved local photo's UUID recorded by the uploader | `mode`, `ingredients`, `clarificationQuestions`, `needsReview` |
| `askCoach` | `message`, at most 1,200 characters and 4,800 UTF-8 bytes. Optional `includeGoals` defaults to false. | `mode`, `guidance`, `clarificationQuestions` |

An ingredient has `name`, nullable estimated `grams`, `uncertainty` with
`low`, `medium` or `high`, and `kind` with `ingredient`, `sauce` or
`oil`. The response contains no nutrient values. The client must verify
ingredients, quantities and nutrition before changing totals. Mock responses
use `mode: "mock"` with empty findings, so consumers can show an explicit
manual fallback. The live coach provides general planning support and does
not change goals or prescribe treatment.

Firebase callable errors include `unauthenticated` for missing Auth,
`permission-denied` for missing owner authorization, `failed-precondition`
for an unconfirmed profile or mismatched photo reference, `invalid-argument` for invalid inputs,
`not-found` for unavailable owned meals/photos, `already-exists` for a
previously reserved request ID, `resource-exhausted` for quota limits, and
`unavailable` for provider or infrastructure errors. Avoid automatic retries
with a new ID. The server stores quota metadata and request hashes, with no
prompts, images, identifiers from the model provider, or model output.

## Local verification

The deployment runtime is Node.js 22. Run `npm ci` and `npm run build` from
this directory. Use only a Firebase `demo-` project for local services.
From the repo root, `firebase emulators:start --only auth,firestore,storage,functions --project demo-keto-tracker`
loads the mock. Auth, the `ketoAiOwner` custom claim and a confirmed profile
are required. App Check is enforced outside the emulator.

## Manual prerequisites for live use

Set `AI_GATEWAY_SERVICE_ACCOUNT` to the dedicated runtime service account email.
Grant only the Firestore, Storage and secret access needed. Every deployed
callable revision binds `OPENAI_API_KEY` in Secret Manager, including with live
mode disabled. Local emulator use requires no provider secret.
Authorize the intended Firebase owner with the
`ketoAiOwner` custom claim using trusted admin tooling. Configure and verify
the App Check clients. A live request additionally requires the
`AI_GATEWAY_LIVE` boolean parameter, which defaults to false. Confirm
provider terms, retention requirements, approved model availability, quotas
and billing before enabling it. The pinned vision-capable model is
`gpt-5.4-mini-2026-03-17`. [OpenAI model documentation](https://developers.openai.com/api/docs/models/gpt-5.4-mini)

The gateway uses one upstream request, bounded image bytes, fixed output
token limits, four live reservations per owner per UTC day, 20 per project
per UTC day, and a 30-second owner cooldown. Request IDs are deduplicated
while the request marker exists. Failures after reservation consume a slot.
Enable TTL on the server-only
`_aiGatewayRequests.expiresAt` field after review. The gateway sets
`store: false` for Responses API calls. Review provider retention and configure
provider budget alerts separately.
[Responses API](https://developers.openai.com/api/reference/resources/responses/methods/create) [Firebase App Check](https://firebase.google.com/docs/app-check/cloud-functions)

## Flutter client

Ordinary builds show the manual fallback. An approved native build can enable
the callable client with `--dart-define=AI_ASSISTANCE_ENABLED=true`.
Configure Play Integrity on Android and App Attest on iOS before enabling
the client. Meal review additionally needs the Storage build flag and an
explicitly approved, completed upload. Open the saved draft and approve sending
the current image to OpenAI. Uploads made before the photo reference was
recorded must be reuploaded with fresh consent for AI review. AI findings are held in the editor's memory.
Matching a finding to the catalog and reviewing its weight creates an editable
serving. Diary totals change only after confirming the meal.

Coach requests may include `includeGoals: true` after a separate opt-in.
The gateway reads the latest approved daily energy, protein, net carb, fat
and water targets from the owner profile. It sends only those targets and
the submitted question. The app keeps the reply in memory and opens the
profile for any manual goal changes.

Closing or cancelling a review discards the result and prevents a request
that has yet to leave the app. An already dispatched Firebase callable may
still complete and count toward the quota. The app never retries it
automatically. Removing an uploaded image uses the diary attachment deletion
flow. The callable does not store coach messages or AI estimates. Review the
provider's retention and spending controls before activation.
