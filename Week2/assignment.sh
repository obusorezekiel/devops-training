#!/usr/bin/env bash
: '
This is a script that gets the users name and
outputs a greeting
'

prompt_user(){
	read -p "What is your first name?: " first_name
	read -p "What is your last name?: " last_name
}

prompt_user

echo -e "\nGood day $first_name $last_name\nHave a lovely day"
