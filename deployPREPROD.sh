#!/bin/bash

LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m'

# Récupérer le nom de la branche passée en argument
branch_name="$1"

# Récupérer le nom de la branche actuelle sur le serveur
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Récupérer la liste des branches distantes
git fetch --prune --quiet
remote_branches=$(git branch -r)

# Vérifier si la branche locale existe dans la liste des branches distantes
if echo "$remote_branches" | grep -q "/$branch_name$"; then
    echo -e "${LIGHT_BLUE}GIT Deployer pull la branche $branch_name du repository distant.${NC}"
    # Comparer la branche actuelle avec la branche passée en argument
    if [ "$current_branch" != "$branch_name" ]; then
        echo -e "${LIGHT_BLUE}ATTENTION, vous êtes sur la branche $current_branch. Basculement vers la branche $branch_name ...${NC}"
        git checkout "$branch_name"
    fi
else
    echo -e "${LIGHT_BLUE}NOUVELLE BRANCHE sur le serveur distant détéctée.${NC}"
    echo -e "${LIGHT_BLUE}Création de la branche $branch_name ...${NC}"
    git branch "$branch_name"
    git checkout "$branch_name"
fi

# Effectuer un git pull depuis la branche distante
git pull github "$branch_name"
echo -e "${LIGHT_GREEN}Done.${NC}"
echo -e "${LIGHT_GREEN}Projet synchronisé et à jour.${NC}"

