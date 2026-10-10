#Example of for Loop
#!/bin/bash
#understand the basic structure of for loo
#Syntax is for i in <range>; do
#	body of the loop
#done

for i in 1 2 3 4 5; do
	echo "$i"
done

# second example is for range


for i in {1..10}; do
	echo "the value of i = : $i"
done

# third example is to create table of any number during run time
 read -p "Enter any integer : " var
 echo "Table of $var"
for i in {1..10}; do
	echo "$var*$i= $(($var*$i))"
done



# for creating directory using for loop

for i in {1..2}; do
	mkdir -p /home/sandeep/shellScript/day-$i
done
echo "Directory created"

#for creating file and give the permission 764 to the file

for i in {1..10}; do
	touch /home/sandeep/shellScript/day-1/file-$i.txt
	chmod 764 /home/sandeep/shellScript/day-1/file-$i.txt
done
echo "file created with 764 permissions"
