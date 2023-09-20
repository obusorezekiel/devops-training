#!/usr/bin/env bash

for file in *; do
    if [ -f "$file" ]; then
        first_line=$(head -n 1 "$file")
        echo -e "The first line of $file:\n\t$first_line\n"
    fi
done

