#!/bin/bash
# Set B - Q1
# Shell script to accept a file name and print if it is a file or directory
# and print its permissions

echo "========================================="
echo "       File / Directory Info Script       "
echo "========================================="
echo ""
echo -n "Enter the file or directory name: "
read filename

# Check if input is empty
if [ -z "$filename" ]; then
    echo "Error: No name provided."
    exit 1
fi

# Check if the path exists
if [ ! -e "$filename" ]; then
    echo "Error: '$filename' does not exist."
    exit 1
fi

echo ""
echo "-----------------------------------------"

# Check type
if [ -f "$filename" ]; then
    echo "  Type        : Regular File"
elif [ -d "$filename" ]; then
    echo "  Type        : Directory"
elif [ -l "$filename" ]; then
    echo "  Type        : Symbolic Link"
else
    echo "  Type        : Special File"
fi

# Permission checks
echo ""
echo "  --- Permission Details ---"

if [ -r "$filename" ]; then
    echo "  Read        : YES"
else
    echo "  Read        : NO"
fi

if [ -w "$filename" ]; then
    echo "  Write       : YES"
else
    echo "  Write       : NO"
fi

if [ -x "$filename" ]; then
    echo "  Execute     : YES"
else
    echo "  Execute     : NO"
fi

# Show symbolic permission string using ls
perm=`ls -ld "$filename" | awk '{print $1}'`
owner=`ls -ld "$filename" | awk '{print $3}'`
group=`ls -ld "$filename" | awk '{print $4}'`

echo ""
echo "  Permission  : $perm"
echo "  Owner       : $owner"
echo "  Group       : $group"
echo "-----------------------------------------"
