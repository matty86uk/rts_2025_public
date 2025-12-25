#!/bin/sh
printf '\033c\033]0;%s\a' rts_2025
base_path="$(dirname "$(realpath "$0")")"
"$base_path/rts_2025.x86_64" "$@"
