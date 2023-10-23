#!/bin/bash

read -p "Specify the directory (path) containing the files: " dir_path

if [[ -d $dir_path ]]; then
    # Print the first line of each file that is directly in the given directory
    for filename in $(ls $dir_path); do
        if [[ -f $dir_path/$filename ]]; then
            echo "First line of the file, "$dir_path/$filename": "$(head -n 1 $dir_path/$filename)
        fi
    done
else
    echo "There's no directory on the path " $dir_path
fi

