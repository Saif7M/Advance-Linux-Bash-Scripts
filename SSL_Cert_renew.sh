#!/bin/bash
DOMAIN="yourdomain.com"
EMAIL="admin@yourdomain.com"
CERTBOT_PATH="/usr/bin/certbot"

echo "Checking SSL certificate renewal for $DOMAIN..."
$CERTBOT_PATH renew --quiet --email "$EMAIL" --agree-tos --non-interactive

# Reload web server to apply new certs
systemctl reload nginx

