#!/bin/bash

grep='Left\:\ Playback'

mixer=$(amixer get Master | grep 'Left\:\ Playback')
#echo $mixer | cut -d ' ' -f 4
#echo $mixer | cut -d ' ' -f 6

muted=$(amixer get Master | grep 'Left\:\ Playback' | cut -d ' ' -f 9)
if [ "$muted" == "[off]" ]; then
	echo "[--]"
	else
	echo $mixer | cut -d ' ' -f 5
fi
