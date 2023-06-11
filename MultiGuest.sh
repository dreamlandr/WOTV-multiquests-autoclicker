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

# echo "Starting Multi Guest"

while true; do
    # for i in 1 2 3 4 5 ; do 
        adb shell "
            input tap $battleSettingsX $battleSettingsY; 
            sleep $sleeptime;
            input tap $questDetailsX $questDetailsY; 
            sleep $sleeptime;
            input tap $embarkX $embarkY;
            sleep $sleeptime;
            input tap $embarkX $embarkY;
            sleep $sleeptime;
            input tap $applyX $applyY; 
            sleep $sleeptime;
            sleep $sleeptime;
            sleep $sleeptime;
            input tap $closeDetailsX $closeDetailsY;
            sleep $sleeptime;
        "
    # X
    # adb shell input tap $closeDetailsX $closeDetailsX;
    # sleep $sleeptime;
done;