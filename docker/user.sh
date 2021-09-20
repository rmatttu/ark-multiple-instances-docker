#!/bin/sh

# Change the USER_ID if needed
if [ ! "$(id -u steam)" -eq "$USER_ID" ]; then
  echo "Changing steam uid to $USER_ID."
  usermod -o -u "$USER_ID" steam ;
fi
# Change GROUP_ID if needed
if [ ! "$(id -g steam)" -eq "$GROUP_ID" ]; then
  echo "Changing steam GROUP_ID to $GROUP_ID."
  groupmod -o -g "$GROUP_ID" steam ;
fi

# Put steam owner of directories (if the uid changed, then it's needed)
# chown -R steam:steam /ark /home/steam

# avoid error message when su -p (we need to read the /root/.bash_rc )
# chmod -R 777 /root/

# Launch run.sh with user steam (-p allow to keep env variables)
su -p - steam -c /app/run.sh
