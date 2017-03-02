#!/bin/bash -e
# Author: Rudel Saldivar
# Description: Grab the right_st binary in https://github.com/rightscale/right_st and copy to /usr/local/bin

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root or use sudo ./setup_right_st.sh"
   exit 1
fi

OS=`uname`
if [ ${OS} == 'Linux' ]; then
        echo "Linux OS detected, downloading Linux binary.."
        echo ""
        # uncomment to use master branch
        #curl https://binaries.rightscale.com/rsbin/right_st/v1/right_st-linux-amd64.tgz | tar -zxf - -O rsc/rsc > rsc
        curl https://binaries.rightscale.com/rsbin/right_st/v1/right_st-linux-amd64.tgz | tar -zvxf - -O right_st/right_st > right_st
        chmod +x ./right_st
else
  # Assume it's a MAC
  echo "Downloading MAC/Darwin binary.."
  curl https://binaries.rightscale.com/rsbin/right_st/v1/right_st-darwin-amd64.tgz | tar -zvxf - -O right_st/right_st > right_st
  chmod +x ./right_st
fi

echo "copying right_st to /usr/local/bin"
mv right_st /usr/local/bin

#echo "right_st binary location is `which right_st`"
/usr/local/bin/right_st --version
echo "Done..."
