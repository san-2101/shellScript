# This is the example of argument in the shell script
# agrument is used when we want to take in vule during run time but not using read variable
<<comment
this is multi line comments 
usage of arguments ./argument.sh abc xyz

comment

#!/bin/bash

echo "the first argument is $0"
echo "the second argument is $1"
echo "the third argument is $2"


echo "total argument is $#"  # where $# is used for number count
