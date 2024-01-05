#!/bin/sh
TEMP=$(sensors | grep 'Adapter: PCI adapter\|' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o | head -1)
CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s\n", $(NF-9))}')
echo "$CPU_USAGE $TEMP" | awk '{ printf(" CPU:%6s% @ %s \n"), $1, $2 }'
