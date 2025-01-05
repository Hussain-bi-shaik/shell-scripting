#!/bin/bash
echo "all variables passsed : $@"
echo "number of vairables : $#"
echo "script name : $0"
echo "present working directory : $PWD"
echo "home directory of current user : $home"
echo "which user id running the script : $USER"
echo "proceess id of current script : $$"
sleep 60 &
echo "process id of last command in background is $!"