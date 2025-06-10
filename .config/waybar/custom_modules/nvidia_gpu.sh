#!/bin/bash

temperature=$(nvidia-smi --query-gpu=temperature.gpu | sed -n '2p')
deviceinfo=$(nvidia-smi --query-gpu=gpu_name | sed -n '2p')
driverinfo=$()

echo '{"text": "  '$temperature'°C", "class": "custom-gpu", "tooltip": "<b>'$deviceinfo'</b>\n'$driverinfo'"}'
