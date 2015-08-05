#!/bin/bash -e
# Backup all rightscripts in the account
#ACCOUNT=12345
ACCOUNT=
#SHARD=my.rightscale.com or us-4.rightscale.com
SHARD=
REFRESHTOKEN= 
EMAIL=
PASSWORD=

## Uncomment and use this when using EMAIL/PASSWORD credential
source_href=`/usr/local/bin/rsc --pp -a "$ACCOUNT" --email="$EMAIL" --pwd="$PASSWORD" -h "$SHARD" --xm=':has(.rel:val("source")) > .href' cm15 index /api/right_scripts |sed -e s/\"//g`

## Uncomment and use this when using REFRESH TOKEN.
# source_href=`/usr/local/bin/rsc --pp -a "$ACCOUNT" -h "$SHARD" --refreshToken="$REFRESHTOKEN" --xm=':has(.rel:val("source")) > .href' cm15 index /api/right_scripts |sed -e s/\"//g`

## Backup only specific rightscripts filter by "name 
# source_href=`/usr/local/bin/rsc --pp -a "$ACCOUNT" -h "$SHARD" --pwd="$PASSWORD" -h "$SHARD" --xm=':has(.rel:val("source")) > .href' cm15 index /api/right_scripts filter[]="name==rjs:" |sed -e s/\"//g`

mkdir -p rightscript_backup
cd rightscript_backup
for i in $source_href ;
do
	script_name=`/usr/local/bin/rsc --pp -a "$ACCOUNT" --email="$EMAIL" --pwd="$PASSWORD" -h "$SHARD" --x1=.name cm15 show $i`
	/usr/local/bin/rsc --pp -a "$ACCOUNT" --email="$EMAIL" --pwd="$PASSWORD" -h "$SHARD" cm15 show_source $i > "$script_name"
done
