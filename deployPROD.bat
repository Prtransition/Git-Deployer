@echo off
setlocal enabledelayedexpansion

echo "######################"
echo "## Git Deployer     ##"
echo "## v 2.0            ##"
echo "######################"

echo "Connexion au serveur ..."
:: Connexion SSH et exécution de deploy.sh
ssh johkvfj@ssh.cluster030.hosting.ovh.net "cd /home/johkvfj/www/residence-senior/metz/wp-content/themes/ && . deployPROD.sh"