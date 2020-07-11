#!/bin/bash
sudo su
mkdir -p /data/sftp
chmod 701 /data
groupadd sftpusers
read -p "Enter a SFTP User to be added: " userList
useradd -g sftpusers -d /upload -s /sbin/nologin  userList
echo "Enter His password: "
passwd userList
mkdir -p /data/userList/upload
chown -R root:sftpusers /data/userList
chown -R userList:sftpusers /data/userList/upload

echo Match Group sftpusers >> /etc/ssh/sshd_config
echo ChrootDirectory /data/%u >> /etc/ssh/sshd_config
echo ForceCommand internal-sftp >> /etc/ssh/sshd_config

service sshd restart
echo "Server has been configured"
echo "Listening on port 22"
echo "On Ip: "
/sbin/ifconfig eth0 | grep inet

#If network issues then download and install nmap
#yum install nmap -y
#where that ip is inbound
#nmap -n  10.10.10.10 
