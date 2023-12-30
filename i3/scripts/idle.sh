#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 5 minutes , undim if user becomes active` \
  --timer 300 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .5' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  `# Undim & lock after 5 more minutes` \
  --timer 300 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; betterlockscreen -l  -- --time-str "%I:%M:%S %p" ' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 3600 \
    'systemctl suspend' \
    ''
