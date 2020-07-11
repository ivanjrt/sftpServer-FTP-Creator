.DISCLAIMER
This script is an early ALPHA status
Feel free to Modify the below though, I don't offer any sort of warranty

.INSTRUCTIONS
	run this file from a centOS or REHL

.This script will try to create a sftp folder, and will add a user to an 'upload' folder
.Once comfirm it works, and wanting to add more users, then type
	sudo su
	useradd -g sftpusers -d /upload -s /sbin/nologin username
	passwd username

.Help
	In case if fails open a terminal, open a terminal locate the the script and type:
		chmod +x ftpserver.sh

.AUTHOR
ivanjrt @ gmail.com
