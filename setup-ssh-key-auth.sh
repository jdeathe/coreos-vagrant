#!/usr/bin/env bash

# Change working directory
DIR_PATH="$( cd "$( echo "${0%/*}" )"; pwd )"
if [[ $DIR_PATH == */* ]]; then
	cd $DIR_PATH
fi

SSH_IDENTITY_FILE=~/.ssh/id_rsa

if [[ ! -e ${SSH_IDENTITY_FILE} ]] && [[ ! -e ${SSH_IDENTITY_FILE}.pub ]]; then
	echo "Generate new SSH key pair..."
	ssh-keygen -q -t rsa -f ${SSH_IDENTITY_FILE}
elif [[ ! -e ${SSH_IDENTITY_FILE}.pub ]] || [[ ! -s ${SSH_IDENTITY_FILE}.pub ]]; then
	echo "Generate SSH public key for existing private key..."
	ssh-keygen -y -t rsa -f ${SSH_IDENTITY_FILE} > ${SSH_IDENTITY_FILE}.pub.tmp

	if [[ -s ${SSH_IDENTITY_FILE}.pub.tmp ]]; then
		mv ${SSH_IDENTITY_FILE}.pub.tmp ${SSH_IDENTITY_FILE}.pub
	fi
else
	echo "Using existing SSH keys."
fi

echo 
echo "Your public SSH key is (${SSH_IDENTITY_FILE}.pub):"
cat ${SSH_IDENTITY_FILE}.pub

# Update the Vagrantfile with the new key
#sed -i \
#	-e 's/#config.ssh.private_key_path = "~\/.ssh\/id_rsa"/config.ssh.private_key_path = "~\/.ssh\/id_rsa"/g' \
#	-e 's/#config.ssh.forward_agent = true/config.ssh.forward_agent = true/g' \
#	Vagrantfile

echo 