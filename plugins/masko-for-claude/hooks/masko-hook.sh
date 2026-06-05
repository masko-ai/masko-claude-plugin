#!/usr/bin/env bash
set -euo pipefail

sender="${HOME}/.masko-desktop/hooks/hook-sender"
log_file="${HOME}/.masko-desktop/claude-cowork-plugin.log"
payload="$(cat)"
event_name="$(printf '%s' "${payload}" | sed -n 's/.*"hook_event_name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -n 1)"

mkdir -p "${HOME}/.masko-desktop" 2>/dev/null || true

if [[ ! -x "${sender}" ]]; then
  printf '[%s] skipped event=%s reason=missing-sender sender=%s bytes=%s\n' \
    "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    "${event_name:-unknown}" \
    "${sender}" \
    "${#payload}" >> "${log_file}" 2>/dev/null || true
  exit 0
fi

printf '[%s] forwarding event=%s sender=%s bytes=%s\n' \
  "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  "${event_name:-unknown}" \
  "${sender}" \
  "${#payload}" >> "${log_file}" 2>/dev/null || true

printf '%s' "${payload}" | "${sender}" --source claude-cowork
