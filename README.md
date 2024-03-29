# Introduction
GIT Deployer est un programme qui aide à déployer vos projets de manière efficace et sécurise.<br>
Installé dans votre projet en local et sur votre serveur, il va push vos modification sur Github, se connecter à votre serveur et pull ses modifications. Il peut gérer le versionning par branch si vous le souhaitez.


## Installation
Pour initialiser le programme veuillez suivre les étapes suivantes :

1. Cloner le projet dans votre projet en LOCAL.
2. Dans les fichier _deployStaging_ et _deployPROD_ modifier l'adresse de votre serveur et le chemin vers votre projet.
3. Lancer la commande `git init` pour initialiser un depot
4. Crée votre alias pour exécuter le stript : `git config --global alias.NOM-DE-VOTRE-COMMANDE '!C:/path/to/GIT-Deployer/deployStaging.bat'`.
5. Créer le remote pour connecter votre projet local à Github : `git remote add github git@github.com:NOM-DE-VOTRE-REPO-GITHUB`
6. Déplacer le fichier _deploy.sh_ sur votre serveur à la racine de votre projet.
7. Sur votre serveur, lancer la commande `git init` et créer le remote pour connecter votre projet à Github : `git remote add github git@github.com:NOM-DE-VOTRE-REPO-GITHUB`.
8. Créer votre clé SSH si ce n'est pas déjà fait afin que Github et le serveur puisse communiquer et s'authentifier.

# Changlogs

## v2.1 - 08/03/2024
- Ajout de couleur dans le terminal

## v2.1.1 - 08/03/2024
- Fix couleur terminal fichier _deployPROD_
- Suppression "header" fichier _deployPROD_
- Ajout verification en cas de push sur la PROD
- Changement message de connexion au serveur

## v2.1.2 - 29/03/2024
- Modification nom dossier
- Ajustement TUTO d'installation

### Credits
_Jean-Bastien TOSTI_<br>
_Cyril PHILIPPART_
