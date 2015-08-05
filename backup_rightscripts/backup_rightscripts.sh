#!/bin/bash -e
# Backup all rightscripts in the account
#ACCOUNT=12345
ACCOUNT=
#SHARD=my.rightscale.com or us-4.rightscale.com
SHARD=
REFRESHTOKEN= 
EMAIL=
PASSWORD=

rsc_short=`/usr/local/bin/rsc --pp -a "$ACCOUNT" --email="$EMAIL" --pwd="$PASSWORD" -h "$SHARD"`

## Uncomment and use this when using EMAIL/PASSWORD credential
#source_href=`/usr/local/bin/rsc --pp -a "$ACCOUNT" --email="$EMAIL" --pwd="$PASSWORD" -h "$SHARD" --xm=':has(.rel:val("source")) > .href' cm15 index /api/right_scripts |sed -e s/\"//g`
source_href=`$rsc_short --xm=':has(.rel:val("source")) > .href' cm15 index /api/right_scripts |sed -e s/\"//g`

## Uncomment and use this when using REFRESH TOKEN.
# source_href=`$rsc_short --xm=':has(.rel:val("source")) > .href' cm15 index /api/right_scripts |sed -e s/\"//g`

## Backup only specific rightscripts filter by "name 
# source_href=`$rsc_short --xm=':has(.rel:val("source")) > .href' cm15 index /api/right_scripts filter[]="name==rjs:" |sed -e s/\"//g`

mkdir -p rightscripts_backup
cd rightscripts_backup
for i in $source_href ;
do
	script_name=`$rsc_short --x1=.name cm15 show $i`
	$rsc_short cm15 show_source $i > "$script_name"
done
