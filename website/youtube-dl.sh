#!/bin/bash
touch log_ydl.txt
echo " $(date) ###### start conversion __ $1 __ $2" >> log_ydl.txt
UNIQID=$1

# mkdir -p ../input/ydl
# rm -rf ../input/ydl/$UNIQID.mp3
# rm -rf ../input/ydl/$UNIQID

URL=$2
OUTPUT="../input/ydl/$UNIQID/base.mp3"

echo " \n output : \n"
echo $OUTPUT

mkdir ../input/ydl/$UNIQID
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --output $OUTPUT $URL --no-continue

ls -larth ../input/ydl/$UNIQID

ffmpeg -i "../input/ydl/$UNIQID/base.mp3" -ac 1 "../input/ydl/$UNIQID/mono_canal.wav"

OUT_DIR="input/ydl/$UNIQID"
mkdir $OUT_DIR

echo " $(date) ###### lancer la transcription"
pwd
ls -larth input/ydl/$UNIQID/
echo "\n"
 
cd ..
bash transcript.sh input/ydl/$UNIQID/mono_canal.wav

#jq .text  $OUT_DIR/0_output_$FILE_NAME.json > $OUT_DIR/1_converted_$FILE_NAME.txt
#	sed 's/null//g' $OUT_DIR/1_converted_$FILE_NAME.txt > $OUT_DIR/2_without_nulls_$FILE_NAME.txt
#	sed 's/^ *//; s/ *$//; /^$/d' $OUT_DIR/2_without_nulls_$FILE_NAME.txt > $OUT_DIR/3_without_nulls_$FILE_NAME.txt
#	sed 's/\"//g' $OUT_DIR/3_without_nulls_$FILE_NAME.txt > $OUT_DIR/4_phrases_$FILE_NAME.txt

ls -l $OUT_DIR >> log_ydl.txt
echo " $(date) ###### end conversion __ $1 __ $2" >> log_ydl.txt

