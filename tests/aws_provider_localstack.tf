provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"

  skip_metadata_api_check     = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    acm                      = "http://localstack:4566"
    amplify                  = "http://localstack:4566"
    apigateway               = "http://localstack:4566"
    apigatewayv2             = "http://localstack:4566"
    appconfig                = "http://localstack:4566"
    applicationautoscaling   = "http://localstack:4566"
    appsync                  = "http://localstack:4566"
    athena                   = "http://localstack:4566"
    autoscaling              = "http://localstack:4566"
    backup                   = "http://localstack:4566"
    batch                    = "http://localstack:4566"
    cloudformation           = "http://localstack:4566"
    cloudfront               = "http://localstack:4566"
    cloudsearch              = "http://localstack:4566"
    cloudtrail               = "http://localstack:4566"
    cloudwatch               = "http://localstack:4566"
    cloudwatchlogs           = "http://localstack:4566"
    codecommit               = "http://localstack:4566"
    cognitoidentity          = "http://localstack:4566"
    cognitoidp               = "http://localstack:4566"
    config                   = "http://localstack:4566"
    configservice            = "http://localstack:4566"
    costexplorer             = "http://localstack:4566"
    docdb                    = "http://localstack:4566"
    dynamodb                 = "http://localstack:4566"
    dynamodbstreams          = "http://localstack:4566"
    ec2                      = "http://localstack:4566"
    ecr                      = "http://localstack:4566"
    ecs                      = "http://localstack:4566"
    efs                      = "http://localstack:4566"
    eks                      = "http://localstack:4566"
    elasticache              = "http://localstack:4566"
    elasticbeanstalk         = "http://localstack:4566"
    elasticsearch            = "http://localstack:4566"
    elb                      = "http://localstack:4566"
    elbv2                    = "http://localstack:4566"
    emr                      = "http://localstack:4566"
    es                       = "http://localstack:4566"
    events                   = "http://localstack:4566"
    firehose                 = "http://localstack:4566"
    glacier                  = "http://localstack:4566"
    glue                     = "http://localstack:4566"
    iam                      = "http://localstack:4566"
    iot                      = "http://localstack:4566"
    iotanalytics             = "http://localstack:4566"
    iotevents                = "http://localstack:4566"
    ioteventsdata            = "http://localstack:4566"
    iotwireless              = "http://localstack:4566"
    kafka                    = "http://localstack:4566"
    kinesis                  = "http://localstack:4566"
    kinesisanalytics         = "http://localstack:4566"
    kinesisanalyticsv2       = "http://localstack:4566"
    kms                      = "http://localstack:4566"
    lakeformation            = "http://localstack:4566"
    lambda                   = "http://localstack:4566"
    mediaconvert             = "http://localstack:4566"
    mediastore               = "http://localstack:4566"
    mediastoredata           = "http://localstack:4566"
    neptune                  = "http://localstack:4566"
    organizations            = "http://localstack:4566"
    qldb                     = "http://localstack:4566"
    qldbsession              = "http://localstack:4566"
    rds                      = "http://localstack:4566"
    rdsdata                  = "http://localstack:4566"
    redshift                 = "http://localstack:4566"
    redshiftdata             = "http://localstack:4566"
    resourcegroups           = "http://localstack:4566"
    resourcegroupstaggingapi = "http://localstack:4566"
    route53                  = "http://localstack:4566"
    route53resolver          = "http://localstack:4566"
    s3                       = "http://localstack:4566"
    s3control                = "http://localstack:4566"
    sagemaker                = "http://localstack:4566"
    sagemakerruntime         = "http://localstack:4566"
    secretsmanager           = "http://localstack:4566"
    serverlessrepo           = "http://localstack:4566"
    servicediscovery         = "http://localstack:4566"
    ses                      = "http://localstack:4566"
    sesv2                    = "http://localstack:4566"
    sns                      = "http://localstack:4566"
    sqs                      = "http://localstack:4566"
    ssm                      = "http://localstack:4566"
    stepfunctions            = "http://localstack:4566"
    sts                      = "http://localstack:4566"
    support                  = "http://localstack:4566"
    swf                      = "http://localstack:4566"
    timestreamquery          = "http://localstack:4566"
    timestreamwrite          = "http://localstack:4566"
    transfer                 = "http://localstack:4566"
    waf                      = "http://localstack:4566"
    wafv2                    = "http://localstack:4566"
    xray                     = "http://localstack:4566"
  }

  default_tags {
    tags = {
      Environment = "Local"
      Service     = "LocalStack"
    }
  }
}