#!/bin/bash

GOVERNOR=$(asusctl profile get | head -n 1 | awk '{print $3}')

if [ $GOVERNOR = Performance ]; then
	echo '{"text": "perf", "alt": "perf", "class": "performance", "tooltip": "<b>Governor</b> Performance"}'
	if [[ $1 = switch ]]; then
		asusctl profile set Balanced;pkill -RTMIN+8 waybar;
	fi
	#echo ''
elif [ $GOVERNOR = Balanced ]; then
	echo '{"text": "balanced", "alt": "balanced", "class": "balanced", "tooltip": "<b>Governor</b> Balanced"}'
	if [[ $1 = switch ]]; then
		asusctl profile set Quiet;pkill -RTMIN+8 waybar;
	fi
elif [ $GOVERNOR = Quiet ]; then
	echo '{"text": "quiet", "alt": "quiet", "class": "balanced", "tooltip": "<b>Governor</b> Quiet"}'
	if [[ $1 = switch ]]; then
		asusctl profile set Performance;pkill -RTMIN+8 waybar;
	fi
fi
