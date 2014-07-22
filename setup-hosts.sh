#!/usr/bin/env bash

# Change working directory
DIR_PATH="$( cd "$( echo "${0%/*}" )"; pwd )"
if [[ $DIR_PATH == */* ]]; then
	cd $DIR_PATH
fi

# Clean up any existing entries
sudo sh -c "sed -i -e '/# CoreOS Vagrant$/d' /etc/hosts"
sudo sh -c "sed -i -e '/172.17.8.10[1-9]*	core-0[1-9]* core-0[1-9]*.local$/d' /etc/hosts"
sudo sh -c "sed -i -e '/172.17.8.10[1-9]*	app-[0-9]* app-[0-9]*.local$/d' /etc/hosts"

# Add coreos vagrant hosts
sudo sh -c "echo $'# CoreOS Vagrant' >> /etc/hosts"
sudo sh -c "echo $'172.17.8.101\tcore-01 core-01.local' >> /etc/hosts"
sudo sh -c "echo $'172.17.8.102\tcore-02 core-02.local' >> /etc/hosts"
sudo sh -c "echo $'172.17.8.103\tcore-03 core-03.local' >> /etc/hosts"

# Add app hosts
sudo sh -c "echo $'172.17.8.101\tapp-1 app-1.local' >> /etc/hosts"

echo "Done."