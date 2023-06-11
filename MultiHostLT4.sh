#!/bin/sh
trap "exit 0" 0 1 2 3 9 15 ERR

case $1 in
    cel)
        source $(dirname $BASH_SOURCE)/varcel
        ;;
    emu)
        source $(dirname $BASH_SOURCE)/variables
        ;;
    *)
        echo Not a valid platform;
        exit 0
        ;;
esac

while true; do
    adb shell "
        input tap $formationX $formationY;
        sleep $sleeptime;
        input tap $questDetailsX $questDetailsY; 
        sleep $doubletime;
        input tap $embarkX $embarkY;
        sleep $doubletime;
        input tap $embarkX $embarkY;
        sleep $sleeptime;
        input tap $confirmX $confirmY;
        sleep $sleeptime;
        input tap $closeDetailsX $closeDetailsY;
        sleep $sleeptime;
    "
done;
