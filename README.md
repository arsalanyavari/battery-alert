# battery-alert
This is a funny battery alert for linux distributions that works by notify-send.

For using this project first you must clone it, then run `make` or `make setup` command :) 
All files are in `~/.battery-alert` directory so if you want changing the icons for example, you can find them in `~/.battery-alert/icon` path.
Also if you want change the alerts sentences you can edit `check-battery.sh` before running make command.

The icons I chose include the following images:
<br />
<img src="https://github.com/arsalanyavari/battery-alert/blob/main/.i/death-c.png" width="100" height="100"/>
<img src="https://github.com/arsalanyavari/battery-alert/blob/main/.i/low-c.png" width="100" height="100"/>
<img src="https://github.com/arsalanyavari/battery-alert/blob/main/.i/empty-c.png" width="100" height="100"/>

In my system it is like this:<br />
<img src="https://github.com/arsalanyavari/battery-alert/blob/main/.i/death.png" width="200" height="200"/>
<img src="https://github.com/arsalanyavari/battery-alert/blob/main/.i/low.png" width="200" height="200"/>
<img src="https://github.com/arsalanyavari/battery-alert/blob/main/.i/empty.png" width="200" height="200"/>

For the script to work properly, your system needs to be able to execute the hibernate command...
ِYour system will be hibernate if has less than 5% battery
