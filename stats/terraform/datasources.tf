/*
data "external" "go_build_lambda" {
  program = ["go", "build", "-o", "${var.lambda_path}/main", "${var.lambda_path}/main.go"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    id = "abc123"
  }
}

data "external" "zip_lambda" {
  program = ["zip", "-jr", "${var.lambda_path}/${var.lambda_name}", "${var.lambda_path}/main"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    
  }

  //depends_on = ["${data.external.go_build_lambda}"]
}

data "external" "zip_lambda" {
  program = ["bash", "bin/compress-go.sh"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    path="${var.lambda_path}"
  }

  //depends_on = ["${data.external.go_build_lambda}"]
}
*/
