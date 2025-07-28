variable "account_id" {
  description = "The ID of the target account for budget. Will use current user's account_id by default if omitted."
  type        = string
  default     = null
}

variable "budget_type" {
  description = "Budget type."
  type        = string
  default     = "COST"

  validation {
    condition     = contains(["COST", "USAGE", "RI_UTILIZATION", "RI_COVERAGE", "SAVINGS_PLANS_UTILIZATION", "SAVINGS_PLANS_COVERAGE"], var.budget_type)
    error_message = "budget_type must be one of: COST, USAGE, RI_UTILIZATION, RI_COVERAGE, SAVINGS_PLANS_UTILIZATION, SAVINGS_PLANS_COVERAGE."
  }
}

variable "cost_filter" {
  description = "Cost filter for the budget, using a map of lists of strings."
  type        = map(list(string))
  default     = {}
}

variable "cost_types" {
  description = "Configuration options for cost types in the budget."
  type = object({
    include_credit             = optional(bool, true)
    include_discount           = optional(bool, true)
    include_other_subscription = optional(bool, true)
    include_recurring          = optional(bool, true)
    include_refund             = optional(bool, true)
    include_subscription       = optional(bool, true)
    include_support            = optional(bool, true)
    include_tax                = optional(bool, true)
    include_upfront            = optional(bool, true)
    use_amortized              = optional(bool, false)
    use_blended                = optional(bool, false)
  })
  default = {}
}

variable "limit_amount" {
  description = "The amount to set as the budget limit."
  type        = string

  validation {
    condition     = var.limit_amount != ""
    error_message = "limit_amount must not be empty."
  }
}

variable "limit_unit" {
  description = "Unit of the budget limit amount (e.g., USD)."
  type        = string
  default     = "USD"

  validation {
    condition     = contains(["USD", "JPY", "CNY", "EUR", "GBP"], var.limit_unit)
    error_message = "limit_unit must be one of: USD, JPY, CNY, EUR, GBP."
  }
}

variable "name" {
  description = "The name of the budget."
  type        = string
  default     = null
}

variable "notification" {
  description = "List of budget notifications with optional subscriber details."
  type = list(object({
    comparison_operator        = optional(string, "GREATER_THAN")
    notification_type          = optional(string, "ACTUAL")
    threshold                  = string
    threshold_type             = optional(string, "ABSOLUTE_VALUE")
    subscriber_email_addresses = optional(list(string))
    subscriber_sns_topic_arns  = optional(list(string))
  }))
  default = []

  validation {
    condition = alltrue([
      for n in var.notification : contains(["GREATER_THAN", "LESS_THAN", "EQUAL_TO"], try(n.comparison_operator, "GREATER_THAN"))
    ])
    error_message = "Notification comparison_operator must be one of: GREATER_THAN, LESS_THAN, EQUAL_TO."
  }

  validation {
    condition = alltrue([
      for n in var.notification : contains(["ACTUAL", "FORECASTED"], try(n.notification_type, "ACTUAL"))
    ])
    error_message = "Notification notification_type must be one of: ACTUAL, FORECASTED."
  }

  validation {
    condition = alltrue([
      for n in var.notification : contains(["ABSOLUTE_VALUE", "PERCENTAGE"], try(n.threshold_type, "ABSOLUTE_VALUE"))
    ])
    error_message = "Notification threshold_type must be one of: ABSOLUTE_VALUE, PERCENTAGE."
  }
}

variable "tags" {
  description = "A map of tags to assign to the budget."
  type        = map(string)
  default     = {}
}

variable "time_unit" {
  description = "The frequency that the budget resets (e.g., MONTHLY)."
  type        = string
  default     = "MONTHLY"

  validation {
    condition     = contains(["DAILY", "MONTHLY", "QUARTERLY", "ANNUALLY"], var.time_unit)
    error_message = "time_unit must be one of: DAILY, MONTHLY, QUARTERLY, ANNUALLY."
  }
}

variable "time_period_start" {
  description = "Start time for the budget period."
  type        = string
  default     = null
}

variable "time_period_end" {
  description = "End time for the budget period."
  type        = string
  default     = null
}

