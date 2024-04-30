@echo off
setlocal enabledelayedexpansion

echo "######################"
echo "## Git Deployer     ##"
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
    git push --set-upstream origin !branch!
    
) else (
    git push origin !branch!
)

set /p continue="Voulez-vous deployer vos modifications sur le site Staging ? (y/n) : "
if /i "!continue!"=="n" (
    echo Ok.
    exit /b
)

:: Connexion SSH et exécution de deploy.sh
ssh seniortr@ssh.cluster006.hosting.ovh.net "cd /homez.726/seniortr/www/staging/web/app/themes/seniortransition && . deployStaging.sh !branch!"