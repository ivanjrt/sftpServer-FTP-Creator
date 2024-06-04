# Installing the app vsftpd (this only does FTP Service)
```bash
sudo apt update
sudo apt install vsftpd
```
- The configuration file for vsftpd is located at `/etc/vsftpd.conf`.<br/>
You can edit this file to customize your FTP server settings. <br/>
`sudo nano /etc/vsftpd.conf` <br/>

# Enabling Auth
- Enable this for anonymous Access: (_tested_) <br/>
```
anonymous_enable=YES
```
- Adding Users:
Make adjustments for your `ftp_user` <br/>
```
sudo adduser ftp_user
```
- Edit the `vsftpd` configuration file at `sudo nano /etc/vsftpd.conf`
Uncomment the following lines by removing the # at the beginning: <br/>
```
local_enable=YES
write_enable=YES
chroot_list_enable=YES
```
- Create an empty file for the chroot list:
`sudo touch /etc/vsftp.chroot_list`
Edit the file `sudo nano /etc/vsftp.chroot_list` <br/>
and add one username per line. These are the users who will be restricted to their home directories. <br/>
```Bash
sudo systemctl restart vsftpd.service
```
# Enabling Paths and configs
By default, vsftpd creates an FTP user with a home directory of /srv/ftp. If you want to change this location (e.g., to /srv/files/ftp), create the desired directory and update the user’s home directory: <br/>
```
sudo mkdir -p /srv/files/ftp
sudo usermod -d /srv/files/ftp ftp
```
BUT, if you want to change it then no need for the top line. <br/>

```
sudo usermod -d /desired/path/folder ftp
```
In either situation <br/>
```
sudo systemctl restart vsftpd.service
```
By default, `vsftpd` allows system users to download files. To enable uploading and other actions, edit /etc/vsftpd.conf:
```
write_enable=YES
sudo systemctl restart vsftpd.service
```

# To check for its status:
```
sudo systemctl status vsftpd.service
```
