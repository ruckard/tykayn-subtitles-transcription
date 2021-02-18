#!/bin/bash
# utilisation: bash convert_from_wav.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com

echo "########### $(date) : conversion de fichier audio .WAV mono piste uniquement,
 avec Vosk installé par pip3, et un modèle de textes en français."
echo " "
echo "########### $(date) : fichier : $file"
echo " "
python3 ./conversion_simple_fr.py "$file" > output/converted_output.txt

echo " "
echo "########### $(date) : nettoyer la sortie "
jq .text output/converted_output.txt > output/converted_cleaned_with_null.txt

sed 's/null//g' output/converted_cleaned_with_null.txt > output/converted_out_without_nulls.txt
sed 's/^ *//; s/ *$//; /^$/d' output/converted_out_without_nulls.txt > output/converted_out_without_nulls2.txt
sed 's/\"//g' output/converted_out_without_nulls2.txt > output/converted_out_without_nulls3.txt
echo "########### $(date) : OK "
echo " "
COUNT_LINES=$(cat output/converted_out_without_nulls3.txt |wc -l)
cat output/converted_out_without_nulls.txt
echo " "
echo "########### $(date) : lignes transcriptes $COUNT_LINES "
echo "########### $(date) : conversion faite dans output/converted_out_without_nulls.txt"
exit 0
