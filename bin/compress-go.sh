#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

export PATH="$PATH:/usr/local/bin"

eval "$(jq -r '@sh "LAMBDA_PATH=\(.lambda_path)"')"

zip -jr $LAMBDA_PATH/stats_lambda.zip $LAMBDA_PATH/main > /dev/null && echo '{}'


#echo {"stats_lambda": "stats_lambda.zip"}