#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

export PATH="$PATH:/usr/local/bin/go"

eval "$(jq -r '@sh "PATH=\(.path)"')"
GOOS=linux go build -o $PATH/main $PATH/main.go 