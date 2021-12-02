#!/bin/bash

##The command i use. 
# upower -i /org/freedesktop/UPower/devices/battery_BAT0

present=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep present | cut -d " " -f 18`
state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | cut -d " " -f 20`
percentage=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d " " -f 15`
time_to_empty=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep time | cut -d " " -f 14`
warning_level=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep level | cut -d " " -f 12`

if [[ $present == "yes" ]]
then
	if [[ $state == "discharging" ]]
	then
		if [[ $percentage < 20 && $percentage > 10 ]]
		then
			notify-send "داداش باطریم داره ته میکشه لطف کن ی همتی کن بزنم به شارژ؛ ذمت گرم جبران میکنم :)" -u low -t 20000 -i ~/.battery-allert/Pictures/icon/low.png
		elif [[ $percentage < 11 && $percentage > 5 ]]
		then
			notify-send "ناموصا شارژ ندارم؛ ن اینکه نخواما، بخوامم نمیتونم بیشتر از این دووم بیارم" -u critical -t 20000 -i ~/.battery-allert/Pictures/icon/empty.png
		elif [[ $percentage == "5%" ]]
		then
			notify-send "رحم الله من یقرا فاتحه مع الصلوات" -u normal -t 100000 -i /home/arya/.battery-allert/Pictures/icon/death.png
		elif [[ $percentage < 5 ]]
		then
			if [[ `which hibernate 2>/dev/null` ]]
			then
				hibernate
			else
				poweroff
			fi
		fi
	fi
fi
