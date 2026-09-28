import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

interface RpivAskUserBlockedPayload {
  active?: boolean;
}

/** Maps rpiv-ask-user-question's blocked lifecycle onto Herdr's official channel. */
export default function rpivHerdrBridge(pi: ExtensionAPI): void {
  pi.events.on(
    "rpiv:ask-user:blocked",
    (payload: RpivAskUserBlockedPayload | undefined) => {
      pi.events.emit(
        "herdr:blocked",
        payload?.active
          ? { active: true, label: "Waiting for ask_user_question" }
          : { active: false },
      );
    },
  );
}

