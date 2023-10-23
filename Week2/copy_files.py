#!/bin/python3

import shutil, os

source_dir = input("Enter the directory path: ")

if not os.path.isdir(source_dir):
   print(f"{source_dir} is not a valid directory! Please, try again.")
   print("Exiting...")
   exit()

files = [f for f in os.listdir(source_dir) if os.path.isfile(f)]

if len(files) == 0:
    print("There's no file in the director, " + source_dir + "! Please, try again.")
    print("Exiting...")
    exit()

print("Here are the first 5 files in the directory you provided:")

for i, f in enumerate(files[:5]):
    #print(f"{i + 1}:  f")
    print(str(i + 1) + ": " + f)

print("Enter the indices of the files that you would like to copy")
choices = input("Please, separate your choices with spaces: ").strip().split()
choices = [int(i) for i in choices if int(i) <= len(files)]
dest_dir = input("Enter the path of the directory to copy the selected files to: ")

# Re-attempt to get a valid destination directory path from the user
# Exit if unsuccessful after 3 re-attempts
i = 3
while not os.path.isdir(dest_dir) and i > 0:
    print(f"{dest_dir} is not a valid directory")
    dest_dir = input("Please, enter a valid directory to copy the files to: ")

if not os.path.isdir(dest_dir):
    print("You still did not enter a valid directory path")
    print("Exiting...")
    exit()

for idx in choices:
    source_path = os.path.join(source_dir, files[idx - 1])
    shutil.copy(source_path, dest_dir)

print(f"The selected files have been copied to {dest_dir}")


