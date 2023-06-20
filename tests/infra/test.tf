terraform {
  required_providers {
    # Becasue we're currently using a built in provider as
    # a substitute for dedicated Terraform language syntax
    # for now, test suite modules must always declare a 
    # dependency on this provider. This provider is only 
    # available when running tests, so you shouldn't use it
    #  in non-test modules
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

# provider "aws" {
#   access_key = "test"
#   secret_key = "test"
#   region     = "us-east-1"

#   s3_use_path_style           = false
#   skip_credentials_validation = true
#   skip_metadata_api_check     = true
#   skip_requesting_account_id  = true

#   endpoints {
#     apigateway     = "http://localstack:4566"
#     apigatewayv2   = "http://localstack:4566"
#     cloudformation = "http://localstack:4566"
#     cloudwatch     = "http://localstack:4566"
#     dynamodb       = "http://localstack:4566"
#     ec2            = "http://localstack:4566"
#     es             = "http://localstack:4566"
#     elasticache    = "http://localstack:4566"
#     firehose       = "http://localstack:4566"
#     iam            = "http://localstack:4566"
#     kinesis        = "http://localstack:4566"
#     lambda         = "http://localstack:4566"
#     rds            = "http://localstack:4566"
#     redshift       = "http://localstack:4566"
#     route53        = "http://localstack:4566"
#     s3             = "http://localstack:4566"
#     secretsmanager = "http://localstack:4566"
#     ses            = "http://localstack:4566"
#     sns            = "http://localstack:4566"
#     sqs            = "http://localstack:4566"
#     ssm            = "http://localstack:4566"
#     stepfunctions  = "http://localstack:4566"
#     sts            = "http://localstack:4566"
#   }
# }

module "main" {
  # source is always ../.. for test suite configurations,
  # because they are places two subdirectories deep under the
  # main module directory
  source        = "../.."
  function_name = "test-function"
  access_key    = "test"
  secret_key    = "test"
}

data "aws_lambda_function" "lambda" {
  function_name = "test-function"
  depends_on    = [module.main]
}


# The special test_assertions resource type, which belongs
# to the test provider we required above, is a temporary
# syntax for writing out explicit test assertions
resource "test_assertions" "lambda" {
  # 'component' serves as a unique identifier for this
  # particular set of assertions in the test results
  component = "lambda"

  check "lambda_name" {
    description = "Check lambda name beginning"
    condition   = can(regex("^test-", data.aws_lambda_function.lambda.function_name))
  }

  equal "lambda_name_tag" {
    description = "Check lambda name"
    got         = data.aws_lambda_function.lambda.function_name
    want        = "test-function"
  }
}