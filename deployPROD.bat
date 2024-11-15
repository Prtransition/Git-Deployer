@echo off
setlocal enabledelayedexpansion

echo "######################"
echo "## Git Deployer     ##"
echo "######################"

:: Connexion SSH et exécution de deploy.sh
ssh piol4306@109.234.166.16 "cd /home/piol4306/prod/web/app/themes/seniortransition && . deployPROD.sh !branch!"
