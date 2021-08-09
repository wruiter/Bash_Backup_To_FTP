#!/bin/bash

## LOCAL/FTP/SCP/MAIL PARAMETERS
SERVER="xxx.xxx.xxx.xxx"         # IP of Network disk
USERNAME="[username]"              # FTP username of Network disk
PASSWORD="[password]"            # FTP password of Network disk
DESTDIR="backup/Server/"   # FTP Destination Directory
## END OF USER CONFIGURABLE PARAMETERS

TIMESTAMP=`/bin/date +%Y%m%d-%H%M%S`
BACKUPFILEDIR="$TIMESTAMP-Backup.tar.gz"

### Create backup and ZIP it
tar -zcvf /tmp/$BACKUPFILEDIR /var/www/html/

### Send to Network disk through FTP
curl -k --insecure -T"/tmp/$BACKUPFILEDIR" -u"$USERNAME:$PASSWORD" "sftp://$SERVER/$DESTDIR"

### Remove temp backup file
/bin/rm /tmp/$BACKUPFILEDIR

### Done! 
