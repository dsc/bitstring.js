#!/bin/bash
set -e

coco --compile `find . -not -name '*.json.co' -name '*.co'`

coco --json --stdin < package.json.co | sed -E 's!("main": *"./bitstring)!\1.js!g' > package.json
cp package.json bower.json
cp package.json component.json

