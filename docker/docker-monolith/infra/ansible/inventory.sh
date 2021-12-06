#!/bin/bash
if [ "$1" = "--list" ]
then
app="app"
db="db"
tf_env=" /var/otus/ktvGIT_microservices/docker-monolith/infra/terraform"
appserver=`cd $tf_env && terraform output | grep -E -o "(.*$app.*)([0-9]{1,3}[\.]){3}[0-9]{1,3}" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`
dbserver=`cd $tf_env && terraform output | grep -E -o "(.*$db.*)([0-9]{1,3}[\.]){3}[0-9]{1,3}" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`



# echo $appserver
# echo $dbserver

sudo sed -i.bak1 -r 's/"(.*appserver.*)(ansible_host":.*)"/"appserver": {"ansible_host": "'$appserver'"/g' inventory_dinamic.json
sudo sed -i.bak2 -r 's/"(.*dbserver.*)(ansible_host":.*)"/"dbserver": {"ansible_host": "'$dbserver'"/g' inventory_dinamic.json
cat inventory_dinamic.json
fi
