#!/bin/bash

read -p "Please type the name of the root directory: " root_name

if [[ $root_name = "abort" ]]; then
    # Abort the script
    echo "You have aborted the script"
    exit
elif [[ -d $root_name ]]; then
    # Inform the user that the directory already exists
    echo "This directory already exists"
    exit
fi

ROOTDIR=~/$root_name/html

mkdir ~/$root_name && mkdir $ROOTDIR && mkdir $ROOTDIR/img $ROOTDIR/js $ROOTDIR/css

touch $ROOTDIR/img/testing.png $ROOTDIR/js/testing.js $ROOTDIR/css/testing.css


