#!/bin/sh
sudo apt-get update
sudo apt-get install -y python software-properties-common python-pip build-essential libssl-dev libffi-dev python-dev
sudo apt-get remove -y apache2
