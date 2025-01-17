#!/bin/bash

scrDir=`dirname "$(realpath "$0")"`

if [ $# -eq 0 ] ; then
	echo "usage: ./batch.sh <movieDir> <sourceDirSubs> <movieExtension> <optional:alassDir>"
	exit 1
else
  movieDir="$1"
  subDir="$2"
  movieExtension="$3"
  alassDir="${scrDir}/$4"
fi

if [ ! -z "$alassDir" ]; then
  chmod +x "$alassDir"
fi

if [ $(which alass &>/dev/null) ]; then
  alassDir=$(which alass)
elif [ -f "alass-linux64" ]; then
  alassDir="${scrDir}/alass-linux64"
  chmod +x "$alassDir"
else
  echo "Set the directory to the alass excecutable, by setting the optional alassDir option"
  exit 1
fi


if [ ! -d ./output ]; then 
  mkdir ./output
fi

cd "$movieDir"

for video_file in $(ls | grep ".${movieExtension}"); do
  base_name=$(basename "${video_file}" | sed 's/\(.*\)\..*/\1/')
  
  subtitle_file="${subDir}/${base_name}.srt"
  
  if [ ! -f "${movieDir}/${base_name}.srt" ]; then
    cp "${subDir}/${base_name}.srt" "$movieDir"
  fi


  iconv -f $(file -i "${base_name}.srt" | awk -F 'charset=' '{print $2}') -t UTF-8 "${base_name}.srt" -o "${base_name}.srt"

  "$alassDir" "$(basename "${video_file}")" "${base_name}.srt" "out.srt" 

  mv "out.srt" "${scrDir}/output/${base_name}.srt"
  rm "${base_name}.srt"

  cd "$movieDir"


done
