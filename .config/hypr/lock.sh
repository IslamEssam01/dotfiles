#! /bin/sh

# ./dpms.sh & swaylock -i ~/wallpapers/outerwilds.jpg --indicator --clock --timestr "%l:%M:%S %p" 
    if  ! pgrep -x "gtklock" > /dev/null
    then
        # Your command here
        gtklock -i -b ~/wallpapers/outerwilds.jpg -L ~/.config/hypr/dpms.sh  -U "pkill dpms.sh" -t "%l:%M:%S %p"
    fi
