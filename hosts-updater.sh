#!/bin/bash

# Thanks to Steven Black for supplying and maintaining all the data at https://github.com/StevenBlack/hosts
# Thanks to Dan Pollock for supplying and maintaining all the data at https://someonewhocares.org/hosts/ipv6/hosts

### *** ONLY REMOVE the "#" symbol from the BEGINNING of one of the 5 LINES BELOW! *** ###

file0=/tmp/hostss                                                         # set file name for /tmp/hostss
file1=/etc/hosts                                                          # set file name for /etc/hosts
file2=/etc/hosts.bak                                                      # set file name for /etc/hosts.bak

curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -s -o "$file0"    && minimumsize=4000000       # adware + malware
# curl https://someonewhocares.org/hosts/ipv6zero/hosts/ -s -o "$file0"			&& minimumsize=400000        # Both ipv4 and ipv6 -> 0.0.0.0 version
# curl https://someonewhocares.org/hosts/zero/hosts -s -o "$file0"			&& minimumsize=400000        # ipv4 -> 0.0.0.0 version
# curl https://someonewhocares.org/hosts/ipv6/hosts -s -o "$file0"			&& minimumsize=400000        # Both ipv4 and ipv6 -> 127.0.0.1 version
# curl https://someonewhocares.org/hosts/hosts -s -o "$file0"				&& minimumsize=400000        # ipv4 -> 127.0.0.1 -> 127.0.0.1 version

sleep 5
actualsize=$(wc -c <"$file0")                                             # check actual size of hostss file
if [ $actualsize -ge $minimumsize ]; then
	rm -f "$file1"                                                    # remove /etc/hosts file
	cat "$file0" >> "$file1"                                          # Append hostss to hosts
	cat "$file2" >> "$file1"                                          # Append hosts.bak to hosts
	chmod =444 "$file1"                                               # Attributes "read" for owner/group/others
	rm -f "$file0"                                                    # Deleting the file /tmp/hostss
else
	rm -f "$file0"                                                    # Deleting the file /tmp/hostss
fi
