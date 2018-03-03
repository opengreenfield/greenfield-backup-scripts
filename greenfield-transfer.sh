#!/bin/bash

: '

Based on installation instructions on http://opengreenfield.org. 
Make sure backup directory on production server matches
backup directory on backup server listed below, should be `greenfield-backup`,
`greenfield-server-backup.sh` creates this directory and uses it by default.

The following script will transfer greenfield server backup :

1. create backup ssh key, name it `greenfield-backup`, store it in `/home/greenfield/.ssh/`

2. set variables below, greenfield_host, greenfield_backup_directory

3. place in /home/greenfield/scripts/

4. add cron job
	
	`crontab -e`

	*/13 * * * * * /home/greenfield/scripts/greenfield-transfer.sh

'



echo "*********************************************************************"
echo "*                                                                   *"
echo "***       Greenfield Server to Remote Transfer Starting...        ***"
echo "*                                                                   *"
echo "*********************************************************************"


echo "preparing to add ssh key to ssh agent..."
ssh-add /home/greenfield/.ssh/greenfield-backup


echo "preparing  ssh-agent..."
eval "$(ssh-agent -s)"



echo "setting variables..."
greenfield_host=
greenfield_backup_directory=/home/greenfield/greenfield-backups/greenfield


mkdir -p $greenfield_backup_directory


echo "beginning file transfer..."

scp -i /home/greenfield/.ssh/greenfield-backup -r greenfield@$greenfield_host:greenfield-backup/* $greenfield_backup_directory

echo "file transfer complete..."








echo "*********************************************************************"
echo "*                                                                   *"
echo "****        Greenfield Server to Remote Transfer Complete        ****"
echo "*                                                                   *"
echo "*********************************************************************"


























