# Hosts-Updater.sh

Updates hosts file to help prevent ads and malware on Linux computers automatically.
Works with Arch / Arch Base / Debian / Debian Base OS and more.

NOTE: Debian / Debian base users WILL have to install 'curl' first.

NOTE: When first installed a one time backup of '/etc/hosts' will be created and saved as '/etc/hosts.bak' automatically.

NOTE: Open 'hosts-updater.sh' and read the comments for more important information.

The script will only replace the /etc/hosts file if the tmp file meets all conditions so it dosen't break your hosts file
if something goes wrong.

Will update itself 10 minutes after boot and every 24 hours after that.

INSTALL:   Unzip file and cd into the directory folder and run.
	'sudo ./install.sh'

UNINSTALL: cd into the directory folder and run.
	'sudo ./uninstall.sh'
