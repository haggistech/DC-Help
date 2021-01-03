#!/bin/bash
cd /home/haggis/.config/docker/
for /i in */
    do
        zip -0 -r "${i%}.zip" "$i" & done
    wait
for f in $(ls /home/haggis/.config/docker/*.zip)
    do
        aws s3 cp \$f s3://mik-plex-backups/configbackups/
    done
rm /home/haggis/.config/docker/*.zip
