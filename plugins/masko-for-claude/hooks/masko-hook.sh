#!/usr/bin/env bash
set -euo pipefail

sender="${HOME}/.masko-desktop/hooks/hook-sender"

if [[ ! -x "${sender}" ]]; then
  exit 0
fi

exec "${sender}" --source claude-cowork
