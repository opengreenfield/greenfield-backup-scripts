# README

The following project serves as a holding place for all executable backup scripts for a deployed greenfield instance.

The scripts allow you to create a simple Unix based backup server for everything Greenfield. Requires a little customization but you could have a backup server for under $20 a month.


## greenfield-server-backup.sh

Backs up all necessary files to redeploy a new instance with all current production data, settings and files.


## greenfield-postgres.sh

Backs up production postgres database.


## greenfield-transfer.sh

Transfers all Greenfield server images, data and files to backup server






### Files & directories backed up `greenfield-server-backup.sh`
	
	1. greenfield-backup.json
	2. layout-wrapper.html
	3. layout.html
	4. app.css
	5. store.css
	6. images
	7. uploads
	8. sites-available - apache files
	9. ssl - apache ssl files


**1. greenfield-backup.json** -A JSON representation of all data used to restore Greenfield. Alternative to RDMS backup.

`/usr/local/tomcat/tomcat-current/webapps/greenfield/backup/greenfield-backup.json` 



**2. layout-wrapper.html** - Base layout file for store front

`/usr/local/tomcat/tomcat-current/webapps/greenfield/templates/storefront/layout-wrapper.html`



**3. layout.html** - File that stores storefront layout

`/usr/local/tomcat/tomcat-current/webapps/greenfield/templates/storefront/layout.html`



**4. app.css** - Base layout CSS

`/usr/local/tomcat/tomcat-current/webapps/greenfield/css/app.css`



**5. store.css** - CSS file that stores storefront CSS

`/usr/local/tomcat/tomcat-current/webapps/greenfield/css/store.css`



**6. images directory** - Images directory for all product images

`/usr/local/tomcat/tomcat-current/webapps/greenfield/images`



**7. uploads directory** - All supporting uploads

`/usr/local/tomcat/tomcat-current/webapps/greenfield/uploads`



**8. sites-available** - Apache's `sites-available` directory

`/etc/apache2/sites-available`


**9. ssl directory** - Apache's ssl directory based on ssl installed at 

`/etc/apache2/ssl`








