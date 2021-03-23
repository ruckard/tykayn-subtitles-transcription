#!/bin/bash

UNIQID=$1
URL=$2
OUTPUT="../input/ydl/$UNIQID.flac"

youtube-dl --extract-audio --audio-format flac --audio-quality 0 --output $OUTPUT $URL
mkdir ../input/ydl/$UNIQID
ffmpeg -i "../input/ydl/$UNIQID" -ac 1 "../input/ydl/'.$UNIQID.'.wav"
