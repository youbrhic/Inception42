#!/bin/bash

# Start MariaDB service
service mariadb start

# Waiting for MariaDB service to start
sleep 5

# Read passwords from secrets
DB_ROOT_PASS=$(cat /run/secrets/db_root_pass)
DB_USER_PASS=$(cat /run/secrets/db_user_pass)

# Run SQL commands with root user
mysql -uroot << EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASS';
FLUSH PRIVILEGES;

CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Shutdown the MariaDB service
mysqladmin -u root -p"$DB_ROOT_PASS" shutdown

# Start MariaDB service again, but this time in the foreground
exec mysqld_safe --bind-address=0.0.0.0
