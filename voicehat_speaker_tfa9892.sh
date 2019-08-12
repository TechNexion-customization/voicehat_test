#!/bin/bash

RED='\033[0;31m'
GREEN='\033[36m\n'
NC='\033[0m'

driver=$(lsmod | grep snd_soc_tfa98xx)
if [ -z "$driver" ]; then
  modprobe snd-soc-tfa98xx
  sleep 3
fi

echo -e $GREEN***********************************
echo '      Speaker Testing '
echo -e ***********************************$NC

SPEAKER_CARD=$( aplay -l | grep TFA9912 | cut -d ':' -f 1 | cut -d ' ' -f 2 )

if [ -z "$SPEAKER_CARD" ]; then
    echo "Can not find TFA9912 speaker!"
    exit 1
else
    speaker-test -t wav -c 2 -l 2 -D hw:$SPEAKER_CARD
fi
