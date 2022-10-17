#!/bin/bash
sudo apt install imagemagick #installing the imagemagick library - should be done in command line directly

#check if there are any arguments
if [ $# -eq 0 ]
then
echo "no arguments"
exit 1 #if no, exit 
fi

name=$1 #first argument of the command line is a name of the original file
size=100 #default size is 100

#check if the amount of arguments is greater or equal 2
if [ $# -ge 2 ] 
then
size=$2 #if yes put the size into "size' variable
fi

echo "name: $name" #for tests
echo "size: $size" #for tests

newFile="${name%.*}$size.${name##*.}" #name of the file is created by extracting the name of the original file + size + the extension of the original file
touch $newFile #create new file
echo "newFile: $newFile" #for tests

convert $name -resize $size $newFile #applying the convert command from imagemagick

#to develop: give the user the possibility to change the file name