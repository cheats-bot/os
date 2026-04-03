#!/bin/bash
# Set C - Q2
# Menu driven shell script:
# 1. Print Asterisks (Stars Per Line)
# 2. Delete Some Files

echo "========================================="
echo "       Stars & File Deletion Menu         "
echo "========================================="

while true
do
    echo ""
    echo "--------- MENU ---------"
    echo "  1) Print Asterisks (Stars Per Line)"
    echo "  2) Delete Some Files"
    echo "  3) Exit"
    echo "------------------------"
    echo -n "Enter your choice [1-3]: "
    read choice

    case "$choice" in

        1)
            echo ""
            echo -n "Enter number of lines: "
            read lines

            if ! [[ "$lines" =~ ^[0-9]+$ ]] || [ "$lines" -le 0 ]; then
                echo "Error: Please enter a valid positive integer."
                continue
            fi

            echo ""
            echo "--- Asterisk Pattern ---"
            for (( i=1; i<=lines; i++ ))
            do
                # Print i stars on line i
                for (( j=1; j<=i; j++ ))
                do
                    echo -n "* "
                done
                echo ""
            done
            echo "------------------------"
            ;;

        2)
            echo ""
            echo "Files in current directory:"
            ls -1
            echo ""
            echo -n "Enter filename(s) to delete (space separated): "
            read -a filelist

            if [ ${#filelist[@]} -eq 0 ]; then
                echo "No filenames provided."
                continue
            fi

            for fname in "${filelist[@]}"
            do
                if [ -z "$fname" ]; then
                    continue
                fi

                if [ ! -e "$fname" ]; then
                    echo "  '$fname' : Does not exist. Skipping."
                else
                    echo -n "  Confirm delete '$fname'? [y/n]: "
                    read confirm
                    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                        rm "$fname"
                        echo "  '$fname' deleted."
                    else
                        echo "  '$fname' skipped."
                    fi
                fi
            done
            ;;

        3)
            echo ""
            echo "Exiting. Goodbye!"
            echo "========================================="
            exit 0
            ;;

        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done
