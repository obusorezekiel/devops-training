#!/bin/bash

# simple script tat request for user name 
# and echo welcome to user with user's name

printf "\n"

read -p "Please provide your first name: " fname

printf "\n"

if [ -z "$fname" ]; then
	printf '%s\n' "No input entered"
	exit 1

# if response is valid -string-  welcome user
elif [[ $fname =~ ^[a-zA-Z] ]]; then
	printf "%b\n" "Welcome to class, $fname\n"
	
# If response is not empty and not string
else
	printf "Your input is invalid %s " "$fname"
  
fi
