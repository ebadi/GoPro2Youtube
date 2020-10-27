#!/bin/bash


videodir=$1

# git clone https://github.com/starcraftman/gopro-merge.git
# cd gopro-merge
# git reset --hard 5ce4513ca3ee3f086a8bcb04c60169f3f049eaa7

python3 gopro-merge/concat_go.py  $videodir


