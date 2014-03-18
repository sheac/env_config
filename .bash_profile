export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH

# This will make it so you don't have to sudo your global npm installs
# 1. $ npm config set prefix ~/npm
# 2. this export:
export PATH=$HOME/npm/bin:$PATH
# credit: http://stackoverflow.com/questions/18212175/npm-yo-keeps-asking-for-sudo-permission/18277225#18277225

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi
