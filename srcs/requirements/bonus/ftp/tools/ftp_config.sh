#!/bin/bash

# Start vsftpd service temporarily to initialize
service vsftpd start

# Add a new FTP user
adduser --disabled-password --gecos "" "$USERFTP"

# Set the user's password securely
echo -e "$PASSFTP\n$PASSFTP" | passwd "$USERFTP"

# Create the user's home directory
mkdir -p /home/$USERFTP/ftp
chown -R "$USERFTP:$USERFTP" /home/$USERFTP/ftp

# Append the user to the vsftpd user list
echo "$USERFTP" >> /etc/vsftpd.userlist

# Update vsftpd configuration
cat << EOF >> /etc/vsftpd.conf
anonymous_enable=NO
local_enable=YES
write_enable=YES
user_sub_token=$USERFTP
local_root=/home/$USERFTP/ftp
pasv_min_port=60000
pasv_max_port=60005
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
EOF

# Stop vsftpd service before restarting it with new configuration
service vsftpd stop

# Start vsftpd 
vsftpd
