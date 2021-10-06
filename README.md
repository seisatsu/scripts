# scripts
These are some important scripts I use on my servers.

  * `rsync-backup.sh`
    * This sends backups of important directories from a production server to my backup storage server.
    * It is run from a production server.
  * `remove-old-backups.sh`
    * This deletes the oldest backup once disk usage on the backup server reaches a certain amount.
    * It is run from the backup server.
