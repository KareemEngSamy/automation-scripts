#!/bin/bash
# A simple bash script to move up to desired directory level directly

function jump() { 
    # Save the original Internal Field Separator
    OLDIFS=$IFS

    # Set the field separator to "/"
    IFS=/

    # Split the current working directory into an array of directories
    # For example, /home/kareem/projects/backend/api/src becomes [, home, kareem, projects, backend, api, src]
    path_arr=($PWD)

    # Restore Internal Field Separator to its original value
    IFS=$OLDIFS

    local pos=-1

    # Loop over each directory in the path array
    # ${path_arr[@]} expands all elements in path_arr
    for dir in "${path_arr[@]}"; do
        # Increment position counter to find the target directory
        pos=$[$pos+1]

        # Check if the current directory matches the target directory
        if [ "$1" = "$dir" ]; then
            # Get the total number of directories in the path
            dir_in_path=${#path_arr[@]}

            # Start from the current working directory
            cwd=$PWD

            # Calculate how many levels to move up to reach the target directory
            limit=$[$dir_in_path-$pos-1]

            # Move up the directory tree step by step
            for ((i=0; i<limit; i++)); do
                cwd=$cwd/..
            done

            # Change to the target directory
            cd $cwd
            break
        fi
    done
}
