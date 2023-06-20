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

module "main" {
  # source is always ../.. for test suite configurations,
  # because they are places two subdirectories deep under the
  # main module directory
  source        = "../.."
  function_name = "test-function"
}

data "aws_lambda_function" "lambda" {
  function_name = module.main.lambda.name
}


# The special test_assertions resource type, which belongs
# to the test provider we required above, is a temporary
# syntax for writing out explicit test assertions
resource "test_assertions" "lambda" {
  # 'component' serves as a unique identifier for this
  # particular set of assertions in the test results
  component = "lambda"

  check "lambda_name" {
    description = "Check lambda name"
    condition   = can(regex("^test-", module.main.lambda))
  }

  equal "lambda_name_tag" {
    description = "check lambda tag"
    got         = data.aws_lambda_function.name
    want        = "test-function"
  }
}