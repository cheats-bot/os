#!/bin/bash
# Set B - Q2
# Shell script to accept a number from the command prompt
# and compute the sum of digits in the number

echo "========================================="
echo "           Sum of Digits                 "
echo "========================================="
echo ""
echo -n "Enter a positive number: "
read n

# Validate input
if [ -z "$n" ]; then
    echo "Error: No number entered."
    exit 1
fi

if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid non-negative integer."
    exit 1
fi

original=$n
sum=0

while [ $n -gt 0 ]
do
    rem=`expr $n % 10`
    n=`expr $n / 10`
    sum=`expr $sum + $rem`
done

echo ""
echo "  Number          : $original"
echo "  Sum of Digits   : $sum"
echo "========================================="
