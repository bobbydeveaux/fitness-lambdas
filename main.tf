# Request the Variables. Can be passed via ENV VARS.
variable "aws_region" {
    default = "eu-west-2"
}

# Specify the provider and access details
provider "aws" {
    region     = "${var.aws_region}"
}

module "stats_lambda" {
  source = "stats/terraform"
  lambda_name = "stats_lambda"
  lambda_path = "stats/"
}