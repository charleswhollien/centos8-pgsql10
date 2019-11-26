#!/bin/bash

if [ -z $BACKUPDAYS ]
then
BACKUPDAYS=1
fi

# clean old backups
find /var/lib/pgsql/backups/ -mtime $BACKUPDAYS -delete

# backup database
su -c "pg_dumpall -f /var/lib/pgsql/backups/pgdump-$(date -I)" postgres

