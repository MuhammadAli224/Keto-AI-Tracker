import { createHash } from "node:crypto";
import { getFirestore, Timestamp } from "firebase-admin/firestore";
import { getStorage } from "firebase-admin/storage";
import { CallableRequest, HttpsError } from "firebase-functions/v2/https";

const maxImageBytes = 2 * 1024 * 1024;

export async function authorizedOwner(request: CallableRequest<unknown>, live: boolean): Promise<string> {
  const uid = request.auth?.uid;
  if (!uid) throw new HttpsError("unauthenticated", "Sign in before using the gateway.");
  if (live && request.auth?.token.ketoAiOwner !== true) {
    throw new HttpsError("permission-denied", "Live access is unavailable for this account.");
  }
  const profile = await getFirestore().collection("users").doc(uid).get();
  if (profile.get("confirmationVersion") !== 1 || !(profile.get("confirmedAt") instanceof Timestamp)) {
    throw new HttpsError("failed-precondition", "Confirm your profile before using the gateway.");
  }
  return uid;
}

export async function checkMeal(uid: string, mealId: string): Promise<void> {
  const meal = await getFirestore().collection("users").doc(uid).collection("meals").doc(mealId).get();
  if (!["draft", "confirmed"].includes(meal.get("status"))) {
    throw new HttpsError("not-found", "The meal is unavailable.");
  }
}

export async function ownedPhoto(uid: string, mealId: string): Promise<Buffer> {
  const name = `users/${uid}/mealPhotos/${mealId}.jpg`;
  const bucket = getStorage().bucket();
  let metadata;
  try {
    [metadata] = await bucket.file(name).getMetadata();
  } catch (error) {
    if (typeof error === "object" && error !== null && "code" in error && error.code === 404) {
      throw new HttpsError("not-found", "The meal photo is unavailable.");
    }
    throw error;
  }
  const size = Number(metadata.size);
  if (!Number.isSafeInteger(size) || size < 3 || size > maxImageBytes ||
      metadata.contentType !== "image/jpeg" || !metadata.generation) {
    throw new HttpsError("invalid-argument", "The photo must be a JPEG of up to 2 MiB.");
  }

  const chunks: Buffer[] = [];
  let length = 0;
  const file = bucket.file(name, { generation: metadata.generation });
  for await (const chunk of file.createReadStream()) {
    const buffer = Buffer.isBuffer(chunk) ? chunk : Buffer.from(chunk);
    length += buffer.length;
    if (length > maxImageBytes) throw new HttpsError("invalid-argument", "The photo is too large.");
    chunks.push(buffer);
  }
  const jpeg = Buffer.concat(chunks);
  if (jpeg.length !== size || jpeg[0] !== 0xff || jpeg[1] !== 0xd8 || jpeg[2] !== 0xff) {
    throw new HttpsError("invalid-argument", "The photo is not a valid JPEG.");
  }
  return jpeg;
}

function digest(value: string): string {
  return createHash("sha256").update(value).digest("hex");
}

export async function reserveRequest(uid: string, requestId: string): Promise<void> {
  const db = getFirestore();
  const owner = db.collection("_aiGatewayLimits").doc(`owner_${digest(uid)}`);
  const global = db.collection("_aiGatewayLimits").doc("global");
  const marker = db.collection("_aiGatewayRequests").doc(digest(`${uid}\0${requestId}`));
  const now = Date.now();
  const day = new Date(now).toISOString().slice(0, 10);
  await db.runTransaction(async (transaction) => {
    const [ownerQuota, globalQuota, prior] = await transaction.getAll(owner, global, marker);
    if (!ownerQuota || !globalQuota || !prior) throw new Error("Quota unavailable");
    if (prior.exists) throw new HttpsError("already-exists", "This request has already been submitted.");
    const count = (value: typeof ownerQuota) => value.get("day") === day ? Number(value.get("count") ?? 0) : 0;
    const ownerCount = count(ownerQuota);
    const globalCount = count(globalQuota);
    const lastRequest = Number(ownerQuota.get("lastRequest") ?? 0);
    if (ownerCount >= 4 || globalCount >= 20 || now - lastRequest < 30_000) {
      throw new HttpsError("resource-exhausted", "The gateway request limit has been reached.");
    }
    transaction.set(owner, { day, count: ownerCount + 1, lastRequest: now });
    transaction.set(global, { day, count: globalCount + 1 });
    transaction.create(marker, { expiresAt: Timestamp.fromMillis(now + 7 * 86_400_000) });
  });
}
