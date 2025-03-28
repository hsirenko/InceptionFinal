
# Project Domain Configuration
DOMAIN_NAME=inception.42.fr

# MySQL/MariaDB Configuration
MYSQL_ROOT_PASSWORD_FILE=../secrets/mariadb_root_pass.txt
MYSQL_USER_FILE=../secrets/mariadb_user.txt
MYSQL_PASSWORD_FILE=../secrets/mariadb_pass.txt
MYSQL_DATABASE=wordpress
MYSQL_HOSTNAME=mariadb

# WordPress Configuration
WP_ADMIN_USER_FILE=../secrets/wp_admin.txt
WP_ADMIN_PASSWORD_FILE=../secrets/wp_admin_pass.txt
WP_ADMIN_EMAIL=admin@inception.42.fr

WP_USER_FILE=../secrets/wp_user.txt
WP_USER_PASSWORD_FILE=../secrets/wp_user_pass.txt
WP_USER_EMAIL=user@inception.42.fr

# Volume Paths
WORDPRESS_VOLUME_PATH=/home/${USER}/data/wordpress
MARIADB_VOLUME_PATH=/home/${USER}/data/mariadb

# Network Configuration
NETWORK_NAME=inception
