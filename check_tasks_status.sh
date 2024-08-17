#!/bin/bash

output=$(pgrep -laf cloudflared)
if echo "$output" | grep -q "cloudflared"; then
    echo "cloudflared online"
else
    echo "cloudflared offline"
	directory=$(pwd)"/cloudflared/"
    if [ -d "$directory" ]; then
        echo "$directory exist, start now."
        cd $directory
        ./start.sh
        cd ~
    fi
fi

output=$(pgrep -laf freechatgpt)
if echo "$output" | grep -q "freechatgpt"; then
    echo "freechatgpt online"
else
    echo "freechatgpt offline"
	directory="~/ChatGPT-to-API/app/"
    if [ -d "$directory" ]; then
        echo "$directory exist, start now."
        cd $directory
        nohup ./freechatgpt >/dev/null 2>&1 &
        cd ~
    fi
fi

output=$(pgrep -laf web)
if echo "$output" | grep -q "web"; then
    echo "Sing-box online"
else
    echo "Sing-box offline"
	file=$(pwd)"/my_00.sh"
    if [ -f "$file" ]; then
        echo "$file exist, start now."
        nohup $file >/dev/null 2>&1 &
    fi
fi
