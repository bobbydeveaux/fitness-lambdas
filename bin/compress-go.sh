#!/bin/bash

# Exit if any of the intermediate steps fail
set -e


eval "$(jq -r '@sh "PATH=\(.path)"')"
eval "$(zip -jr $PATH/stats_lambda.zipz stats/main)"
jq 

#echo {"stats_lambda": "stats_lambda.zip"}