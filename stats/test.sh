#!/bin/bash
GOOS=linux go build main.go && \
docker run --rm --env-file ~/.aws/docker_credentials -v $PWD:/var/task lambci/lambda:go1.x main '{
    "body": "eyJ0ZXN0IjoiYm9keSJ9",
	"resource": "/{proxy+}",
	"path": "/path/to/resource",
	"httpMethod": "POST",
	"isBase64Encoded": true,
	"queryStringParameters": {
		"height": "71",
		"waist": "31",
		"neck": "15",
		"hip": "0",
		"mass": "76",
		"bia": "15",
		"activity": "low",
		"deficit": "leangains",
		"lifestyle": "gains",
		"format": "html"
	}
}'