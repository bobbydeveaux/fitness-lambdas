#!/bin/bash
GOOS=linux go build main.go && \
docker run --rm --env-file ~/.aws/docker_credentials -v $PWD:/var/task lambci/lambda:go1.x main '{
    "resource": "/{proxy+}",
    "path": "/hello/world",
    "httpMethod": "POST",
    "headers": {},
    "multiValueHeaders":{
    },
    "queryStringParameters": {
      "name": "me",
      "multivalueName": "me"
    },
    "multiValueQueryStringParameters":{
      "name":[
        "me"
      ],
      "multivalueName":[
        "you",
        "me"
      ]
    },
    "pathParameters": {
      "proxy": "hello/world"
    },
    "stageVariables": {
      "stageVariableName": "stageVariableValue"
    },
    "requestContext": {
      "accountId": "12345678912",
      "resourceId": "roq9wj",
      "stage": "testStage",
      "requestId": "deef4878-7910-11e6-8f14-25afc3e9ae33",
      "identity": {
        "cognitoIdentityPoolId": null,
        "accountId": null,
        "cognitoIdentityId": null,
        "caller": null,
        "apiKey": null,
        "sourceIp": "192.168.196.186",
        "cognitoAuthenticationType": null,
        "cognitoAuthenticationProvider": null,
        "userArn": null,
        "userAgent": "PostmanRuntime/2.4.5",
        "user": null
      },
      "resourcePath": "/{proxy+}",
      "httpMethod": "POST",
      "apiId": "gy415nuibc"
    },
    "body": "eyJoZWlnaHQiOjcxLCJ3YWlzdCI6MzEsIm5lY2siOjE1LCJtYXNzIjo3NSwiYmlhIjoxNCwiaGlwIjowLCJhY3Rpdml0eSI6ImxvdyIsImRlZmljaXQiOiJtZWRpdW0iLCJsaWZlc3R5bGUiOiJsY2hmIiwiY2FsY3MiOnt9fQ==",
    "isBase64Encoded": true
}'