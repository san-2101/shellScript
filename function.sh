# Example of functions in shell Script

#!/bin/bash
function create_user(){
	read -p "Enter the username: " var
	sudo useradd $var

}
# above is the definition of the function create_user and below is the decalration or call of function

#create_user

# Second function to verify the user is created or not

function verify_user(){
	if [ $(getent passwd $var) ] ; then
		echo "User verified"
	else
		echo "User not found"
	fi
}

#verify_user

#
