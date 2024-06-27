#!/bin/bash

# update server
./steamcmd.sh +login anonymous +app_update 2394010 validate +quit

# git backup
################
if [ ! -d "/home/steam/Steam/steamapps/common/PalServer/Pal/Saved" ]; then
    mkdir -p /home/steam/Steam/steamapps/common/PalServer/Pal/Saved
    if [ -d "/home/steam/backup" ]; then
        cd /home/steam/Steam/steamapps/common/PalServer/Pal/Saved   
        git init
        git config user.name 'steam' 
        git config user.email '<>'
        git remote add origin ~/backup
        git pull origin master
        # binary file is not useful for small file
        # echo '*.sav binary'> .gitattributes
    fi
fi
cd /home/steam/Steam/steamapps/common/PalServer/Pal/Saved
if [ $CHECKOUT ]; then
    echo "restore backup to $CHECKOUT"
    git pull origin master
    git checkout $CHECKOUT
fi
################

cd /home/steam/Steam/steamapps/common/PalServer
./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -publiclobby