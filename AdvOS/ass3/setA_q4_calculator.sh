#!/bin/bash
# Set A - Q4
# Shell script that acts as a simple calculator (+, -, *, /)

echo "========================================="
echo "           Simple Calculator             "
echo "========================================="

while true
do
    echo ""
    echo -n "Enter first number  : "
    read num1

    echo -n "Enter operator (+,-,*,/) or 'q' to quit: "
    read op

    if [ "$op" = "q" ] || [ "$op" = "Q" ]; then
        echo "Exiting calculator. Goodbye!"
        break
    fi

    echo -n "Enter second number : "
    read num2

    # Validate numbers
    if ! [[ "$num1" =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Invalid number(s) entered. Please try again."
        continue
    fi

    case "$op" in
        +)
            result=`echo "$num1 + $num2" | bc`
            echo ""
            echo "  $num1 + $num2 = $result"
            ;;
        -)
            result=`echo "$num1 - $num2" | bc`
            echo ""
            echo "  $num1 - $num2 = $result"
            ;;
        \*)
            result=`echo "$num1 * $num2" | bc`
            echo ""
            echo "  $num1 * $num2 = $result"
            ;;
        /)
            if [ "$num2" = "0" ]; then
                echo "Error: Division by zero is not allowed."
            else
                result=`echo "scale=4; $num1 / $num2" | bc`
                echo ""
                echo "  $num1 / $num2 = $result"
            fi
            ;;
        *)
            echo "Error: Invalid operator '$op'. Please use +, -, *, or /."
            ;;
    esac
    echo "-----------------------------------------"
done

echo "========================================="
