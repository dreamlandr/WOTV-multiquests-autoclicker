#!/bin/sh
set -u

trap "exit 0" 0 1 2 3 9 15 ERR

while true; do
    SCRIPT=$(whiptail --title "WOTV Script runner" --menu "Choose the script you want to run" 20 100 0 \ 1 "Multi Guest" \ 2 "Multi Host Solo" \ 3 "Multi Host <= 4" \ 4 "Multi Host 4" \ 5 "Raid Auto" --cancel-button Quit 3>&1 1>&2 2>&3)

    if [ -z $SCRIPT ]; then
        kill 0
    fi

    PLATFORM=$(whiptail --title "WOTV Script runner" --menu "Choose the platform to run the script in" 20 100 0 \ 1 "Emulator" \ 2 "Cellphone" --cancel-button Quit 3>&1 1>&2 2>&3)

    case $PLATFORM in
        0) kill 0 ;;
        " 1") PLATFORM="emu";;
        " 2") PLATFORM="cel";;
    esac

    case $SCRIPT in
        " 1") $(dirname $BASH_SOURCE)/MultiGuest.sh $PLATFORM & if whiptail --title "WOTV Script runner" --yesno "Running Multi Guest" --yes-button "Stop and return to Main Menu" --no-button "Quit" 20 100 0;
            then
                kill $(jobs -p);
            else
                kill 0;
            fi
            ;;
        " 2") $(dirname $BASH_SOURCE)/MultiHostSolo.sh $PLATFORM & if whiptail --title "WOTV Script runner" --yesno "Running Multi Host Solo" --yes-button "Stop and return to Main Menu" --no-button "Quit" 20 100 0;
            then
                kill $(jobs -p);
            else
                kill 0;
            fi
            ;;
        " 3") $(dirname $BASH_SOURCE)/MultiHostLT4.sh $PLATFORM & if whiptail --title "WOTV Script runner" --yesno "Running Multi Host <= 4" --yes-button "Stop and return to Main Menu" --no-button "Quit" 20 100 0;
            then
                kill $(jobs -p);
            else
                kill 0;
            fi
            ;;
        " 4") $(dirname $BASH_SOURCE)/MultiHost4.sh $PLATFORM & if whiptail --title "WOTV Script runner" --yesno "Running Multi Host 4" --yes-button "Stop and return to Main Menu" --no-button "Quit" 20 100 0;
            then
                kill $(jobs -p);
            else
                kill 0;
            fi
            ;;
        " 5") $(dirname $BASH_SOURCE)/RaidAuto.sh $PLATFORM & if whiptail --title "WOTV Script runner" --yesno "Raid Auto" --yes-button "Stop and return to Main Menu" --no-button "Quit" 20 100 0;
            then
                kill $(jobs -p);
            else
                kill 0;
            fi
            ;;
    esac
done