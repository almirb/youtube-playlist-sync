#!/bin/bash

cd /home/almir/youtube-playlist-sync/
rm prefeitura/*.webm
python yps.py --sync prefeitura
cd prefeitura
rm tv.webm
printf "file '%s'\n" ./*.webm > videos.txt
ffmpeg -safe 0 -f concat -i videos.txt -c copy tv.webm

file=tv.webm
minimumsize=1000
actualsize=$(du -k "$file" | cut -f 1)
if [ $actualsize -ge $minimumsize ]; then
    mv tv.webm /var/www/novosga/html/painel-web/themes/video/tv.webm
    echo Arquivo gerado com sucesso.
else
    echo Houve algum erro na geracao do arquivo.
fi
