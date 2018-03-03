#!/bin/bash

: '

The following script will create backups and directories located at :

/home/greenfield/greenfield-backup/
/home/greenfield/greenfield-backup/json
/home/greenfield/greenfield-backup/assets
/home/greenfield/greenfield-backup/apache

1. set `application` variable below to greenfield application context

2. place script in /opt/scripts/

3. add cron job
	
	`crontab -e`

	*/13 * * * * * /opt/scripts/greenfield-backup-server.sh

'



echo "*********************************************************************"
echo "*                                                                   *"
echo "***               Running Greenfield Server Backup                ***"
echo "*                                                                   *"
echo "*********************************************************************"


echo "setting variables ..."

application=greenfield
tomcat_directory=/usr/local/tomcat/tomcat-current/webapps
apache_directory=/etc/apache2
backup_directory=/home/greenfield/greenfield-backup/


mkdir -p /home/greenfield/greenfield-backup/json-backup
mkdir -p /home/greenfield/greenfield-backup/assets
mkdir -p /home/greenfield/greenfield-backup/apache/ssl


echo "copying all necessary Greenfield files ..."

cp $tomcat_directory/$application/backup/greenfield-backup.json $backup_directory/json-backup/
cp $tomcat_directory/$application/settings/settings.properties $backup_directory/assets/
cp $tomcat_directory/$application/templates/storefront/layout-wrapper.html $backup_directory/assets/
cp $tomcat_directory/$application/templates/storefront/layout.html $backup_directory/assets/
cp $tomcat_directory/$application/css/app.css $backup_directory/assets/
cp $tomcat_directory/$application/css/store.css $backup_directory/assets/
cp -R $tomcat_directory/$application/images $backup_directory/assets/
cp -R $tomcat_directory/$application/uploads $backup_directory/assets/
cp -R $apache_directory/sites-available $backup_directory/apache
cp -R $apache_directory/ssl $backup_directory/apache/


echo "changing permissions ..."

chmod -R 755 /home/greenfield/greenfield-backup



echo "*********************************************************************"
echo "*                                                                   *"
echo "***               Greenfield Server Backup Complete               ***"
echo "*                                                                   *"
echo "*********************************************************************"


















