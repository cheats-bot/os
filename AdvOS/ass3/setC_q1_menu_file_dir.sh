#!/bin/bash
# Set C - Q1
# Menu driven shell script for file and directory management operations:
# a] Display Current Directory
# b] List Directory
# c] Make Directory
# d] Change Directory
# e] Copy A File

echo "========================================="
echo "   File & Directory Management Menu      "
echo "========================================="

while true
do
    echo ""
    echo "--------- MENU ---------"
    echo "  a) Display Current Directory"
    echo "  b) List Directory"
    echo "  c) Make Directory"
    echo "  d) Change Directory"
    echo "  e) Copy A File"
    echo "  q) Quit"
    echo "------------------------"
    echo -n "Enter your choice: "
    read choice

    case "$choice" in

        a|A)
            echo ""
            echo "Current Directory:"
            pwd
            ;;

        b|B)
            echo ""
            echo -n "Enter directory path to list (press Enter for current): "
            read dirpath
            if [ -z "$dirpath" ]; then
                dirpath="."
            fi
            if [ -d "$dirpath" ]; then
                echo ""
                echo "Contents of '$dirpath':"
                ls -la "$dirpath"
            else
                echo "Error: '$dirpath' is not a valid directory."
            fi
            ;;

        c|C)
            echo ""
            echo -n "Enter name of new directory to create: "
            read newdir
            if [ -z "$newdir" ]; then
                echo "Error: No directory name provided."
            elif [ -e "$newdir" ]; then
                echo "Error: '$newdir' already exists."
            else
                mkdir "$newdir"
                echo "Directory '$newdir' created successfully."
            fi
            ;;

        d|D)
            echo ""
            echo -n "Enter directory name to change to: "
            read destdir
            if [ -z "$destdir" ]; then
                echo "Error: No directory name provided."
            elif [ ! -d "$destdir" ]; then
                echo "Error: '$destdir' does not exist or is not a directory."
            else
                cd "$destdir"
                echo "Changed to directory: $(pwd)"
            fi
            ;;

        e|E)
            echo ""
            echo -n "Enter source file name: "
            read srcfile
            if [ -z "$srcfile" ]; then
                echo "Error: No source file provided."
            elif [ ! -f "$srcfile" ]; then
                echo "Error: Source file '$srcfile' does not exist."
            else
                echo -n "Enter destination file/directory: "
                read destfile
                if [ -z "$destfile" ]; then
                    echo "Error: No destination provided."
                else
                    cp "$srcfile" "$destfile"
                    if [ $? -eq 0 ]; then
                        echo "File '$srcfile' copied to '$destfile' successfully."
                    else
                        echo "Error: Copy operation failed."
                    fi
                fi
            fi
            ;;

        q|Q)
            echo ""
            echo "Exiting. Goodbye!"
            echo "========================================="
            exit 0
            ;;

        *)
            echo "Invalid choice. Please enter a, b, c, d, e, or q."
            ;;
    esac
done
