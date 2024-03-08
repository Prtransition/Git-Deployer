# Introduction
GIT Deployer est un programme qui aide à déployer vos projets de manière efficace et sécurise.<br>
Installé dans votre projet en local et sur votre serveur, il va push vos modification sur Github, se connecter à votre serveur et pull ses modifications. Il peut gérer le versionning par branch si vous le souhaitez.


## Installation
Pour initialiser le programme veuillez suivre les étapes suivantes :

1. Cloner le projet dans votre projet en LOCAL.
2. Dans les fichier _deployPREPROD_ et _deployPROD_ modifier l'adresse de votre serveur et le chemin vers votre projet.
3. Crée votre alias pour exécuter le stript : `git config --global alias.NOM-DE-VOTRE-COMMANDE '!C:/path/to/GIT-Deployer/deployPREPROD.bat'`.
4. Déplacer le fichier _deploy.sh_ sur votre serveur à la racine de votre projet.
5. Lancer la commande `git init` pour initialiser un depot
6. Sur votre serveur, créer le remote pour connecter votre projet à Github : `git remote add github git@github.com:NOM-DE-VOTRE-REPO-GITHUB`.
7. Créer votre clé SSH si ce n'est pas déjà fait afin que Github et le serveur puisse communiquer et s'authentifier.

## Credits
_Jean-Bastien TOSTI_<br>
_Cyril PHILIPPART_
