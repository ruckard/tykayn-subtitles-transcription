#!/bin/bash
# utilisation: bash mp4_to_wav.sh
# auteur du script: tykayn contact@cipherbliss.com

echo "########### conversion des fichiers audio .mp4 placés dans le dossier input, vers du wav mono-piste uniquement dans le dossier input/converted_to_wav"
echo " "
cd input
mkdir already_converted

for i in *.mp4; do

    echo "fichier à traiter: $i"
    ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%mp4}wav"

    echo " converti en WAv, déplacement dans le dossier input/already_converted"
    mv "$i" already_converted/
done


echo " "
echo "########### OK "
echo "########### fichiers mp4 restant dans le dossier input "
ls -l *.mp4
cd ..
echo " "
COUNT_LINES_ORIGIN=$(ls -l input/*.mp4 |wc -l)
COUNT_LINES=$(ls -l input/converted_to_wav |wc -l)

echo "########### fichiers mp4 dans le dossier input: $COUNT_LINES_ORIGIN "
echo "########### fichiers wav dans le dossier input/converted_to_wav: $COUNT_LINES "
echo "########### conversion faite dans output/converted_out_without_nulls.txt"
exit 0
