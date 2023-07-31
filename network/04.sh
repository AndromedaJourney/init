#!/bin/sh
# Exercise: Identifiy the default gateway in the routing table

netstat -rn | head -n 10 | grep Gateway | 
awk '{printf "%-17s %-17s %-17s %-17s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, $6, $7}' && 
netstat -rn | head -n 10 | grep default | 
awk '{printf "%-17s %-17s %-17s %-17s %3s %12s %s\n", $1, $2, $3, $4, $5, $6, $7}'
