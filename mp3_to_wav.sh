#!/bin/bash
# utilisation: bash convert_from_wav.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com

echo "########### conversion des fichiers audio .ogg placés dans le dossier input, vers du wav mono-piste uniquement"
echo " "
for i in input/*.mp3; do
  ffmpeg -acodec libvorbis -i "$i" -acodec pcm_s16le "input/converted_to_wav/${i%mp3}wav"
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
