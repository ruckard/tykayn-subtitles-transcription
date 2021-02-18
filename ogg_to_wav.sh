#!/bin/bash
# utilisation: bash convert_from_wav.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com

echo "########### conversion des fichiers audio .ogg dans le dossier input, vers du wav mono-piste uniquement,
 avec Vosk installé par pip3, et un modèle de textes en français."
echo " "
for i in input/*.ogg; do
  ffmpeg -acodec libvorbis -i "$i" -acodec pcm_s16le "input/converted_to_wav/${i%ogg}wav"
done

echo " "
echo "########### OK "
echo " "
COUNT_LINES_OGG=$(ll input/*.ogg |wc -l)
COUNT_LINES=$(ll input/converted_to_wav |wc -l)

echo "########### fichiers ogg dans le dossier input: $COUNT_LINES_OGG "
echo "########### fichiers wav dans le dossier input: $COUNT_LINES "
echo "########### conversion faite dans output/converted_out_without_nulls.txt"
exit 0
