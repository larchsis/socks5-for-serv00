#!/bin/bash

output=$(pgrep -laf cloudflared)
if echo "$output" | grep -q "cloudflared"; then
    echo "cloudflared online"
else
    echo "cloudflared offline"
    nohup ~/cloudflared/start.sh >/dev/null 2>&1 &
fi

output=$(pgrep -laf freechatgpt)
if echo "$output" | grep -q "freechatgpt"; then
    echo "freechatgpt online"
else
    echo "freechatgpt offline"
    cd ~/ChatGPT-to-API/app/
    nohup ./freechatgpt >/dev/null 2>&1 &
    cd ~
fi

output=$(pgrep -laf web)
if echo "$output" | grep -q "web"; then
    echo "Sing-box online"
else
    echo "Sing-box offline"
    nohup ~/my_00.sh >/dev/null 2>&1 &
fi
