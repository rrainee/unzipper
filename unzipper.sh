#!/bin/bash

# $1 = directory to unzip
# $2 = name of target directory

# missing $1
if [ -z "$1" ]; then
    echo "Please provide a directory to unzip."
    exit 1
fi

# $1 is invalid
if [ ! -d "$1" ]; then
    echo "Please provide a valid directory to unzip."
    exit 1
fi

# missing $2
if [ -z "$2" ]; then
    echo "Please provide a name for the new directory."
    exit 1
fi

# not an existing dir, creates it
if [ ! -d "$2" ]; then
    mkdir "$2"
fi



# unzip all zip files and move them to the new directory
for file in $1/**/*.zip; do
    echo $file
    if [[ $file =~ ([^/]+)\.zip$ ]]; then
        filename="${BASH_REMATCH[1]}"

        target_folder=$(echo $filename | tr '[:upper:]' '[:lower:]')
        if [[ ! -d $2/$target_folder ]]; then
          mkdir $2/$target_folder
        fi
        unzip -q "$file" -d "$2/$target_folder"

    else
        echo 'Not found'

    fi
    
done

