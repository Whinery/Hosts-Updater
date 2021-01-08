#!/bin/bash

# Thanks to Dan Pollock for supplying and maintaining all the data at https://someonewhocares.org/hosts/ipv6/hosts

if (sudo -vn && sudo -ln) 2>&1; then
	file1=/etc/hosts                                                          # set file name for /etc/hosts
	file2=/etc/hosts.bak                                                      # set file name for /etc/hosts.bak

	if [ ! -f "$file2" ]; then                                                # test if /etc/hosts.bak exist
		cp "$file1" "$file2"                                              # copy /etc/hosts to /etc/hosts.bak if absent
	fi

	cp hosts-updater.service /lib/systemd/system/
	cp hosts-updater.timer /lib/systemd/system/
	sudo systemctl enable hosts-updater.timer
	sudo systemctl start hosts-updater.timer
	cp hosts-updater.sh /usr/local/bin/
	chmod +x /usr/local/bin/hosts-updater.sh
	/usr/local/bin/hosts-updater.sh
else
	echo "Permission Denied --> sudo ./install.sh <-- Required"
fi
