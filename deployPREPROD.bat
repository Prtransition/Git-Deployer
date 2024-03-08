@echo off
setlocal enabledelayedexpansion

echo "######################"
echo "## Git Deployer     ##"
echo "## v 2.0            ##"
echo "######################"

set /p message= Mettre un message pour enregistrer le commit : 
git add .
git commit -m "!message!"
for /f "tokens=* delims=" %%i in ('git branch --show-current') do (
    set branch=%%i
)
git rev-parse --abbrev-ref --symbolic-full-name @{u} >nul 2>&1
if %errorlevel% neq 0 (
    echo NOUVELLE BRANCHE
    git push --set-upstream github !branch!
    
) else (
    git push github !branch!
)

echo "Connexion au serveur ..."
:: Connexion SSH et exécution de deploy.sh
ssh johkvfj@ssh.cluster030.hosting.ovh.net "cd /home/johkvfj/www/residence-senior/metz/preprod/wp-content/themes/twentytwentythree && . deployPREPROD.sh !branch!"