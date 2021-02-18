#!/bin/bash
# utilisation: bash convert_from_wav.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com

echo "########### conversion de fichier audio .WAV mono piste uniquement,
 avec Vosk installé par pip3, et un modèle de textes en français."
echo " "
# if [-f $1]
# 	echo " fichier non trouvé: $1"
# 	ls -larth input
# 	exit 1
# fi
python3 ./conversion_simple_fr.py $1 > output/converted_output.txt

echo " "
echo "########### nettoyer la sortie "
echo " "
jq .text output/converted_output.txt > output/converted_cleaned_with_null.txt

sed 's/null//g' output/converted_cleaned_with_null.txt > output/converted_out_without_nulls.txt
sed 's/^ *//; s/ *$//; /^$/d' output/converted_out_without_nulls.txt > output/converted_out_without_nulls2.txt
sed 's/\"//g' output/converted_out_without_nulls2.txt > output/converted_out_without_nulls3.txt

echo " "
echo "########### OK "
echo " "
COUNT_LINES=$(cat output/converted_out_without_nulls3.txt |wc -l)

echo "########### lignes transcriptes $COUNT_LINES "
echo "########### conversion faite dans output/converted_out_without_nulls.txt"
exit 0
