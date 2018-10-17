package main

import (
	"context"
	"encoding/base64"
	"encoding/json"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/bobbydeveaux/fitness-calcs/calcs"
	"log"
	//"net/url"
)

type MyEvent struct {
	Records []struct {
		Cf struct {
			Request struct {
				QueryString string `json:"querystring"`
				Body        struct {
					Data string `json:"data"`
				} `json:"body"`
			} `json:"request"`
		} `json:"cf"`
	} `json:"Records"`
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

func HandleRequest(ctx context.Context, name MyEvent) (string, error) {

	var person calc.Person

	for _, v := range name.Records {
		data, _ := base64Decode(v.Cf.Request.Body.Data)
		byteData := []byte(data)

		err := json.Unmarshal(byteData, &person)
		if err != nil {
			log.Println(err.Error())
		}

		person.Calc()
		payload, _ := json.Marshal(person)
		strPayload := string(payload[:])

		return strPayload, nil
	}

	return "Success!", nil

}
