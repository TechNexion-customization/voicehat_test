#!/bin/bash

RED='\033[0;31m'
GREEN='\033[36m\n'
NC='\033[0m'

echo -e $GREEN***********************************
echo '      LED Testing '
echo -e ***********************************$NC

LEDS=( $(find /sys/class/leds/ -name "pca995x*" | sort) )

for i in {1..10}; do
        for LEDS in ${LEDS[@]}; do
                echo 255 >  "$LEDS"/brightness
                usleep 10000

                echo 0 > "$LEDS"/brightness
        done
done