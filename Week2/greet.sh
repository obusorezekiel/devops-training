#!/bin/bash

read -p "What's your name?: " name

if [[ $name = "abort" ]]; then
    echo "You have aborted the script execution!"
    exit
else
    echo "Hello" $name"!"
fi

