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
        input tap $Ox $Oy;
        sleep $sleeptime;
        # Y
        input tap $Yx $Yy; 
        sleep $doubletime;
        # Space
        input tap $Spacex $Spacey;
        sleep $doubletime;
        # Space
        input tap $Spacex $Spacey;
        sleep $sleeptime;
        # I
        input tap $Ix $Iy;
        sleep $sleeptime;
        # X
        input tap $Xx $Xy;
        sleep $sleeptime;
    "
done;
