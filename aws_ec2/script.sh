#!/bin/bash
apt-get update
apt-get install nginx -y
echo "Hi Satyam" >/var/www/html/index.html
