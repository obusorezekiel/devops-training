# Write a python script to automate the process of copying files selected by a user from one folder into another
import os
import shutil


folder_to_copy_from = input("Enter the file you want to copy: ")
directory_to_copy_to = input("Enter the folder or directory to copy the file to: ")

foldername = os.path.exists(folder_to_copy_from)
directory = os.path.exists(directory_to_copy_to)

if not (foldername and directory):
    print(" FIle does not exist", foldername, directory)
    exit 

print(os.listdir(folder_to_copy_from))

filename = input("Choose file name from the list ")

filepath = folder_to_copy_from + "/filename"
directory_path = "/" + directory_to_copy_to + "/"

print(filepath, directory_path)
shutil.copy(filepath, directory_path)




