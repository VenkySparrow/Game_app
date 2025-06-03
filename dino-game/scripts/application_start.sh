#!/bin/bash

LOG_FILE="/home/ubuntu/Game_app/dino-game/deploy.log"

echo "Running application_start.sh..." >> $LOG_FILE

cd /home/ubuntu/Game_app/dino-game >> $LOG_FILE 2>&1

# Restart or start the PM2 process
# Check if it’s already running, otherwise start it
echo "Restarting PM2 process 'dino-game'" >> $LOG_FILE
pm2 restart dino-game >> $LOG_FILE 2>&1 || {
  echo "Starting PM2 process 'dino-game'" >> $LOG_FILE
  pm2 start "serve -s build -l 3000" --name dino-game >> $LOG_FILE 2>&1
}

# Save and enable on boot
pm2 save >> $LOG_FILE 2>&1
pm2 startup systemd -u ubuntu --hp /home/ubuntu >> $LOG_FILE 2>&1
