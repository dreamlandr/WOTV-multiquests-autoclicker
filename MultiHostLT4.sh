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
        # O
        input tap $formationX $formationY;
        sleep $sleeptime;
        # Y
        input tap $questDetailsX $questDetailsY; 
        sleep $doubletime;
        # embark
        input tap $embarkX $embarkY;
        sleep $doubletime;
        # embark
        input tap $embarkX $embarkY;
        sleep $sleeptime;
        # I
        input tap $confirmX $confirmY;
        sleep $sleeptime;
        # X
        input tap $closeDetailsX $closeDetailsY;
        sleep $sleeptime;
    "
done;
