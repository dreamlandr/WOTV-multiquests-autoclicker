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
    input tap $confirmX $confirmY;
    # embark
    input tap $embarkX $embarkY;
    # U
    input tap $applyX $applyY;"
done;