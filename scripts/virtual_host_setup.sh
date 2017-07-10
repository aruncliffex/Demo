#!/bin/bash
api_base="/opt/Test/api_"
version=`cat /opt/Test/version.md`
ver=`sed 's/\./\_/g' <<< $version `
version_folder="$api_base$ver"

sed -i "s/version_name/$version/" $version_folder/scripts/liveapi.thekroo.com.conf 
sed -i "s/version_folder/api_$ver/g"  $version_folder/scripts/liveapi.thekroo.com.conf

cp  $version_folder/scripts/liveapi.thekroo.com.conf /etc/apache2/sites-available/liveapi.$version.thekroo.com.conf
a2ensite liveapi.$version.thekroo.com.conf

service apache2 reload

