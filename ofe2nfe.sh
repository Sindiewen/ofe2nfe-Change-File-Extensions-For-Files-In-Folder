#!/bin/bash

# Takes every file from the directory, renames each of the .text files to .txt
# program only takes in 2 parameters
if [ $# -eq 2 ];
then
    # Gets the length of the string for the first param
    let strLen=$(echo -n $1 | wc -m)
    
    # To store the total number of files changed
    let numFiles=0

    for file in *;
    do 
        if [[ ${file: -$strLen} = $1 ]];
        then
            # Gets the file name without extention
            filename=$(basename -- "$file")
            filename="${filename%.*}"

            # Appending the new file extention to the file name
            newfilename="$filename$2"
            
            # Changing the file extention
            mv "$file" "$newfilename"
            printf "$file -> $newfilename\n"

            # Iterate num files
            numFiles=$((numFiles+1))
        fi
    done

    printf "$numFiles files changed.\n"
else
    printf "Illegal parameters entered. This program requires\n"
    printf "2 string parameters: first = to, second = from.\n"
    printf "Example: ./ofe2nfe .old .new\n\n"
    printf "Closing...\n"
fi

