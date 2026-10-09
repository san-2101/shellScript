#Exampel of if else statement

#!/bin/bash


#var1=10;
read -p "Enter any Integer :" var

if [ "$var" -lt 10 ]; then
	echo "Number is less than ten"

else
	echo "Number is greater than 10"
fi
