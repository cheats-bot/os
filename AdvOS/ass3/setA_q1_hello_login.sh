#!/bin/bash
# Set A - Q1
# Shell script to accept name from the user and say hello.
# To run on login: add the following line to ~/.bash_profile
#   source /path/to/setA_q1_hello_login.sh

echo "========================================="
echo "       Welcome Login Greeting Script      "
echo "========================================="
echo ""
echo -n "Enter your name: "
read name

if [ -z "$name" ]; then
    echo "No name entered. Hello, Guest!"
else
    echo ""
    echo "Hello, $name! Welcome to the system."
    echo "Today's date and time: $(date)"
    echo "Current working directory: $(pwd)"
    echo "Logged in as: $(whoami)"
fi

echo "========================================="
