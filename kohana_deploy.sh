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

printf "\n\t>> installing mysql\n"
apt-get install mysql-client mysql-server

printf "\n\t>> installing apache2\n"
apt-get install apache2

printf "\n\t>> installing php\n"
apt-get install php5 libapache2-mod-php5
/etc/init.d/apache2 restart

printf "\n\t>> All finished!\n"
printf "\n\t>> Peace\n"
