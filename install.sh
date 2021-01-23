#!/bin/bash

# Thanks to Dan Pollock for supplying and maintaining all the data at https://someonewhocares.org/hosts/ipv6/hosts

file1=/etc/hosts                                                          # set file name for /etc/hosts
file2=/etc/hosts.bak                                                      # set file name for /etc/hosts.bak

if [[ $EUID -ne 0 ]]; then
	echo " "
	echo "Permission Denied --> sudo ./install.sh <-- Required"       # display echo message
	echo " "
else
	if [ ! -f "$file2" ]; then                                        # test if /etc/hosts.bak exist
		cp "$file1" "$file2"                                      # copy /etc/hosts to /etc/hosts.bak if absent
	fi
	cp hosts-updater.service /lib/systemd/system/                     # copy file hosts-updater.service
	cp hosts-updater.timer /lib/systemd/system/                       # copy file hosts-updater.timer
	systemctl enable hosts-updater.timer                              # enable systemctl timer
	systemctl start hosts-updater.timer                               # start systemctl timer
	cp hosts-updater.sh /usr/local/bin/                               # copy file hosts-updater.sh
	chmod +x /usr/local/bin/hosts-updater.sh                          # let this file run as a program
	/usr/local/bin/hosts-updater.sh                                   # run program hosts-updater.sh
	echo " "
	echo "Please reboot for changes to take effect!"                  # display echo message
	echo " "
fi
