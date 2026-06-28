#!/usr/bin/env bash
set -e
MSG=$(cat /home/runner/work/aeon/aeon/.scratch/notify_msg.txt)
/home/runner/work/aeon/aeon/notify "$MSG"
