#Exampel of if else statement

#!/bin/bash


#var1=10;
read -p "Enter any Integer :" var

if [ "$var" -lt 10 ]; then
	echo "Number is less than ten"

else
	echo "Number is greater than 10"
fi

#-----second example-----

read -p "enter the file path:" filepath

if [ -f $filepath ]; then
	echo "File exists"
else
	echo "File doen't exists"
fi
