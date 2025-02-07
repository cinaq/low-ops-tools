#!/bin/bash

set -e

echo -e "\n## Setup"
# create a temp directory
TEMP_DIR=$(mktemp -d)
echo "TEMP_DIR: $TEMP_DIR"
trap "rm -rf $TEMP_DIR" EXIT
INPUT_DIR="$TEMP_DIR/flat"
OUTPUT_DIR="$TEMP_DIR/tree"
mkdir -p $INPUT_DIR
mkdir -p $OUTPUT_DIR

echo -e "\n## Arrange"
mkdir -p $INPUT_DIR/01/11
mkdir -p $INPUT_DIR/03/11
mkdir -p $INPUT_DIR/03/14
touch $INPUT_DIR/01/11/01111111-1111-1111-1111-111111111111
touch $INPUT_DIR/01/11/01111111-1111-1111-1111-111111111112
touch $INPUT_DIR/03/11/03111111-1111-1111-1111-111111111113
touch $INPUT_DIR/03/14/03141111-1111-1111-1111-111111111114

echo -e "\n## Act"
./src/mendix-convert-l2-to-flat.sh $INPUT_DIR $OUTPUT_DIR

echo -e "\n## Assert"
echo "All files in the temp directory:"
find $TEMP_DIR -type f

echo "Files in the output directory:"
ls -l $OUTPUT_DIR/01111111-1111-1111-1111-111111111111
ls -l $OUTPUT_DIR/01111111-1111-1111-1111-111111111112
ls -l $OUTPUT_DIR/03111111-1111-1111-1111-111111111113
ls -l $OUTPUT_DIR/03141111-1111-1111-1111-111111111114
