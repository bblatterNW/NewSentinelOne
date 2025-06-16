#!/bin/sh
siteToken="eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMjAuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogIjBkYjU0NDgwN2IwZjgyOGYifQ=="
installerurl="https://github.com/Workman-Nydegger-IT/SentinelOne-Installer/blob/main/Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830.pkg"
installer="Sentinel-Release-24-4-1-7830_macos_v24_4_1_7830.pkg"
dir="/tmp/"
tokenfile="com.sentinelone.registration-token"

if [ -d /Applications/SentinelOne/ ];
then
  echo "SentinelOne is already Installed"
  exit 0

else
#Download installer into tmp directory
curl -L -o $dir$installer $installerurl

#Create Site Token File
echo $siteToken > $dir$tokenfile

#Install Agent
sudo /usr/sbin/installer -pkg $dir$installer -target /

#Cleanup token file
rm -f $dir$tokenfile
exit 0
fi