#!/bin/bash
cd /home/haggis/.config/docker/
for dir in *
    do
        zip -r --exclude=*MediaCover* --exclude=*Backup* --exclude=*duplicati* "${dir}.zip" "$dir" & done
    wait
