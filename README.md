# Youtube Playlist Sync

A small script used to download videos from a number of playlists using youtube-dl.

You initialise a folder to hold a specific playlist, which then stores a config file in that directory that holds the
 playlist details.

Once this has been done, sync can be run on a directory, and all directories under that holding a config file will
 have their videos downloaded and updated.
 
This allows to keep an updated local copy of a large number of playlists easily.

## Usage

Clone the repository

Set up a folder to store your playlist details with

    yps.py --init <playlist url> --dir <folder>

Then sync it and download all the videos with

    yps.py --sync <folder>
    
youtube-dl handles if you need to download a video or not and supports download resuming.

## Para a playlist da Prefeitura de Rio do Sul

Clonar este repositório.

Criar a pasta e inicializar a playlist:

    mkdir prefeitura
    yps.py --init https://www.youtube.com/playlist?list=PLEhhZDKMxiMjHJxV6QEIoX9Z_GRu6Bw51 --dir prefeitura

Sincronizar e baixar os vídeos

    yps.py --sync prefeitura

Adicionar no crontab do usuário root o seguinte comando:

    00 03 * * * /home/<usuario>/youtube-playlist-sync/atualizar_playlist.sh > /home/<usuario>/youtube-playlist-sync/atualizar_playlist.log

* Lembre de trocar `<usuario>` pela pasta do usuário onde o repositório foi clonado.

Desta forma, os vídeos serão obtidos diariamente, às 03:00h.

O caminho do arquivo gerado e demais itens também poderão ser personalizados.
O utilitário youtube-dl gerencia toda a parte de download dos vídeos.


## License

MIT all the way!
