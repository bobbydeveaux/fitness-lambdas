#!/bin/bash
GOOS=linux go build main.go && \
docker run --rm --env-file ~/.aws/docker_credentials -v $PWD:/var/task lambci/lambda:go1.x main '{
  "Records": [
    {
      "cf": {
        "config": {
          "distributionDomainName": "d123.cloudfront.net",
          "distributionId": "EDFDVBD6EXAMPLE",
          "eventType": "viewer-request",
          "requestId": "MRVMF7KydIvxMWfJIglgwHQwZsbG2IhRJ07sn9AkKUFSHS9EXAMPLE=="
        },
        "request": {
          "body": {
            "action": "read-only",
            "data": "eyJoZWlnaHQiOjcxLCJ3YWlzdCI6MzEsIm5lY2siOjE1LCJtYXNzIjo3NSwiYmlhIjoxNCwiaGlwIjowLCJhY3Rpdml0eSI6ImxvdyIsImRlZmljaXQiOiJtZWRpdW0iLCJsaWZlc3R5bGUiOiJsY2hmIiwiY2FsY3MiOnt9fQ==",
            "encoding": "base64",
            "inputTruncated": false
          },
          "clientIp": "2001:0db8:85a3:0:0:8a2e:0370:7334",
          "querystring": "userid=1&mass=65&bia=14&height=70&neck=14&waist=30&activity=low&lifestyle=balanced&deficit=maintain&hip=0",
          "uri": "/picture.jpg",
          "method": "POST",
          "headers": {
            "host": [
              {
                "key": "Host",
                "value": "d111111abcdef8.cloudfront.net"
              }
            ],
            "user-agent": [
              {
                "key": "User-Agent",
                "value": "curl/7.51.0"
              }
            ]
          },
          "origin": {
            "custom": {
              "customHeaders": {
                "my-origin-custom-header": [
                  {
                    "key": "My-Origin-Custom-Header",
                    "value": "Test"
                  }
                ]
              },
              "domainName": "example.com",
              "keepaliveTimeout": 5,
              "path": "/custom_path",
              "port": 443,
              "protocol": "https",
              "readTimeout": 5,
              "sslProtocols": [
                "TLSv1",
                "TLSv1.1"
              ]
            },
            "s3": {
              "authMethod": "origin-access-identity",
              "customHeaders": {
                "my-origin-custom-header": [
                  {
                    "key": "My-Origin-Custom-Header",
                    "value": "Test"
                  }
                ]
              },
              "domainName": "my-bucket.s3.amazonaws.com",
              "path": "/s3_path",
              "region": "us-east-1"
            }
          }
        }
      }
    }
  ]
}'