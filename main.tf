#   ###############
#   #   Lambdas   #
#   ###############

# resource "aws_iam_role" "iam_for_lambda" {
#   name               = "iam_for_lambda"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

# data "aws_iam_policy_document" "lambda" {
#   statement {
#     actions = [
#       "logs: CreateLogGroup",
#       "logs:CreateLogStream",
#       "logs:PutLogEvents"
#     ]
#     resources = [
#       "arn:aws:logs:*:*:*"
#     ]
#   }
#   statement {
#     actions = [
#       "ecr:BatchGetImage"
#     ]
#     resources = [
#       "arn:aws:ecr:${var.region}:${var.account_id}:davinci_ecr/*"
#     ]
#   }
# }

# data "aws_iam_policy_document" "invocation_assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["apigateway.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# data "aws_iam_policy_document" "invocation_policy" {
#   statement {
#     effect    = "Allow"
#     actions   = ["lambda:InvokeFunction"]
#     resources = [aws_lambda_function.authorizer.arn]
#   }
# }

# # IAM policy for logging from a lambda and getting our image from ECR
# resource "aws_iam_policy" "iam_policy_for_lambda" {
#   name        = "aws_iam_policy_for_terraform_aws_lambda_role"
#   path        = "/"
#   description = "AWS IAM Policy for managing aws lambda role"
#   policy      = data.aws_iam_policy_document.lambda.json
# }

# # Policy Attachment on the role.
# resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
#   role       = aws_iam_role.iam_for_lambda.name
#   policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
# }

# resource "aws_lambda_function" "authorizer" {
#   function_name = "lambda_authorizer"
#   role          = aws_iam_role.iam_for_lambda.arn
#   image_uri     = "${data.aws_ecr_repository.repository.repository_url}@${data.aws_ecr_image.authorizer_image.image_digest}"
#   package_type  = "Image"
# }

# resource "aws_lambda_function" "handler" {
#   function_name = "lambda_handler"
#   role          = aws_iam_role.iam_for_lambda.arn
#   image_uri     = "${data.aws_ecr_repository.repository.repository_url}@${data.aws_ecr_image.handler_image.image_digest}"
#   package_type  = "Image"
# }

#   ###############
#   #   Layer   #
#   ###############