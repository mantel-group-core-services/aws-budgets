resource "aws_budgets_budget" "this" {
  account_id        = var.account_id
  name              = var.name
  budget_type       = var.budget_type
  limit_amount      = var.limit_amount
  limit_unit        = var.limit_unit
  time_unit         = var.time_unit
  time_period_start = var.time_period_start
  time_period_end   = var.time_period_end

  dynamic "cost_filter" {
    for_each = var.cost_filter
    content {
      name   = cost_filter.key
      values = cost_filter.value
    }
  }

  cost_types {
    include_credit             = var.cost_types.include_credit
    include_discount           = var.cost_types.include_discount
    include_other_subscription = var.cost_types.include_other_subscription
    include_recurring          = var.cost_types.include_recurring
    include_refund             = var.cost_types.include_refund
    include_subscription       = var.cost_types.include_subscription
    include_support            = var.cost_types.include_support
    include_tax                = var.cost_types.include_tax
    include_upfront            = var.cost_types.include_upfront
    use_blended                = var.cost_types.use_blended
  }

  dynamic "notification" {
    for_each = var.notification
    content {
      comparison_operator        = notification.value.comparison_operator
      notification_type          = notification.value.notification_type
      threshold                  = notification.value.threshold
      threshold_type             = notification.value.threshold_type
      subscriber_email_addresses = notification.value.subscriber_email_addresses
      subscriber_sns_topic_arns  = notification.value.subscriber_sns_topic_arns
    }
  }

  tags = merge(
    local.enforced_tags,
    var.tags
  )
}

