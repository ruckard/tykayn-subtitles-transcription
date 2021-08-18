#!/bin/bash
# utilisation: bash inputs_to_wav.sh
# auteur du script: tykayn contact@cipherbliss.com

echo "########### conversion des fichiers audio (mkv, mp3, mp4, ogg, webm, wav, avi) placés dans le dossier input, vers du wav mono-piste uniquement dans le dossier input/converted_to_wav"
echo " "

cd input

if -f already_converted; then
  mkdir already_converted
fi

for i in *.avi; do
  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%avi}wav"

  echo " converti en WAV, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done


for i in *.flac; do
  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%flac}wav"

  echo " converti en WAV, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done

for i in *.mkv; do

  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%mkv}wav"

  echo " converti en WAv, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done

for i in *.mp3; do

  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%mp3}wav"

  echo " converti en WAv, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done

for i in *.mp4; do

  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%mp4}wav"

  echo " converti en WAv, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done

for i in *.ogg; do

  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%ogg}wav"

  echo " converti en WAv, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done

for i in *.webm; do

  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%webm}wav"

  echo " converti en WAv, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done

for i in *.wav; do

  echo "fichier à traiter: $i"
  ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%wav}wav"

  echo " converti en WAv, déplacement dans le dossier input/already_converted"
  mv "$i" already_converted/
done


COUNT_LINES=$(ls -l input/converted_to_wav | wc -l)
echo "########### fichiers wav dans le dossier input/converted_to_wav: $COUNT_LINES "
echo "########### conversion faite dans output/converted_out_without_nulls.txt"
exit 0
