#!bin/sh

# Ensure the user is in the docker group
if ! groups $USER | grep -q "\bdocker\b"; then
    sudo usermod -aG docker $USER
    newgrp docker
fi

# Create necessary directories if they don't exist
if [ ! -d "/home/${USER}/data" ]; then
        mkdir -p ~data/mariadb
        mkdir -p ~data/wordpress
        sudo chown -R $USER:$USER home/hsirenko/data/wordpress
        sudo chmod -R 755 /home/hsirenko/data/wordpress
fi