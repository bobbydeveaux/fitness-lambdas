#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

GOOS=linux go build -o stats/main stats/main.go 
zip -jr stats/stats_lambda.zip stats/main
terraform apply -auto-approve