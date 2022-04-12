#!/bin/bash
# utilisation: bash transcript.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com
green=`tput setaf 2`
cyan=`tput setaf 4`
reset=`tput sgr0`

# echo -e "${green}########### $(date) installation des prérequis: jq, python3-pip ${reset}"
# echo " "
# if hash -v apt &> /dev/null
# then
#     echo "installation de JQ et python3-pip"
#     apt install jq python3-pip
# fi



echo -e "${green}########### installation de vosk avec python3, documentation: https://alphacephei.com/vosk/install ${reset}"
echo " "
echo -e "${green}########### informations sur votre système: ${reset}"
echo -e " ${cyan}"
lsb_release -a
python3 --version
pip3 --version
echo -e " ${reset}"
pip3 -v install vosk
echo "${green}########### récupération du modèle de reconnaissance en Français sous licence aGPL, taille: 1.6Go. Choix des modèles disponibles: https://alphacephei.com/vosk/models ${reset}"
echo " "
    mkdir -p models/fr
echo -e "${green}########### Procéder au téléchargement du modèle Français (1.6go) pour transcrire les textes ?${reset} (écrivez o pour oui et faites entrée pour valider) ${reset}"
read proceed

# les autres modèles sont ici https://alphacephei.com/vosk/models
if [[ $proceed == o* ]]; then
    echo "C'est parti."
    if [ ! -f "vosk-model-fr-0.6-linto-2.2.0.zip" ]; then
      wget https://alphacephei.com/vosk/models/vosk-model-fr-0.6-linto-2.2.0.zip
      echo -e "${green}########### téléchargement du modèle OK ${reset}"
      unzip vosk-model-fr-0.6-linto-2.2.0.zip
      mv vosk-model-fr-0.6-linto-2.2.0 models/fr
      echo -e "${green}########### décompression du modèle en Français OK ${reset}"
      ls -l models/fr
    else
      echo "fichier zip vosk-model-fr-0.6-linto-2.2.0.zip déjà présent"
    fi
else
    echo -e "${green}########### vous n'avez pas souhaité télécharger le modèle ${reset}"
    echo -e "${green}########### fin de l'installation sans télécharger de modèle de langue ${reset}"
    exit 0
fi



echo  -e "${green}########### installation ok ${reset}"
