#!/bin/bash

cd /home/steam/Steam/steamapps/common/PalServer/Pal/Saved

# 提交備份

git add . 
git commit -m "Auto Backup" 
git push origin master