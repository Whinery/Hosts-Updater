# Hosts-Updater

Update hosts file to help prevent ads and malware on Linux computers automatically.
Works with Arch, Garuda, Manjaro, Debian systems and more.

*** When first run a one time backup of '/etc/hosts' will be created and saved as '/etc/hosts.bak'. ***

The script will only replace the /etc/hosts file if the tmp file meets all conditions so it dosen't break your hosts file if something goes wrong.
Will update itself after midnight every night or when the computer is turn on any time after midnight.

Copy files 'hosts-updater.service' and 'hosts-updater.timer' to '/lib/systemd/system/'

Open 'hosts-updater.sh' and read the comments for more important information.

Copy file 'hosts-updater.sh' to '/usr/local/bin/'

From the 'terminal window' enter
'systemctl enable hosts-updater.timer'

then

'sudo /usr/local/bin/hosts-updater.sh'

If no errors reboot your computer for systemd to control 'hosts' updates.

NOTE: Debian users may have to install 'curl'.
