#!/bin/bash

if [[ $# -eq 0 ]]; then
    printf "Whoops! You have to supply the username of the user you're initializing here\n"
    printf "\texample:\n"
    printf "\t./deploy.sh <username>\n"
    exit 1
fi

user=$1
config_repo_name="env_config"
rsa_pub_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDxZECWR/6DW5ec/7hQUJsFyVXcgmboufz/3rFcAC1K4Esf734jlZRbMvtAfy0KoPuLbPDOTk2dTTrJz/2RNGOY7iqiycvgMbIjDl9s2qvGM2qwlvEeQ/MubAJZirBrVxLH8GVvlIYyk44Bj0ELN0XhF0gzwZCk2VoPXg+zdv7emc0Xo3oanIUzO6/QXwsK+4vAEZSDe9QHuvoO4E9WMAFv6TLDWMoNfyl98wHwj8s6PRd1vl2wvpOR5u6Q/AjZ2KpXtdoWU1w8ubsCs58j4oIwbHQYqa642OLH/t1EvyUTJnQsbMt8sGm6uLWeWYUi1FK8yNftoL9/vWepYSbZQp4Z shealen@YMCs-Mac-mini-7.local"

printf "\n\t>> Changing the shell to bash\n\n"
chsh -s /bin/bash ${user}

printf "\n\t>> adding user to sudoers group\n\n"
adduser ${user} sudo

cd /

printf "\n\t>> Checking if the home directory for ${user} ('/home/${user}') exists\n\n"
if [[ ! -e /home/${user} ]]; then
    printf "\n\t>> Home directory doesn't exist. Creating it and chowning to ${user}.\n\n"
    mkdir /home/${user}
    chown ${user}:${user} /home/${user}
else
    printf "\n\t>> Home directory exists.\n\n"
fi

printf "\n\t>> Creating the ~/.ssh folder unless it already exists\n\n"
mkdir -p /home/${user}/.ssh

printf "\n\t>> Adding rsa pub key to ~/.ssh/authorized_keys\n\n"
echo ${rsa_pub_key} >> /home/${user}/.ssh/authorized_keys

printf "\n\t>> Installing and configuring git\n\n"
apt-get install git
git config --global color.ui auto
git config --global user.name "Shealen Clare"
git config --global user.email "shealen.clare@gmail.com"
git config --global core.editor "vim"

if [[ ! -e /home/${user}/code ]]; then
    printf "\n\t>> /home/${user}/code/ directory doesn't exist. Creating it and chowning to ${user}.\n\n"
    mkdir /home/${user}/code
else
    printf "\n\t>> /home/${user}/code/ directory exists.\n\n"
fi
cd /home/${user}/code

if [[ ! -d /home/${user}/code/${config_repo_name} ]]; then
    printf "\n\t>> ${config_repo_name} not yet cloned -- Cloning\n\n"
    git clone https://github.com/sheac/${config_repo_name}.git
    cd ${config_repo_name}
else
    printf "\n\t>> ${config_repo_name} already cloned -- Pulling\n\n"
    cd ${config_repo_name}
    git checkout master
    git pull
fi

printf "\n\t>> Copying config files from 'env_config' git repo to their proper locations\n\n"
cp ./.bash_profile /home/${user}/
cp ./.bashrc /home/${user}/
cp ./.vimrc /home/${user}/
mkdir -p /home/${user}/.vim

printf "\n\t>> Creating vim backup directories\n\n"
mkdir -p /home/${user}/.vim/tmp
mkdir -p /home/${user}/.vim/backup

printf "\n\t>> Chowning everything in the home directory to ${user}"
chown -R ${user}:${user} /home/${user}/

printf "\n\t>> Reloading the .bash_profile file\n\n"
source /home/${user}/.bash_profile

printf "\n\t>> Cleaning up old files in improper locations\n\n"
printf "\n\t>> (none yet)\n"

printf "\n\t>> All finished!\n"
printf "\n\t>> Recommend you re-log in, so the changes take effect.\n"
printf "\n\t>> Peace\n"
