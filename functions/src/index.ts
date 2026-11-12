import { initializeApp } from "firebase-admin/app";
import { defineBoolean, defineSecret } from "firebase-functions/params";
import { HttpsError, onCall } from "firebase-functions/v2/https";
import { coachRequest, mealRequest } from "./contract";
import { authorizedOwner, checkMeal, ownedPhoto, reserveRequest } from "./security";
import { AiTransport, MockTransport, OpenAiTransport } from "./transport";

initializeApp();

const emulator = process.env.FUNCTIONS_EMULATOR === "true";
const enableLive = emulator ? undefined : defineBoolean("AI_GATEWAY_LIVE", { default: false });
const providerCredential = defineSecret("OPENAI_API_KEY");

const callableOptions = {
  region: "us-central1",
  enforceAppCheck: !emulator,
  secrets: emulator ? [] : [providerCredential],
  timeoutSeconds: 45,
  maxInstances: 2,
  concurrency: 1,
};

function isLive(): boolean {
  return enableLive?.value() ?? false;
}

function transport(live: boolean): AiTransport {
  if (!live) return new MockTransport();
  const credential = providerCredential.value();
  if (!credential) throw new HttpsError("failed-precondition", "The provider is not configured.");
  return new OpenAiTransport(credential);
}

async function safeCall<T>(operation: () => Promise<T>): Promise<T> {
  try {
    return await operation();
  } catch (error) {
    if (error instanceof HttpsError) throw error;
    throw new HttpsError("unavailable", "The gateway is temporarily unavailable.");
  }
}

export const interpretMeal = onCall<unknown>(callableOptions, (request) => safeCall(async () => {
  const parsed = mealRequest.safeParse(request.data);
  if (!parsed.success) throw new HttpsError("invalid-argument", "Invalid meal request.");
  const live = isLive();
  const { uid } = await authorizedOwner(request);
  await checkMeal(uid, parsed.data.mealId);
  const service = transport(live);
  if (live) await reserveRequest(uid, parsed.data.requestId);
  const photo = live ? await ownedPhoto(uid, parsed.data.mealId) : undefined;
  const result = await service.interpret(parsed.data.locale, photo);
  return { mode: service.mode, needsReview: true, ...result };
}));

export const askCoach = onCall<unknown>(callableOptions, (request) => safeCall(async () => {
  const parsed = coachRequest.safeParse(request.data);
  if (!parsed.success) throw new HttpsError("invalid-argument", "Invalid coach request.");
  const live = isLive();
  const { uid, goals } = await authorizedOwner(request);
  const service = transport(live);
  if (live) await reserveRequest(uid, parsed.data.requestId);
  const result = await service.coach(
    parsed.data.locale, parsed.data.message, parsed.data.includeGoals ? goals : undefined,
  );
  return { mode: service.mode, ...result };
}));
