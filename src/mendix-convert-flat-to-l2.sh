#! /bin/bash

set -e

INPUT_DIR=$1
OUTPUT_DIR=$2

echo "INPUT_DIR: $INPUT_DIR"
echo "OUTPUT_DIR: $OUTPUT_DIR"

all_files=$(ls $INPUT_DIR)

for file in $all_files; do
    echo "Processing $file..."
    # ensure the filename is the format of uuid
    filename=$(basename -- "$file")
    if [[ ! $filename =~ ^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$ ]]; then
        echo "Invalid filename: $filename"
        continue
    fi
    level1=${filename:0:2}
    level2=${filename:2:2}
    dir_path="$OUTPUT_DIR/$level1/$level2"
    mkdir -p $dir_path
    cp $INPUT_DIR/$file $dir_path/$filename
done
