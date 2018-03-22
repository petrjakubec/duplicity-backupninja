# duplicity-backupninja

## Successful backup

Check if backup was successful on backupninja
You can look for "Debug" and "Info" words in /var/log/backupninja.log
Everything else would be a problem.

OR

Wrap backup script/s by function 
https://serverfault.com/questions/135299/best-tool-for-monitoring-backups-etc-and-trending-statstics-from-that-data/137283
function handle {
        echo Error
        error problem occured
}
set -e
trap handle ERR
```
ssh root@51.15.196.175
```
```
passwd ftp
```
#### nastavil jsem xxx

# GPG key generating
duplicity-testing:~/gpg2/gpg-key-generator
(0) # ./gpg_key_generator.sh

gpg --delete-secret-keys 2348EFAF
gpg --delete-key 11438F4E

duplicity-testing:~/gpg2/gpg-key-generator
(0) # gpg --import userserver.pub
gpg: key A1452514: public key "Petr Jakubec (none) <petrjakube@gmail.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)

#### passphrase = zzz
```
duplicity-testing:~/gpg2/gpg-key-generator
(0) # gpg -k
/root/.gnupg/pubring.gpg
------------------------
pub   4096R/A1452514 2018-03-21
uid                  Petr Jakubec (none) <petrjakube@gmail.com>
sub   4096R/E963E16A 2018-03-21
```
```
duplicity /var/backups/mysql/sqldump ftp://ftp:changeme@ftp.gpx.cz/var
LFTP version is 4.4.8
Local and Remote metadata are synchronized, no sync needed.
Last full backup date: none
GnuPG passphrase:
Retype passphrase to confirm:
No signatures found, switching to full backup.
--------------[ Backup Statistics ]--------------
StartTime 1521641489.29 (Wed Mar 21 14:11:29 2018)
EndTime 1521641489.84 (Wed Mar 21 14:11:29 2018)
ElapsedTime 0.54 (0.54 seconds)
SourceFiles 6
SourceFileSize 1797601 (1.71 MB)
NewFiles 6
NewFileSize 1797601 (1.71 MB)
DeletedFiles 0
ChangedFiles 0
ChangedFileSize 0 (0 bytes)
ChangedDeltaSize 0 (0 bytes)
DeltaEntries 6
RawDeltaSize 1793505 (1.71 MB)
TotalDestinationSizeChange 245995 (240 KB)
Errors 0
-------------------------------------------------
```
0] Backup
```
export PASSPHRASE=xxx
export FTP_PASSWORD=zzz
duplicity /var/backups/mysql/sqldump ftp://ftp:changeme@ftp.gpx.cz/var
unset PASSPHRASE
unset FTP_PASSWORD
echo Success
```
1] videt, ze je to zalogovano:
vytvoreni zalohy
```
cat /var/log/backupninja.log
```
2] overit integritu
#duplicity verify --verbosity 4 --no-encryption file:///path/to/backup/ /home/&{USER}
```
duplicity verify --verbosity 4 --no-encryption ftp://ftp:changeme@ftp.gpx.cz/var file:///var/backups/mysql/sqldump
```
```
export PASSPHRASE=xxx
export FTP_PASSWORD=zzz
duplicity verify --verbosity 4 ftp://ftp:changeme@ftp.gpx.cz/var /var/backups/mysql/sqldump
unset PASSPHRASE
unset FTP_PASSWORD
```
3] obnovit uspesnout obnovu
#### divne funguje (soubor veros se neobnovil, ale vsechny soubory se obnovili)
```
export PASSPHRASE=xxx
export FTP_PASSWORD=zzz
duplicity restore ftp://ftp:changeme@ftp.gpx.cz/var/ /var/backups/mysql/sqldump/
unset PASSPHRASE
unset FTP_PASSWORD
```
```
duplicity-testing:/var/backups/mysql/sqldump
(0) # duplicity restore ftp://ftp:changeme@ftp.gpx.cz/var/ /var/backups/mysql/sqldump/
LFTP version is 4.4.8
Synchronizing remote metadata to local cache...
Copying duplicity-full-signatures.20180321T141116Z.sigtar.gpg to local cache.
Copying duplicity-full.20180321T141116Z.manifest.gpg to local cache.
Last full backup date: Wed Mar 21 14:11:16 2018

duplicity-testing:/var/backups/mysql/sqldump
(0) # ls
information_schema.sql  mysql.sql  performance_schema.sql  test.sql  veros.sql
```
4] List Archived Files
```
export PASSPHRASE=xxx
export FTP_PASSWORD=zzz
duplicity list-current-files ftp://ftp:changeme@ftp.gpx.cz/var
unset PASSPHRASE
unset FTP_PASSWORD
```
5] Automating Duplicity
```
0 0 * * * /root/scripts/backup.sh >> /var/log/duplicity/etc.log 2>&1
```

### backup.sh # contains this:
```
export PASSPHRASE=xxx
export FTP_PASSWORD=zzz
duplicity /var/backups/mysql/sqldump ftp://ftp:changeme@ftp.gpx.cz/var
unset PASSPHRASE
unset FTP_PASSWORD
echo Success
```
