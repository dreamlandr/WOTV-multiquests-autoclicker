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
    for i in 1 2 3 4 5 ; do 
        adb shell "
            # T
            input tap $Tx $Ty; 
            sleep $sleeptime;
            # Y
            input tap $Yx $Yy; 
            sleep $sleeptime;
            # Space
            input tap $Spacex $Spacey;
            sleep $sleeptime;
            # Space
            input tap $Spacex $Spacey;
            sleep $sleeptime;
            # U
            input tap $Ux $Uy; 
            sleep $sleeptime;"
    done;
    # X
    adb shell input tap $Xx $Xy;
    sleep $sleeptime;
done;