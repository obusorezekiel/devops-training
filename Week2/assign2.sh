#!/bin/bash

# Script to print first line of all files in a directory recursively
#
#
echo " Script to print first line of all file in a directory recursively "
#
# 
#

echo "Display content of files in 'C:/Training/Next/udemy_clone_code/138_instructor_account_history_and_payouts' directory" 


for file in $(find  C:/Training/Next/udemy_clone_code/138_instructor_account_history_and_payouts -type f) ; do
    echo " "
    echo ${file}
    echo "############START OF FILE#########"
    #echo " "
    head -n 3 ${file}
    echo "##########END OF LINE#3 OF FILE########"
    echo " "
done

