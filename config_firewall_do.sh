#!/bin/sh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 8443
sudo ufw allow 443
sudo ufw allow 80

sudo ufw enable
