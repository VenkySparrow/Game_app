#!/bin/bash
LOG_FILE="/home/ubuntu/Game_app/dino-game/deploy.log"

echo 'Running after_install.sh...' >> $LOG_FILE

echo 'Changing directory to app folder' >> $LOG_FILE
cd /home/ubuntu/Game_app/dino-game >> $LOG_FILE 2>&1

echo 'Installing npm dependencies' >> $LOG_FILE
npm install >> $LOG_FILE 2>&1
