#!/bin/bash
# utilisation: bash webm_to_wav.sh
# auteur du script: tykayn contact@cipherbliss.com

echo "########### conversion des fichiers audio .webm placés dans le dossier input, vers du wav mono-piste uniquement dans le dossier input/converted_to_wav"
echo " "
cd input
mkdir already_converted



echo " "
echo "########### OK "
echo "########### fichiers webm restant dans le dossier input "
ls -l *.webm
cd ..
echo " "
COUNT_LINES_ORIGIN=$(ls -l input/*.webm |wc -l)
COUNT_LINES=$(ls -l input/converted_to_wav |wc -l)

echo "########### fichiers webm dans le dossier input: $COUNT_LINES_ORIGIN "
echo "########### fichiers wav dans le dossier input/converted_to_wav: $COUNT_LINES "
echo "########### conversion faite dans output/converted_out_without_nulls.txt"
exit 0
