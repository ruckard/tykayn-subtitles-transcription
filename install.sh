#!/bin/bash
# utilisation: bash convert_from_wav.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com

echo "########### installation de vosk avec python3, documentation: https://alphacephei.com/vosk/install "
echo " "
pip3 -v install vosk
echo "########### récupération du modèle de reconnaissance en Français sous licence aGPL, taille: 1.6Go. Choix des modèles disponibles: https://alphacephei.com/vosk/models"
echo " "
wget https://alphacephei.com/vosk/models/vosk-model-fr-0.6-linto-2.2.0.zip
unzip vosk-model-fr-0.6-linto-2.2.0.zip
mv vosk-model-fr-0.6-linto-2.2.0 models/
mv models/vosk-model-fr-0.6-linto-2.2.0 models/fr

echo "########### installation ok"
