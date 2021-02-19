#!/bin/bash
# utilisation: bash transcript.sh MONFICHIER.wav
# auteur du script: tykayn contact@cipherbliss.com

echo "########### $(date) : conversion de fichier audio .WAV mono piste uniquement,
 avec Vosk installé par pip3, et un modèle de textes en français."
echo " "
echo "########### $(date) : fichier : $file"
echo " "
FILE_NAME=$(basename $file .wav)
OUT_DIR=$( echo "output/$FILE_NAME")
mkdir output/$FILE_NAME

python3 ./conversion_simple_fr.py "$file" >  $OUT_DIR/0_output.json



echo " "
echo "########### $(date) : nettoyer la sortie "
jq .text  $OUT_DIR/0_output.json > $OUT_DIR/1_converted.txt

sed 's/null//g' $OUT_DIR/1_converted.txt > $OUT_DIR/2_without_nulls.txt
sed 's/^ *//; s/ *$//; /^$/d' $OUT_DIR/2_without_nulls.txt > $OUT_DIR/3_without_nulls.txt
sed 's/\"//g' $OUT_DIR/3_without_nulls.txt > $OUT_DIR/4_phrases.txt
echo "########### $(date) : OK "
echo " "
COUNT_LINES=$(cat $OUT_DIR/phrases.txt |wc -l)
cat $OUT_DIR/4_phrases.txt
echo " "
echo "########### $(date) : lignes transcriptes $COUNT_LINES "
echo "########### $(date) : conversion faite dans output/converted_out_without_nulls.txt"
echo "########### $(date) : conversion de la sortie en pseudo fichier de sous titres"
perl clean.sh $OUT_DIR/0_output.json > $OUT_DIR/5_phrases_min_sec.txt
cat $OUT_DIR/5_phrases_min_sec.srt

echo "########### $(date) : conversion de la sortie en fichier de sous titres "
python3 ./extract_srt.py "$file" >  $OUT_DIR/5_output.srt

ls -l $OUT_DIR

echo "########### $(date) : conversion faite "
exit 0
