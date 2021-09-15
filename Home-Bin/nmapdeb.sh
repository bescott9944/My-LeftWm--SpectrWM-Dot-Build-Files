#!/bin/bash

echo Searching Debbys Network
sleep 3
echo Enter Password:
sleep 2
sudo nmap -sT -O 192.168.0.1/24
exit 0
