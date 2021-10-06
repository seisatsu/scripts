#!/bin/bash

backupDirectories=("/var/www/somedir" "/var/lib/mysql")

echo "Beginning backups for `date +%F`."

for srcdir in ${backupDirectories[@]}; do
    echo "Backing up $srcdir..."
    rsync -av -e "ssh -p PORT -i /root/.ssh/rsync" $srcdir rsync@HOST:/home/rsync/backup/`date +%F`/
done

echo "Finished backups."
