#!/bin/bash
##
#from tools.net
#run the script as root
echo "installing sh2log "
dlurl='http://packetstorm.foofus.com/UNIX/loggers/sh2log-1.0.tgz'
echo "Fetching from"$dlurl
wget $dlurl
tar zxf sh2log-1.0.tgz
cd sh2log-1.0
DIS=`head /etc/issue -n 1|awk '{print $1}'`
if [ $DIS = "CentOS" ];then
yum install libX11-devel
elif [ $DIS = "Ubuntu" ] ; then
apt-get install -y libx11-dev
fi
make linux
mkdir /bin/shells/
cp -p /bin/sh /bin/shells/
cp -p /bin/bash /bin/shells/
rm -rf /bin/sh /bin/bash
cp -p sh2log /bin/sh
cp -p sh2log /bin/bash
./sh2logd