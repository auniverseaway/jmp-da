#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 fr_fr (or other locale)"
  exit 1
fi

# Output file
output_file="$1_sitemap.txt"
input_file="$1_sitemap.xml"

wget -O "$input_file" "https://www.jmp.com/$1/sitemap/sitemap.xml"
# Extract URLs from the sitemap XML and save to the output file
grep -oP '(?<=<loc>).*?(?=</loc>)' "$input_file" > "$output_file"

echo "URLs have been extracted to $output_file"
