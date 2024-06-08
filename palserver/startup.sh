#!/bin/bash
./steamcmd.sh +login anonymous +app_update 2394010 validate +quit
cd /home/steam/Steam/steamapps/common/PalServer
./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -publiclobby