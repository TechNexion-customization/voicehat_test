#!/bin/bash

echo $(readlink -f "$0")
EXEC_PATH=$(dirname $0)

GREEN='\033[36m\n'
RED='\033[0;31m'
NC='\033[0m'

#Test 1: LED
${EXEC_PATH}/voicehat_led_pca9955.sh
if [ $? -eq 1 ]; then
	echo -e $RED Failed $NC
fi

#Test 2: Speaker
${EXEC_PATH}/voicehat_speaker_tfa9892.sh
if [ $? -eq 1 ]; then
	echo -e $RED Failed $NC
fi

#Test 3: MIC
${EXEC_PATH}/voicehat_mic_sph0645.sh
if [ $? -eq 1 ]; then
	echo -e $RED Failed $NC
fi

#Test 4: GPIO key
${EXEC_PATH}/voicehat_gpiokey.sh
if [ $? -eq 1 ]; then
	echo -e $RED Failed $NC
fi