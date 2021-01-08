#!/bin/bash

# Thanks to Dan Pollock for supplying and maintaining all the data at https://someonewhocares.org/hosts/ipv6/hosts

file1=/etc/hosts                                                          # set file name for /etc/hosts
file2=/etc/hosts.bak                                                      # set file name for /etc/hosts.bak

if (sudo -vn && sudo -ln) 2>&1; then
	if [ -e "$file2" ]; then
		rm -f "$file1"
		cp "$file2" "$file1"
		sudo systemctl disable hosts-updater.timer
		rm -f /lib/systemd/system/hosts-updater.service
		rm -f /lib/systemd/system/hosts-updater.timer
		rm -f /usr/local/bin/hosts-updater.sh
		echo " "
		echo "Please reboot for changes to take effect!"
		echo " "
	fi
else
	echo "Permission Denied --> sudo ./uninstall.sh <-- Required"
fi

