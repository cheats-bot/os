#!/bin/bash
# Set B - Q3
# Shell script to create 5 directories and create a file called 'dummy'
# in each. Directory names are read from an input file.

echo "========================================="
echo "    Directory & Dummy File Creator        "
echo "========================================="
echo ""

INPUT_FILE="dir_names.txt"

# Check if input file exists; if not, create a sample one
if [ ! -f "$INPUT_FILE" ]; then
    echo "Input file '$INPUT_FILE' not found."
    echo "Creating a sample '$INPUT_FILE' with 5 directory names..."
    cat > "$INPUT_FILE" <<EOF
dir_alpha
dir_beta
dir_gamma
dir_delta
dir_epsilon
EOF
    echo "Sample '$INPUT_FILE' created. You may edit it and re-run the script."
    echo ""
fi

# Count lines in input file
line_count=`wc -l < "$INPUT_FILE"`

if [ "$line_count" -lt 5 ]; then
    echo "Error: '$INPUT_FILE' must contain at least 5 directory names (one per line)."
    exit 1
fi

echo "Reading directory names from '$INPUT_FILE'..."
echo ""

count=0
while IFS= read -r dirname && [ $count -lt 5 ]
do
    # Skip empty lines
    if [ -z "$dirname" ]; then
        continue
    fi

    count=`expr $count + 1`

    # Create directory if it doesn't exist
    if [ -d "$dirname" ]; then
        echo "  [$count] Directory '$dirname' already exists."
    else
        mkdir "$dirname"
        echo "  [$count] Created directory: '$dirname'"
    fi

    # Create 'dummy' file inside the directory
    touch "$dirname/dummy"
    echo "       Created file: '$dirname/dummy'"

done < "$INPUT_FILE"

echo ""
echo "-----------------------------------------"
echo "  Done! Created $count directories, each containing 'dummy' file."
echo "-----------------------------------------"

# List result
echo ""
echo "Listing created structure:"
for dir in $(head -5 "$INPUT_FILE"); do
    if [ -n "$dir" ]; then
        echo "  $dir/"
        ls -1 "$dir/"
    fi
done

echo "========================================="
