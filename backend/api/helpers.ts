import { errorStore } from "@/frontend/states_store/errorStore";
import log from "@/utils/logger";
import supabase from "@/utils/supabase";
import { AuthError } from "@supabase/supabase-js";
import * as z from "zod";
import { Function, Functions } from "@/backend/types/database.types";

export async function processAuthRequest<T>(
  cb: () => Promise<T>
): Promise<T | null> {
  try {
    return await cb();
  } catch (err) {
    const stack: any = {};
    Error.captureStackTrace(stack);
    log.error(err);

    if (err instanceof z.ZodError)
      errorStore.getState().actions.setError(err.message);
    else if (err instanceof AuthError)
      errorStore.getState().actions.setError(err.message);

    return null;
  }
}

export async function processRpcRequest<T extends keyof Functions>(
  funName: T,
  argsObj: Function<T>["Args"] = {} as Function<T>["Args"]
): Promise<Function<T>["Returns"] | null> {
  try {
    const { data, error } = await supabase.rpc(funName, argsObj);

    if (error) throw error;

    log.info("Called: ", funName);

    return data as Function<T>["Returns"];
  } catch (err: any) {
    const stack: any = {};
    Error.captureStackTrace(stack);
    log.error(err);
    log.error("Callstack: ", stack.stack);

    errorStore.getState().actions.setError(err.message);

    return null;
  }
}
