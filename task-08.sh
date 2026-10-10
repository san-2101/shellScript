# Example of for loop
<<comment
syntax 
	while [ condition ]; do
		body of loop
	done
comment

#!/bin/bash
i=0
while [ $i -le 10 ]; do
	echo "this is the iteration $i"
	i=$((i+1))
done
