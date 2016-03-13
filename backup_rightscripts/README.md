# Backup Rightscript
Download and make a backup of all Rightscripts in a Rightscale account

Requirements
-------------
- Rightscale Account
- SHARD=my.rightscale.com or us-4.rightscale.com
- REFRESHTOKEN or 
- EMAIL
- PASSWORD
- [RightScale API client](https://github.com/kramfs/rsc-utilities)


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

Run the backup script
-------------
`./backup_rightscripts.sh`


See https://github.com/kramfs/rsc-utilities
