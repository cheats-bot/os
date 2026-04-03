#!/bin/bash
# Set A - Q3
# Shell script that counts words, characters, and lines in a file

echo "========================================="
echo "     File Word/Character/Line Counter     "
echo "========================================="
echo ""
echo -n "Enter the filename: "
read filename

# Check if filename was provided
if [ -z "$filename" ]; then
    echo "Error: No filename provided."
    exit 1
fi

# Check if file exists
if [ ! -e "$filename" ]; then
    echo "Error: File '$filename' does not exist."
    exit 1
fi

# Check if it is a regular file
if [ ! -f "$filename" ]; then
    echo "Error: '$filename' is not a regular file."
    exit 1
fi

# Count lines, words, characters using wc
lines=`wc -l < "$filename"`
words=`wc -w < "$filename"`
chars=`wc -c < "$filename"`

echo ""
echo "-----------------------------------------"
echo "  File Name  : $filename"
echo "-----------------------------------------"
printf "  %-15s : %d\n" "Lines" $lines
printf "  %-15s : %d\n" "Words" $words
printf "  %-15s : %d\n" "Characters" $chars
echo "-----------------------------------------"
