#!/bin/sh
# Exercise: Identify the IP address of the DNS that responds to the following url: slash16.org

nslookup slash16.org |
awk '{
		if ($1 == "Server:") {printf "%s         %s\n", $1, $2}
		else if ($1 == "Name:") {printf "%s   %s\n", $1, $2; getline;
									printf "%s %s\n", $1, $2}
		else {print $0}
	 }'
