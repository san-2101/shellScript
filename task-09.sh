#!/bin/bash
#this script is used for check the status of your local machine using function
<<comment
Ye command free -h se RAM ki information leta hai, | se output ko awk tak bhejta hai, aur NR==2 second line select karta hai, jahan $7 available RAM ko extract karke Available memory: 10Gi jaise output mein print karta hai.
comment

check_memory(){
	free -h | awk 'NR==2 {print "Available memory: "$7}'
}
check_memory

check_storage() {
    df -h / | awk 'NR==2 {print "Available disk: " $4}'
}


check_storage
<<comment
Ye command df -h / se root directory (/) ki disk space information human-readable format mein leta hai, | output ko awk tak bhejta hai, aur NR==2 second line select karke $4 yani available disk space ko Available disk: 20G jaise format mein print karta hai.
comment


top_process() {
    ps aux --sort=-%mem | awk 'NR==2 {print "Top memory process: user="$1" pid="$2" mem%="$4}'
}

top_process

<<comment
Ye command ps aux se running processes ki list nikalta hai, --sort=-%mem unhe highest memory usage se lowest tak sort karta hai, aur awk 'NR==2' header ke baad second line yani sabse zyada memory use karne wale process ko select karke $1 se user, $2 se PID aur $4 se memory usage percentage print karta hai.
comment

