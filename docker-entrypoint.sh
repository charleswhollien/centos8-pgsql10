#!/bin/bash

#Cron to run a nightly backup.
crond

#Initial setup. create a database if it does not exist then copy the config
#file. These should be in a static volume. 
if [ -f /var/lib/pgsql/data/PG_VERSION ]
then
  echo "Postgresql already deployed"
else
  #su -c "initdb -D /var/lib/pgsql/data/ --no-locale -E UTF8" postgres
  su -c "initdb -D /var/lib/pgsql/data/ --locale=en_US.UTF-8 -E UTF8" postgres
  cp /config/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
  cp /config/postgresql.conf /var/lib/pgsql/data/postgresql.conf
fi





su -c "postgres -D /var/lib/pgsql/data/" postgres
