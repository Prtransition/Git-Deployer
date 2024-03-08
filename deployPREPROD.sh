#!/bin/bash
# Récupérer le nom de la branche passée en argument
branch_name="$1"

# Récupérer le nom de la branche actuelle sur le serveur
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Récupérer la liste des branches distantes
git fetch --prune --quiet
remote_branches=$(git branch -r)

# Vérifier si la branche locale existe dans la liste des branches distantes
if echo "$remote_branches" | grep -q "/$branch_name$"; then
    echo "GIT Deployer pull la branche $branch_name du repository distant."
    # Comparer la branche actuelle avec la branche passée en argument
    if [ "$current_branch" != "$branch_name" ]; then
        echo "ATTENTION, vous êtes sur la branche $current_branch. Basculement vers la branche $branch_name ..."
        git checkout "$branch_name"
    fi
else
    echo "NOUVELLE BRANCHE sur le serveur distant détéctée."
    echo "Création de la branche $branch_name ..."
    git branch "$branch_name"
    git checkout "$branch_name"
fi

# Effectuer un git pull depuis la branche distante
git pull github "$branch_name"
