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
    # I
    input tap $Ix $Iy;
    # Space
    input tap $Spacex $Spacey;
    # U
    input tap $Ux $Uy;"
done;