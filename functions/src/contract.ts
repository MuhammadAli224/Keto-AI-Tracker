import { z } from "zod";

const uuid = z.string().regex(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/);
const requestFields = {
  requestId: uuid,
  locale: z.enum(["en", "ar"]),
  consent: z.literal(true),
};

export const mealRequest = z.strictObject({ ...requestFields, mealId: uuid, photoRef: uuid });
export const coachRequest = z.strictObject({
  ...requestFields,
  includeGoals: z.boolean().default(false),
  message: z.string().trim().min(1).max(1200).refine((value) => Buffer.byteLength(value, "utf8") <= 4800),
});

export const mealOutput = z.strictObject({
  ingredients: z.array(z.strictObject({
    name: z.string().min(1).max(80),
    grams: z.number().min(0.1).max(2000).nullable(),
    uncertainty: z.enum(["low", "medium", "high"]),
    kind: z.enum(["ingredient", "sauce", "oil"]),
  })).max(12),
  clarificationQuestions: z.array(z.string().min(1).max(200)).max(5),
});

export const coachOutput = z.strictObject({
  guidance: z.array(z.string().min(1).max(350)).max(4),
  clarificationQuestions: z.array(z.string().min(1).max(200)).max(3),
});

export type Locale = "en" | "ar";

export function responseSchema<T extends z.ZodType>(schema: T): Record<string, unknown> {
  const { $schema: _unused, ...body } = z.toJSONSchema(schema, { target: "draft-7" });
  return body;
}
