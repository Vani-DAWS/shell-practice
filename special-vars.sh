#!/bin/bash
echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "First argument : $1"
echo $2
echo "current working directory of script : $PWD"
echo "home directory of user: $HOME"
echo "user runing the script: $USER"
echo "PID of current script: $$"
sleep 10 &
echo "PID of last command run in background: $!"
