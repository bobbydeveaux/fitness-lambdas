package main

import (
	"context"
	"encoding/base64"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/bobbydeveaux/fitness-calcs/calcs"

	"bytes"
	"encoding/json"
	"fmt"
	"html/template"
)

type MyEvent struct {
	QueryStringParameters calc.Person `json:"queryStringParameters"`
}

func base64Encode(str string) string {
	return base64.StdEncoding.EncodeToString([]byte(str))
}

func base64Decode(str string) (string, bool) {
	data, err := base64.StdEncoding.DecodeString(str)
	if err != nil {
		return "", true
	}
	return string(data), false
}

func main() {

	lambda.Start(HandleRequest)

}

func HandleRequest(ctx context.Context, event MyEvent) (events.APIGatewayProxyResponse, error) {

	test := fmt.Sprintf("%v", event)

	person := event.QueryStringParameters
	person.Debug = test

	person.Calc()

	response := events.APIGatewayProxyResponse{}
	sPerson, _ := json.Marshal(person)
	response.Body = string(sPerson)
	if person.Format == "html" {
		response.Body = getHtmlBody(person)
	}

	response.StatusCode = 200
	response.Headers = map[string]string{
		"Access-Control-Allow-Origin": "*",
	}

	return response, nil

}

func getHtmlBody(p calc.Person) string {

	var err error
	tmpl, err := template.ParseFiles("html/output.html")
	if err != nil {
		return "Error loading template"
	}

	var tpl bytes.Buffer
	if err := tmpl.Execute(&tpl, p); err != nil {
		return err.Error()
	}

	result := tpl.String()

	return result
}
