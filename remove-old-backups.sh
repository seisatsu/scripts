#!/bin/sh

maxDiskUsage=80

df -H | grep -vE '^Filesystem|tmpfs|devtmpfs|none' | awk '{ print $5 " " $1 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  files=`ls -d /home/rsync/backup`
  if [ $usep -ge $maxDiskUsage ]; then
    echo "Removing old backup: ${files[0]}"
    rm -rf ${files[0]}
  fi
done
