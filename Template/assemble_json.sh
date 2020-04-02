#!/bin/bash

# Split a JSON into multiple files. Uses jq.

file="template-out.json"

jq -s . files/*.json > $file
