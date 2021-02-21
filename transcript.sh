#!/bin/bash
# utilisation: bash transcript.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com

echo "########### $(date) : conversion de fichier audio .WAV mono piste uniquement,
 avec Vosk installé par pip3, et un modèle de textes en français."
echo " "
echo "########### $(date) : fichier : $file"

FOLDER_MODEL="fr"

# existence du modèle demandé
if [ -d "models/$FOLDER_MODEL" ]; then
    echo "models/$FOLDER_MODEL le modèle est bien présent."
else
  pwd
  ls -l models
  echo " "
  echo "########### $(date) : [ERREUR] le modèle de données dans models/$FOLDER_MODEL n'existe pas, vérifiez son installation :C peut être avez vous oublié de faire une commande 'make'"

  exit 1
fi
# existence du fichier demandé
if [ -f "$file" ]; then
    echo "$file exists."
else
  echo "########### $(date) : [ERREUR] voici les fichiers disponibles dans input/converted_to_wav: "
  ls -l input/converted_to_wav
  echo "########### $(date) : [ERREUR] le fichier $file n'existe PAS :C "
  exit 1
fi
echo " "
FILE_NAME=$(basename $file .wav)
OUT_DIR=$( echo "output/$FILE_NAME")
mkdir output/$FILE_NAME

python3 ./conversion_simple_fr.py "$file" >  $OUT_DIR/0_output.json



echo " "
echo "########### $(date) : nettoyer la sortie "
jq .text  $OUT_DIR/0_output_$FILE_NAME.json > $OUT_DIR/1_converted_$FILE_NAME.txt

sed 's/null//g' $OUT_DIR/1_converted_$FILE_NAME.txt > $OUT_DIR/2_without_nulls_$FILE_NAME.txt
sed 's/^ *//; s/ *$//; /^$/d' $OUT_DIR/2_without_nulls_$FILE_NAME.txt > $OUT_DIR/3_without_nulls_$FILE_NAME.txt
sed 's/\"//g' $OUT_DIR/3_without_nulls_$FILE_NAME.txt > $OUT_DIR/4_phrases_$FILE_NAME.txt
echo "########### $(date) : OK "
echo " "
COUNT_LINES=$(cat $OUT_DIR/4_phrases_$FILE_NAME.txt |wc -l)
cat $OUT_DIR/4_phrases_$FILE_NAME.txt
echo " "
echo "########### $(date) : lignes transcriptes $COUNT_LINES "
echo "########### $(date) : conversion faite dans output/converted_out_without_nulls.txt"
echo "########### $(date) : conversion de la sortie en pseudo fichier de sous titres"
perl clean.sh $OUT_DIR/0_output_$FILE_NAME.json > $OUT_DIR/5_phrases_min_sec_$FILE_NAME.txt
cat $OUT_DIR/5_phrases_min_sec.srt

echo "########### $(date) : conversion de la sortie en fichier de sous titres "
python3 ./extract_srt.py "$file" >  $OUT_DIR/5_output_$FILE_NAME.srt

ls -l $OUT_DIR

echo "########### $(date) : conversion faite "
exit 0
