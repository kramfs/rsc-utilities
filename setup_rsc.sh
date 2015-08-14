#!/bin/bash -e
# Grab the rsc binary in https://github.com/rightscale/rsc and copy to /usr/local/bin
# By: Rudel Saldivar

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root or use sudo ./setup_rsc.sh"
   exit 1
fi

OS=`uname`
if [ ${OS} == 'Linux' ]; then
	echo "Linux OS detected, downloading linux binary.."
	echo ""
	# uncomment to use master branch
	#curl https://binaries.rightscale.com/rsbin/rsc/master/rsc-linux-amd64.tgz | tar -zxf - -O rsc/rsc > rsc
	curl https://binaries.rightscale.com/rsbin/rsc/v3/rsc-linux-amd64.tgz | tar -zxf - -O rsc/rsc > rsc
	chmod +x ./rsc
else
  # Assume it's a MAC
  echo "Downloading MAC/Darwin binary.."
  curl https://binaries.rightscale.com/rsbin/rsc/v3/rsc-darwin-amd64.tgz | tar -zxf - -O rsc/rsc > rsc
  chmod +x ./rsc
fi

echo "copying rsc to /usr/local/bin"
mv rsc /usr/local/bin

#echo "rsc binary location is `which rsc`"
#rsc --version
echo "Done..."

