#!/bin/bash

GOVERNOR=$(asusctl profile -p --help | sed -n '2p' | sed 's/Active\ profile\ is\ //')

if [ $GOVERNOR = Performance ]; then
	echo '{"text": "perf", "alt": "perf", "class": "performance", "tooltip": "<b>Governor</b> Performance"}'
	if [[ $1 = switch ]]; then
		asusctl profile -P Balanced;pkill -RTMIN+8 waybar;
	fi
	#echo ''
elif [ $GOVERNOR = Balanced ]; then
	echo '{"text": "balanced", "alt": "balanced", "class": "balanced", "tooltip": "<b>Governor</b> Balanced"}'
	if [[ $1 = switch ]]; then
		asusctl profile -P Quiet;pkill -RTMIN+8 waybar;
	fi
elif [ $GOVERNOR = Quiet ]; then
	echo '{"text": "quiet", "alt": "quiet", "class": "balanced", "tooltip": "<b>Governor</b> Quiet"}'
	if [[ $1 = switch ]]; then
		asusctl profile -P Performance;pkill -RTMIN+8 waybar;
	fi
fi
