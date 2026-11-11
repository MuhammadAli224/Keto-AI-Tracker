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
| `interpretMeal` | `mealId`, an existing UID-owned draft or confirmed meal UUID | `mode`, `ingredients`, `clarificationQuestions`, `needsReview` |
| `askCoach` | `message`, at most 1,200 characters and 4,800 UTF-8 bytes | `mode`, `guidance`, `clarificationQuestions` |

An ingredient has `name`, nullable estimated `grams`, `uncertainty` with
`low`, `medium` or `high`, and `kind` with `ingredient`, `sauce` or
`oil`. The response contains no nutrient values. The client must verify
ingredients, quantities and nutrition before changing totals. Mock responses
use `mode: "mock"` with empty findings, so consumers can show an explicit
manual fallback. The live coach provides general planning support and does
not change goals or prescribe treatment.

Firebase callable errors include `unauthenticated` for missing Auth,
`permission-denied` for missing live owner authorization, `failed-precondition`
for an unconfirmed profile, `invalid-argument` for invalid inputs,
`not-found` for unavailable owned meals/photos, `already-exists` for a
previously reserved request ID, `resource-exhausted` for quota limits, and
`unavailable` for provider or infrastructure errors. Avoid automatic retries
with a new ID. The server stores quota metadata and request hashes, with no
prompts, images, identifiers from the model provider, or model output.

## Local verification

The deployment runtime is Node.js 22. Run `npm ci` and `npm run build` from
this directory. Use only a Firebase `demo-` project for local services.
From the repo root, `firebase emulators:start --only auth,firestore,storage,functions --project demo-keto-tracker`
loads the mock. Auth and a confirmed profile are still required. App Check is
enforced outside the emulator.

## Manual prerequisites for live use

Review the Functions service account and grant only the Firestore, Storage,
and secret access needed. Provision the server-side `OPENAI_API_KEY` in
Firebase Secret Manager. Authorize the intended Firebase owner with the
`ketoAiOwner` custom claim using trusted admin tooling. Configure and verify
the App Check clients. A live request additionally requires the
`AI_GATEWAY_LIVE` boolean parameter, which defaults to false. Confirm
provider terms, retention requirements, approved model availability, quotas
and billing before enabling it. The pinned vision-capable model is
`gpt-5.4-mini-2026-03-17`. [OpenAI model documentation](https://developers.openai.com/api/docs/models/gpt-5.4-mini)

The gateway uses one upstream request, bounded image bytes, fixed output
token limits, per-owner and global daily quotas, and a cooldown per owner.
Callers supply a UUID so an identical request cannot be charged twice.
Failures consume a reservation. Keep the global cap and provider project
budget within the approved limit. Enable TTL on the server-only
`_aiGatewayRequests.expiresAt` field after review. The gateway sets
`store: false` for Responses API calls. Review provider retention separately.
[Responses API](https://developers.openai.com/api/reference/resources/responses/methods/create) [Firebase App Check](https://firebase.google.com/docs/app-check/cloud-functions)
