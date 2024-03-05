#! /bin/sh

# ./dpms.sh & swaylock -i ~/wallpapers/outerwilds.jpg --indicator --clock --timestr "%l:%M:%S %p" 
    if  ! pgrep -x "swaylock" > /dev/null
    then
        # Your command here
        swaylock -i ~/wallpapers/outerwilds.jpg --indicator --clock --timestr "%l:%M:%S %p"   --indicator-idle-visible 
    fi
