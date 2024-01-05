#!/usr/bin/env sh

. "$(dirname "$0")"/.nnn-plugin-helper

printf "pattern: "
read -r pattern

if ! [ -z "$pattern" ]; then
    printf "%s" "+l" > "$NNN_PIPE"
    eval "fd -HI0 -E mounts '$pattern'  $HOME" > "$NNN_PIPE"
fi
