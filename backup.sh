#!/bin/bash
cd /home/haggis/.config/docker/
for dir in *
    do
        zip -r --exclude=*MediaCover* --exclude=*Backup* --exclude=*duplicati* "${dir}.zip" "$dir" & done
    wait
for f in $(ls /home/haggis/.config/docker/*.zip)
    do
        aws s3 cp $f s3://mik-plex-backups/configbackups/
    done
rm /home/haggis/.config/docker/*.zip
