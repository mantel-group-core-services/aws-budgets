module "advanced" {
  source = "../../"

  name         = "advanced_budget"
  limit_amount = "50000"

  cost_filter = {
    Service = ["EC2-Instances", "S3"]
    Region  = ["ap-southeast-2"]
  }
  cost_types = {
    include_credit             = true
    include_discount           = true
    include_other_subscription = false
    include_recurring          = true
    include_refund             = true
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
    use_amortized              = false
    use_blended                = false
  }
  notification = [
    {
      threshold                  = "80"
      threshold_type             = "PERCENTAGE"
      comparison_operator        = "GREATER_THAN"
      notification_type          = "ACTUAL"
      subscriber_email_addresses = ["alerts@example.com"]
    },
    {
      threshold                 = "90"
      threshold_type            = "PERCENTAGE"
      comparison_operator       = "GREATER_THAN"
      notification_type         = "FORECASTED"
      subscriber_sns_topic_arns = ["arn:aws:sns:us-east-1:${data.aws_caller_identity.current.account_id}:BudgetAlerts"]
    }
  ]
}

