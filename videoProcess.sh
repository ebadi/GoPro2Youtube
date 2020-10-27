#!/bin/bash

#Ubutnu 18.04
#sudo add-apt-repository ppa:jonathonf/ffmpeg-4
#sudo apt update
#sudo apt install ffmpeg -y

videodir=$1

#range=" -t 5 " # only the first 5 seconds, for debugging
audio=" -an "  # removes audio

for videofile in $videodir/*.MP4; do
    [ -f "$videofile" ] || break
    echo "======[ Processing: " $videofile "]========"
    ffmpeg $range -i $videofile -vf vidstabdetect=shakiness=5:show=1 -f null - 
    ffmpeg $range -i $videofile -y -vf vidstabtransform,unsharp=5:5:0.8:3:3:0.4 $audio $videofile-stab.mp4
    rm transforms.trf
done




