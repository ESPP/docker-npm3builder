#!/bin/bash
usermod -u $EXTERNAL_ID builder

for FOLDER in $BUILDER_FOLDERS; do
  chown -R builder. $FOLDER
done

echo "ENV_PATH     PATH=$PATH" >> /etc/login.defs
su builder -c "cd /data; $*"
