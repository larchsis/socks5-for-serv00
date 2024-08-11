#!/bin/bash

output=$(pgrep -laf web)
if echo "$output" | grep -q "web"; then
    echo "Sing-box online"
else
    echo "Sing-box offline"
    nohup ~/my_00.sh 2>/dev/null 2>&1 &
fi
