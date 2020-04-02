#!/bin/bash

# Split a JSON into multiple files. Uses jq.

file="template.json"

jq -cr 'keys[] as $k | "\($k)\t\(.[$k])"' "$file"  | awk -F\\t '{ file="files/"$1".json"; print $2 > file; close(file); }'
for filename in files/*.json; do
	name=${filename##*/}
	rename='files/'$(cat $filename | jq -r ".title")'.json'
        echo "$rename"
	jq . "$filename" > "$rename"
	rm "$filename"
done
