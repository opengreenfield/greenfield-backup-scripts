#!/bin/bash

: '

Based on installation instructions on http://opengreenfield.org

The following script will create postgres backup :

1. You will need `postgresql-client` installed on backup server
	
	`sudo apt-get install postgresql-client`

2. Set postgres variables below, postgres_host, postgres_password, database_name

3. place script in /home/greenfield/scripts/

4. add cron job
	
	`crontab -e`

	*/13 * * * * * /home/greenfield/scripts/greenfield-postgres.sh

'



echo "*********************************************************************"
echo "*                                                                   *"
echo "***         Greenfield Server Postgres Backup Starting...         ***"
echo "*                                                                   *"
echo "*********************************************************************"


echo "setting variables ..."

postgres_host=
postgres_password=
database_name=


database_connection=postgresql://postgres:$postgres_password@$postgres_host:5432/$database_name
postgres_backup_file=/home/greenfield/greenfield-backups/postgres-backups/$database_name-$(date +%Y-%m-%d).tar
pg_dump=/usr/lib/postgresql/9.6/bin/pg_dump



mkdir -p /home/greenfield/greenfield-backups/postgres-backups



echo "preparing pg_dump ..."

$pg_dump --dbname=$database_connection --format=tar --file=$postgres_backup_file

echo "postgres pg_dump complete ..."








echo "*********************************************************************"
echo "*                                                                   *"
echo "***          Greenfield Server Postgres Backup Complete           ***"
echo "*                                                                   *"
echo "*********************************************************************"






















