#!/bin/bash

LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
LIGHT_RED='\033[1;31m'
NC='\033[0m'
echo -e "${LIGHT_BLUE}Connexion au serveur établie !${NC}"
# Demander la confirmation avant le push
echo -ne "${LIGHT_BLUE}Vous êtes sur le point de mettre à jour le site en PRODUCTION, voulez-vous continuer ? (yes/no) ${NC}"
read answer
if [ "$answer" != "yes" ]; then
    echo -e "${LIGHT_RED}Opération annulée.${NC}"
    exit 0
fi

git pull github master
echo -e "${LIGHT_GREEN}Done.${NC}"
echo -e "${LIGHT_GREEN}Projet synchronisé et à jour.${NC}"
