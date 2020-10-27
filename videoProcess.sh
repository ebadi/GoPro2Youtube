#!/bin/bash

#Ubutnu 18.04
#sudo add-apt-repository ppa:jonathonf/ffmpeg-4
#sudo apt update
#sudo apt install ffmpeg -y

videodir=$1



# git clone https://github.com/starcraftman/gopro-merge.git
# cd gopro-merge
# git reset --hard 5ce4513ca3ee3f086a8bcb04c60169f3f049eaa7

python3 gopro-merge/concat_go.py  $videodir

#range=" -t 5 " # only the first 5 seconds, for debugging
audio=" -an "  # removes audio

for videofile in $videodir/*.MP4; do
    [ -f "$videofile" ] || break
    echo "======[ Processing: " $videofile "]========"
    ffmpeg $range -i $videofile -vf vidstabdetect=shakiness=5:show=1 -f null - 
    ffmpeg $range -i $videofile -y -vf vidstabtransform,unsharp=5:5:0.8:3:3:0.4 $audio $videofile-stab.mp4
    rm transforms.trf
done




