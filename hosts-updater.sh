#!/bin/bash

# Thanks to Dan Pollock for supplying and maintaining all the data at https://someonewhocares.org/hosts/ipv6/hosts

# wget is required from Add/Remove Software if not already installed

# Place this file in '/usr/local/bin/' directory and make executable (chmod =755)

### *** ONLY REMOVE the "#" symbol from the BEGINNING of one of the 2 LINES BELOW! *** ###

sleep 20
wget -q --output-document=/etc/hostss https://someonewhocares.org/hosts/ipv6/hosts  # Both ipv4 and ipv6
# wget -q --output-document=/etc/hostss https://someonewhocares.org/hosts/hosts     # ipv4

file=/etc/hostss                                                          # set file name for tmp file
minimumsize=400000                                                        # set minimum file size in bytes
actualsize=$(wc -c <"$file")                                              # check actual size of hostss file
if [ $actualsize -ge $minimumsize ]
then
	rm -f /etc/hosts                                                  # remove /etc/hosts file
	echo 127.0.1.1 "$HOSTNAME" >> /etc/hosts                          # Create and add the first line to /etc/hosts
	cat /etc/hostss >> /etc/hosts                                     # Append hostss to hosts
	chmod =444 /etc/hosts                                             # Attributes "read" for owner/group/others
	rm -f /etc/hostss                                                 # Deleting the file /etc/hostss
else
	rm -f /etc/hostss                                                 # Deleting the file /etc/hostss
fi
