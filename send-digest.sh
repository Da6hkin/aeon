#!/usr/bin/env bash
set -euo pipefail
MSG=$(cat /tmp/digest-2026-03-10.md)
exec ./notify "$MSG"
