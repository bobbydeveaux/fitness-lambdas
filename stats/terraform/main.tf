resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "stats_lambda" {
  filename         = "${var.lambda_path}/${var.lambda_name}.zip"
  function_name    = "${var.lambda_name}"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "main"
  source_code_hash = "${base64sha256(file("${var.lambda_path}/${var.lambda_name}.zip"))}"
  runtime          = "go1.x"
  publish          = true
}
