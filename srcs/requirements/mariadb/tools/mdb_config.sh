#!/bin/bash

# start mariadb service
service mariadb start

# wiating for mariadb service to start
sleep 5

# run sql commands with root
mysql -uroot << EOF

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASS';
FLUSH PRIVILEGES;

CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

# shtdown the mariadb service
mysqladmin -u root -p"$DB_ROOT_PASS" shutdown

# start mariadb service , but this time in foreground
exec mysqld_safe --bind-address=0.0.0.0