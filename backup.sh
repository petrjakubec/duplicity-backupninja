export PASSPHRASE=xxxx
export FTP_PASSWORD=zzzz
duplicity list-current-files ftp://ftp:changeme@ftp.gpx.cz/var
unset PASSPHRASE
unset FTP_PASSWORD
echo Success
