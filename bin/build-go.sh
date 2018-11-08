#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

export PATH="$PATH:/usr/local/bin"

eval "$(jq -r '@sh "LAMBDA_PATH=\(.lambda_path)"')"
GOOS=linux go build -o $LAMBDA_PATH/main $LAMBDA_PATH/main.go && echo "{}"