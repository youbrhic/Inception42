#!/bin/bash

# Wait for the MariaDB container to be ready
sleep 5

# Configuration of CLI wp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www/site
cd /var/www/site
chmod -R 777 /var/www/site/
chown -R root:root /var/www/site
chown -R www-data:www-data /var/www/site
wp core download --allow-root
mv /var/www/site/wp-config-sample.php /var/www/site/wp-config.php

# Configuration of the WordPress database
wp config set --allow-root DB_NAME "$DB_NAME"
wp config set --allow-root DB_USER "$DB_USER"
wp config set --allow-root DB_PASSWORD "$DB_USER_PASS"
wp config set --allow-root DB_HOST "mariadb:3306"
wp core install --url="$WP_DOMAINE_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --allow-root 
wp user create "$WP_NEW_USER_NAME" "$WP_NEW_USER_EMAIL" --user_pass="$WP_NEW_USER_PASS" --role="$WP_NEW_USER_ROLE" --allow-root

### configuration of redis ####
# Install Redis Object Cache plugin for WordPress
wp plugin install redis-cache --activate --allow-root

# Configure wp-config.php for Redis caching
wp config set --allow-root WP_REDIS_HOST 'redis'  # Assuming Redis container is named 'redis'
wp config set --allow-root WP_REDIS_PORT 6379
wp config set --allow-root WP_REDIS_DATABASE 0

# Enable Redis object cache in Wor
wp redis enable --allow-root

# Configuration of FPM service
sed -i 's/listen =.*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

# Start the FPM service
php-fpm7.4 -F
