#!/bin/sh
trap "exit 0" 0 1 2 3 9 15 ERR

case $1 in
    cel)
        source $(dirname $(readlink -f $0))/varcel
        ;;
    emu)
        source $(dirname $(readlink -f $0))/variables
        ;;
    *)
        echo Not a valid platform;
        exit 0
        ;;
esac

while true; do
    adb shell "
        input tap $embarkX $embarkY;
        input tap $applyX $applyY;
    "
done;