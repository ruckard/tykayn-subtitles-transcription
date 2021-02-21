#!/bin/bash
# utilisation: bash ogg_to_wav.sh
# auteur du script: tykayn contact@cipherbliss.com

echo "########### conversion des fichiers audio .ogg placés dans le dossier input, vers du wav mono-piste uniquement dans le dossier input/converted_to_wav"
echo " "
cd input
mkdir already_converted

for i in *.ogg; do

    echo "fichier à traiter: $i"
    ffmpeg -i "$i" -ac 1 "converted_to_wav/${i%ogg}wav"

    echo " converti en WAv, déplacement dans le dossier input/already_converted"
    mv "$i" already_converted/
done


echo " "
echo "########### OK "
echo "########### fichiers ogg restant dans le dossier input "
ls -l *.ogg
cd ..
echo " "
COUNT_LINES_ORIGIN=$(ls -l input/*.ogg |wc -l)
COUNT_LINES=$(ls -l input/converted_to_wav |wc -l)

echo "########### fichiers ogg dans le dossier input: $COUNT_LINES_ORIGIN "
echo "########### fichiers wav dans le dossier input/converted_to_wav: $COUNT_LINES "
echo "########### conversion faite dans output/converted_out_without_nulls.txt"
exit 0
