#! /bin/bash

set -e

INPUT_DIR=$1
OUTPUT_DIR=$2

echo "INPUT_DIR: $INPUT_DIR"
echo "OUTPUT_DIR: $OUTPUT_DIR"

all_files=$(find $INPUT_DIR -type f)

for file in $all_files; do
    echo "Processing $file..."
    # ensure the filename is the format of uuid
    filename=$(basename -- "$file")
    if [[ ! $filename =~ ^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$ ]]; then
        echo "Invalid filename: $filename"
        continue
    fi
    dir_path="$OUTPUT_DIR/"
    mkdir -p $dir_path
    cp $file $dir_path/$filename
done
