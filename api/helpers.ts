import { errorStore } from "@/states_store/errorStore";
import log from "@/utils/logger";
import { AuthError } from "@supabase/supabase-js";
import * as z from "zod";

export async function processAuthRequest<T>(
  cb: () => Promise<T>
): Promise<T | undefined> {
  try {
    return await cb();
  } catch (err) {
    const stack: any = {};
    Error.captureStackTrace(stack);
    log.error(`Error: ${err}, Callstack: ${stack.stack}`);

    if (err instanceof z.ZodError)
      errorStore.getState().actions.setError(err.message);
    else if (err instanceof AuthError)
      errorStore.getState().actions.setError(err.message);
  }
}
