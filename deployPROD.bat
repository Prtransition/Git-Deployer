@echo off
setlocal enabledelayedexpansion

echo "######################"
echo "## Git Deployer     ##"
echo "######################"

:: Connexion SSH et exécution de deploy.sh
ssh johkvfj@ssh.cluster030.hosting.ovh.net "cd /home/johkvfj/www/residence-senior/metz/wp-content/themes/twentytwentythree && . deployPROD.sh"