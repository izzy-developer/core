#! /bin/bash
PRESENTDIR=$(pwd)
if [ ! -d /shared/izzy ] ; then
	git clone -b "$GITBRANCH" --depth 1 "$GITURI" /shared
	if [ -d /shared/izzy ] ; then
  		cd /shared/izzy/
  		./autogen.sh
  		./configure --disable-zerocoin --without-gui --enable-debug
  		make
  		make install
  		mkdir /root/.izzy
  		cp /root/izzy.conf /root/.izzy/izzy.conf
  		cd $PRESENTDIR
	else
  		echo "There was a problem with the clone"
	fi
else
	echo "/shared is not empty, should you be running pbr.sh?"	
fi
