#!/bin/bash

backupDirectories=("/var/www/somedir" "/var/lib/mysql")
host=BACKUPHOST
port=BACKUPPORT

echo "Beginning backups for `date +%F`."

for srcdir in ${backupDirectories[@]}; do
    echo "Backing up $srcdir..."
    rsync -av -e "ssh -p $port -i /root/.ssh/rsync" $srcdir rsync@$host:/home/rsync/backup/`date +%F`/
done

echo "Finished backups."
