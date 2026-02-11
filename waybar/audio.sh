#!/usr/bin/env bash
set -e
set -u
set -o pipefail

current_volume=$(/usr/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@)

volume="$(echo $current_volume | cut -f 2 -d " " | sed 's/\.//g')"

if [[ $current_volume == *"MUTED"* ]]; then
   sound_symbol=🔇
else
   if [ ${volume%\%} -lt 30 ]; then
      sound_symbol=🔈
   elif [ ${volume%\%} -lt 70 ]; then
      sound_symbol=🔉
   else
      sound_symbol=🔊
   fi
fi

echo $sound_symbol$volume%
