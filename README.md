<i>git clone https://github.com/kramfs/rsc-utilities.git

<b>Setup The Environment</b>

<i>cd rsc-utilities</i>
<i>chmod +x setup_rsc.sh</i>

<i>sudo ./setup_rsc.sh

<i>cd backup_rightscripts

<i>chmod +x backup_rightscripts.sh

<b>Customize the required inputs:</b>

<i>vi backup_rightscripts.sh

<i>ACCOUNT=1234

<i>SHARD=my.rightscale.com or us-4.rightscale.com 

<i>REFRESHTOKEN=1234fgtejyrkutluiy

<i>EMAIL=user@domain.com

<i>PWD=RS_dashboard_password

Either you user the email/password credential or use the refersh token. You need to adjust the script accordningly. It will use the email/password credential by default
