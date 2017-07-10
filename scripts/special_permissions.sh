#!/bin/bash
# Special Permissions required by API

api_base="/opt/Test/api_"
version=`cat /opt/Test/version.md`

if [[ $version == *"."* ]]; then
version=`sed 's/\./\_/g' <<< $version `
fi
version_folder="$api_base$version"

rsync -a /opt/Test/api_version/ $version_folder

if [ -d "$version_folder" ]; then
chmod -R 777 $version_folder/public/userimages
chmod -R 777 $version_folder/storage/
chmod -R 777 $version_folder/bootstrap/cache
chown -R www-data:www-data $version_folder
fi
