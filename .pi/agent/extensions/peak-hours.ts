/**
 * Peak Hours Indicator
 *
 * Shows in the footer whether the current time falls inside a China
 * peak-pricing window, expressed in the user's local Canary Islands time.
 *
 *   Summer (WEST, UTC+1): 02:00-05:00, 07:00-11:00
 *   Winter (WET,  UTC+0): 01:00-04:00, 06:00-10:00
 *
 * Displays either the time remaining until the window ends ("PEAK 2h14m")
 * or the time until the next window starts ("off 3h06m").
 *
 * DST is resolved via Intl, so the summer/winter tables switch automatically.
 */

import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";

const TZ = "Atlantic/Canary";
const STATUS_KEY = "peak-hours";
const TICK_MS = 60_000;

/** Peak windows as [startHour, endHour) in local time. */
const SUMMER: Array<[number, number]> = [[2, 5], [7, 11]];
const WINTER: Array<[number, number]> = [[1, 4], [6, 10]];

interface LocalNow {
  hours: number; // decimal hours, e.g. 2.5 = 02:30
  isSummer: boolean;
}

export function localNow(date: Date = new Date()): LocalNow {
  const parts = new Intl.DateTimeFormat("en-US", {
    timeZone: TZ,
    hour12: false,
    hour: "2-digit",
    minute: "2-digit",
    timeZoneName: "short",
  }).formatToParts(date);

  const pick = (type: string) => parts.find((p) => p.type === type)?.value ?? "";
  // `formatToParts` can report hour 24 for midnight.
  const hours = Number(pick("hour")) % 24 + Number(pick("minute")) / 60;
  const zone = pick("timeZoneName");

  return { hours, isSummer: zone === "WEST" || zone === "GMT+1" };
}

export interface PeakState {
  inPeak: boolean;
  /** Seconds until the next transition: window end when in peak, else window start. */
  untilSeconds: number;
}

export function peakState(date: Date = new Date()): PeakState {
  const { hours, isSummer } = localNow(date);
  const windows = isSummer ? SUMMER : WINTER;

  for (const [start, end] of windows) {
    if (hours >= start && hours < end) {
      return { inPeak: true, untilSeconds: Math.round((end - hours) * 3600) };
    }
    if (hours < start) {
      return { inPeak: false, untilSeconds: Math.round((start - hours) * 3600) };
    }
  }

  // Past the final window: wait for tomorrow's first window.
  const [firstStart] = windows[0];
  return { inPeak: false, untilSeconds: Math.round((24 - hours + firstStart) * 3600) };
}

export function formatCountdown(seconds: number): string {
  const total = Math.max(0, seconds);
  const h = Math.floor(total / 3600);
  const m = Math.floor((total % 3600) / 60);
  if (h > 0) return `${h}h${m.toString().padStart(2, "0")}m`;
  if (m > 0) return `${m}m`;
  return `${Math.floor(total)}s`;
}

export function formatStatus(state: PeakState): string {
  const countdown = formatCountdown(state.untilSeconds);
  return state.inPeak ? `PEAK ${countdown}` : `off ${countdown}`;
}

export default function (pi: ExtensionAPI) {
  let timer: ReturnType<typeof setInterval> | null = null;

  function render(ctx: ExtensionContext) {
    const state = peakState();
    const theme = ctx.ui.theme;
    const text = formatStatus(state);
    ctx.ui.setStatus(
      STATUS_KEY,
      state.inPeak ? theme.fg("warning", `⚡ ${text}`) : theme.fg("dim", `⚡ ${text}`),
    );
  }

  pi.on("session_start", async (_event, ctx) => {
    render(ctx);
    timer = setInterval(() => render(ctx), TICK_MS);
  });

  pi.on("turn_start", async (_event, ctx) => {
    render(ctx);
  });

  pi.on("session_shutdown", () => {
    if (timer) {
      clearInterval(timer);
      timer = null;
    }
  });
}

// ponytail: self-check for the window math, runnable without a test framework.
if (process.argv[1]?.endsWith("peak-hours.ts")) {
  const at = (iso: string) => new Date(iso);
  const cases: Array<[string, string, boolean, number]> = [
    // label,                ISO (UTC),              inPeak, untilSeconds
    ["summer 02:00 start",   "2026-09-21T01:00:00Z", true,  3 * 3600],
    ["summer 03:00",         "2026-09-21T02:00:00Z", true,  2 * 3600],
    ["summer 08:00",         "2026-09-21T07:00:00Z", true,  3 * 3600],
    ["summer 12:00 (gap)",   "2026-09-21T11:00:00Z", false, 14 * 3600],
    ["winter 02:00",         "2026-12-21T02:00:00Z", true,  2 * 3600],
    ["winter 05:00 (gap)",   "2026-12-21T05:00:00Z", false, 1 * 3600],
  ];

  let failures = 0;
  for (const [label, iso, wantPeak, wantUntil] of cases) {
    const got = peakState(at(iso));
    const ok = got.inPeak === wantPeak && Math.abs(got.untilSeconds - wantUntil) <= 1;
    if (!ok) failures++;
    console.log(
      `${ok ? "ok  " : "FAIL"} ${label.padEnd(20)} inPeak=${got.inPeak} until=${formatCountdown(got.untilSeconds)} (${formatStatus(got)})`,
    );
  }

  console.log(`\n${cases.length - failures}/${cases.length} passed`);
  process.exit(failures === 0 ? 0 : 1);
}
