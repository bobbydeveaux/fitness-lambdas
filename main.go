package main

import (
	"context"

	"encoding/json"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/bobbydeveaux/fitness-calcs/calcs"
	"log"
	"net/url"
	"strconv"
)

type MyEvent struct {
	Records []CFRecord `json:"Records"`
}

type CFRecord struct {
	Cf CFData `json:"cf"`
}

type CFData struct {
	Request CFRequest `json:"request"`
}

type CFRequest struct {
	QueryString string `json:"querystring"`
}

func main() {
	lambda.Start(HandleRequest)
}

func HandleRequest(ctx context.Context, name MyEvent) (string, error) {

	bobby := calc.Person{
		Height:    71,
		Waist:     31.00,
		Neck:      15.00,
		Mass:      75.00,
		Bia:       14.00,
		Hip:       0,
		Activity:  "low",
		Deficit:   "medium",
		Lifestyle: "lchf",
	}

	for _, v := range name.Records {
		log.Println(v.Cf.Request.QueryString)
		m, _ := url.ParseQuery(v.Cf.Request.QueryString)
		log.Println(m)
		log.Println(m["userid"][0])
		log.Println(m["mass"][0])
		log.Println(m["bia"][0])

		bobby.Mass, _ = strconv.ParseFloat(m["mass"][0], 64)
		bobby.Bia, _ = strconv.ParseFloat(m["bia"][0], 64)

		calcBobby := calc.CalcAll(bobby)
		payload, _ := json.Marshal(calcBobby)
		strPayload := string(payload[:])
		return strPayload, nil
	}

	return "Success!", nil

}
