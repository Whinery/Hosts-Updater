#!/bin/bash

# Thanks to Dan Pollock for supplying and maintaining all the data at https://someonewhocares.org/hosts/ipv6/hosts

file1=/etc/hosts                                                          # set file name for /etc/hosts
file2=/etc/hosts.bak                                                      # set file name for /etc/hosts.bak

if [[ $EUID -ne 0 ]]; then
	echo
	echo "Permission Denied --> sudo ./uninstall.sh <-- Required"     # display echo message 
	echo
else
	if [ -e "$file2" ]; then                                          # test for file hosts.bak
		rm -f "$file1"                                            # delete file hosts
		cp "$file2" "$file1"                                      # copy file hosts.bak to hosts
	fi
	systemctl disable hosts-updater.timer                             # disable systemctl timer
	rm -f /lib/systemd/system/hosts-updater.service                   # remove file hosts-updater.service
	rm -f /lib/systemd/system/hosts-updater.timer                     # remove file hosts-updater.timer
	rm -f /usr/local/bin/hosts-updater.sh                             # remove file hosts-updater.sh
	echo " "
	echo "Please reboot for changes to take effect!"                  # display echo message
	echo " "
fi
