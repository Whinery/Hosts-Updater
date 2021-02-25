#!/bin/bash

# Thanks to Dan Pollock for supplying and maintaining all the data at https://someonewhocares.org/hosts/ipv6/hosts

### *** ONLY REMOVE the "#" symbol from the BEGINNING of one of the 4 LINES BELOW! *** ###
          ### *** 0.0.0.0 version usually faster than 127.0.0.1 version *** ###

file0=/tmp/hostss                                                         # set file name for /tmp/hostss
file1=/etc/hosts                                                          # set file name for /etc/hosts

curl https://someonewhocares.org/hosts/ipv6zero/hosts/ -s -o "$file0"     # Both ipv4 and ipv6 -> 0.0.0.0 version
# curl https://someonewhocares.org/hosts/zero/hosts -s -o "$file0"        # ipv4 -> 0.0.0.0 version
# curl https://someonewhocares.org/hosts/ipv6/hosts -s -o "$file0"        # Both ipv4 and ipv6 -> 127.0.0.1 version
# curl https://someonewhocares.org/hosts/hosts -s -o "$file0"             # ipv4 -> 127.0.0.1 -> 127.0.0.1 version

sleep 5
minimumsize=400000                                                        # set minimum file size in bytes
actualsize=$(wc -c <"$file0")                                             # check actual size of hostss file
if [ $actualsize -ge $minimumsize ]; then
	rm -f "$file1"                                                    # remove /etc/hosts file
	cat "$file0" >> "$file1"                                          # Append hostss to hosts
	chmod =444 "$file1"                                               # Attributes "read" for owner/group/others
	rm -f "$file0"                                                    # Deleting the file /tmp/hostss
else
	rm -f "$file0"                                                    # Deleting the file /tmp/hostss
fi
