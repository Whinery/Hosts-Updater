# Hosts-Updater
Update hosts file to help prevent ads and malware on Linux computers.
Works with Arch, Manjaro, Debian systems and more.
The script will only replace the /etc/hosts file if the tmp file meets all conditions so it dosen't break your hosts file if something goes wrong.
Always make a one time backup of '/etc/hosts' before you start.
Will update itself after midnight every night or when the computer is turn on any time after midnight.

'wget' is required from the Add/Remove Software if not already on your system.

Copy files 'hosts-updater.service' and 'hosts-updater.timer' to '/lib/systemd/system/'

Open 'hosts-updater.sh' and read the comments for more important information.

Copy file 'hosts-updater.sh' to '/usr/local/bin/'

From the 'terminal window' enter
'systemctl enable hosts-updater.timer'
then enter
'sudo /usr/local/bin/hosts-updater.sh'

If no errors reboot your computer for systemd to control 'hosts' updates.
