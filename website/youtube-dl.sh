#!/bin/bash

UNIQID=$1

mkdir -p ../input/ydl
rm -rf ../input/ydl/$UNIQID.mp3
rm -rf ../input/ydl/$UNIQID

URL=$2
OUTPUT="../input/ydl/$UNIQID.mp3"

youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --output $OUTPUT $URL
mkdir ../input/ydl/$UNIQID
ffmpeg -i "../input/ydl/$UNIQID.mp3" -ac 1 "../input/ydl/$UNIQID/$UNIQID.wav"

cd ..
OUT_DIR="input/ydl/$UNIQID"
python3 ./conversion_simple_fr.py "input/ydl/$UNIQID/$UNIQID.wav" >  $OUT_DIR/0_output_$FILE_NAME.json
jq .text  $OUT_DIR/0_output_$FILE_NAME.json > $OUT_DIR/1_converted_$FILE_NAME.txt
	sed 's/null//g' $OUT_DIR/1_converted_$FILE_NAME.txt > $OUT_DIR/2_without_nulls_$FILE_NAME.txt
	sed 's/^ *//; s/ *$//; /^$/d' $OUT_DIR/2_without_nulls_$FILE_NAME.txt > $OUT_DIR/3_without_nulls_$FILE_NAME.txt
	sed 's/\"//g' $OUT_DIR/3_without_nulls_$FILE_NAME.txt > $OUT_DIR/4_phrases_$FILE_NAME.txt
