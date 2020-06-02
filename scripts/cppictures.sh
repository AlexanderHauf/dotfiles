# !/bin/sh

# This script copies some screenshots into the documents folder

SOURCE=$HOME/Bilder/Screenshot*
TARGET=$HOME/Dokumente/Screenshots

mkdir $TARGET
cp -n $SOURCE $TARGET
