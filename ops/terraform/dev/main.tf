terraform {
  backend "s3" {
    bucket         = "bibliu-devops"
    key            = "terraform/svp-dev.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform"
  }
}

provider "aws" {
  version = "~> 2.5"
  region  = "eu-west-1"
}

module "lambda" {
  source      = "../modules/lambda"
  environment = "dev"

  env_variables = {}
}
