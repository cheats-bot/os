#!/bin/bash
# Set A - Q2
# Shell script to find the factorial of a positive non-zero number

echo "========================================="
echo "          Factorial Calculator            "
echo "========================================="
echo ""
echo -n "Enter a positive non-zero number: "
read n

# Validate input
if [ -z "$n" ]; then
    echo "Error: No input provided."
    exit 1
fi

if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid positive integer."
    exit 1
fi

if [ "$n" -le 0 ]; then
    echo "Error: Number must be positive and non-zero."
    exit 1
fi

# Calculate factorial
fact=1
i=1
while [ $i -le $n ]
do
    fact=`expr $fact \* $i`
    i=`expr $i + 1`
done

echo ""
echo "Factorial of $n = $fact"
echo "========================================="
