#!/bin/bash

ROOT_DIR=$(pwd)

# Create backup directory
mkdir backup
mkdir tmp

# Create bare git repository
cd $ROOT_DIR/backup
git init --bare 
git config core.logAllRefUpdates true
git config gc.auto 500
git config gc.reflogExpire "3 days"
git config gc.reflogExpireUnreachable "3 days"

# commit default settings to backup repository
cd $ROOT_DIR/tmp
git clone $ROOT_DIR/backup
mkdir -p backup/Config/LinuxServer
cp $ROOT_DIR/DefaultPalWorldSettings.ini backup/Config/LinuxServer/PalWorldSettings.ini

cd $ROOT_DIR/tmp/backup
git add .
git commit -m "Initial commit"
git push origin master

# cleanup
cd $ROOT_DIR
rm -rf tmp

