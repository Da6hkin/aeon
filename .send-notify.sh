#!/usr/bin/env bash
set -euo pipefail
MSG=$(cat /home/runner/work/aeon/aeon/.trending-msg.txt)
exec /home/runner/work/aeon/aeon/notify "$MSG"
