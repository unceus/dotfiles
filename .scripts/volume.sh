#!/bin/bash

mixer=$(amixer get Master | grep 'Left: Playback')
#echo $mixer | cut -d ' ' -f 4
#echo $mixer | cut -d ' ' -f 6

echo $mixer | cut -d ' ' -f 5
