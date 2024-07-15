#!/usr/bin/env bash
# Script to set up web servers for the deployment of web_static

# Install Nginx if not already installed
if ! dpkg -s nginx > /dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get -y install nginx
fi

# Create necessary directories
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

# Create fake HTML file
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html > /dev/null

# Create or recreate symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# Set ownership to ubuntu user and group
sudo chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
config_file="/etc/nginx/sites-available/default"
if ! grep -q "location /hbnb_static" "$config_file"; then
    sudo sed -i '/server_name _;/a\\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}' "$config_file"
fi

# Restart Nginx
sudo service nginx restart

exit 0

