#!/bin/bash


# Accept directory path as first argument, default to current directory
DIR="${1:-.}"


# Change to the target directory
cd "$DIR" || { echo "Directory not found: $DIR"; exit 1; }

# Loop over all files (ignore directories)
for file in *; do
  [ -f "$file" ] || continue  # skip if not a file

  # Extract file extension
  ext="${file##*.}"
  ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')  # convert to lowercase

  # Decide folder name based on extension
  case "$ext_lower" in
    txt) folder="Documents" ;;
    md) folder="Documents" ;;
    jpg|jpeg|png|gif|bmp) folder="Images" ;;
    zip|tar|gz|rar|7z) folder="Archives" ;;
    mp3|wav|flac) folder="Audio" ;;
    mp4|mkv|mov) folder="Videos" ;;
    pdf) folder="PDFs" ;;
    *) folder="Others" ;;  # fallback folder
  esac

  # Create the folder if it doesn't exist
  [ -d "$folder" ] || mkdir "$folder"

  # Move the file into the folder
  mv "$file" "$folder/"
done

echo "Files organized in $DIR"
