SHELL = bash

.DEFAULT_GOAL := setup

.PHONY : setup clean

os = $(shell cat /etc/os-release | grep ^ID= | cut --complement -d "=" -f 1)

ifeq ($(os),fedora)
INSTALLER = sudo yum install -y	
endif

ifeq ($(os),centos)
INSTALLER = sudo yum install -y
endif

ifeq ($(os),arch)
INSTALLER = sudo pacman -Sy
endif

ifeq ($(os),manjaro)
INSTALLER = sudo pacman -Sy
endif

ifeq ($(os),arco)
INSTALLER = sudo pacman -Sy
endif

ifeq ($(os),debian)
INSTALLER = sudo apt-get install -y	
endif

ifeq ($(os),ubuntu)
INSTALLER = sudo apt-get install -y
endif

ifeq ($(os),lubuntu)
INSTALLER = sudo apt-get install -y
endif

ifeq ($(os),kubuntu)
INSTALLER = sudo apt-get install -y
endif

ifeq ($(os),xubuntu)
INSTALLER = sudo apt-get install -y
endif

ifeq ($(os),kali)
INSTALLER = sudo apt-get install -y
endif

ifeq ($(os),alpine)
INSTALLER = sudo apk add	
endif

## dependencies
upower_exist = $(shell command -v upower)

ifeq (,$(upower_exist))
ifdef INSTALLER
	@$(INSTALLER) upower
else
	@echo "Please install upower package"
endif
endif

notify-send_exist = $(shell command -v notify-send)

ifeq (,$(notify-send_exist))
ifdef INSTALLER
	@$(INSTALLER) libnotify-bin 2>/dev/null
	@$(INSTALLER) libnotify 2>/dev/null
else
	@echo "Please install libnotify package"
endif
endif

## start makefile functions
setup: cp_icon setup-sh cron

cp_icon:
	@mkdir -p ~/.battery-alert/Pictures/
	@cp -r ./icon ~/.battery-alert/Pictures/

setup-sh:
	@cp ./check_battery.sh ~/.battery-alert
	@sudo chmod +x ~/.battery-alert/check_battery.sh

cron:
	@#sudo echo "*/2 * * * * $$USER ~/.battery-alert/check_battery.sh" >> /etc/crontab		I have no idea why it doesnt work :$
	@sudo bash cron.sh $$(whoami)
	@echo "\e[1;34Be a nice person =)\e[0m"

clean:
	@sudo rm -rf ~/.battery-alert
	@sudo sed -i '/check\_battery.sh/d' /etc/crontab
	@echo "\e[1;32mAll cleaned =)\e[0m"
	
