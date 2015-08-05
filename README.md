RSC Utilities
===================

Download/Backup all RightScripts from a RightScale account

Clone
-------------
`git clone https://github.com/kramfs/rsc-utilities.git`

Setup the environment
-------------
`cd rsc-utilities`

`chmod +x setup_rsc.sh`

`sudo ./setup_rsc.sh`

Backup Script
-------------
`cd backup_rightscripts`

`chmod +x backup_rightscripts.sh`

Customize the required inputs
-------------
`vi backup_rightscripts.sh`

Edit the following, replace the values from the account and credentials that you want to backup
> ACCOUNT=`1234`

> SHARD=`my.rightscale.com or us-4.rightscale.com `

> REFRESHTOKEN=`1234fgtejyrkutluiy`

> EMAIL=`user@domain.com`

> PASSWORD=`RS_dashboard_password`

Either you use the email/password credential or the refresh token but not both. 
You need to adjust the script accordingly. It will use the email/password credential by default

TODO
-------------

 - Save script to per account folder
