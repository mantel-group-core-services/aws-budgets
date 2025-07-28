output "budget_name" {
  description = "The name of the AWS Budget."
  value       = aws_budgets_budget.this.name
}

output "budget_account_id" {
  description = "The AWS Account ID where the budget is created."
  value       = aws_budgets_budget.this.account_id
}

output "budget_type" {
  description = "The type of budget (COST, USAGE, etc)."
  value       = aws_budgets_budget.this.budget_type
}

output "budget_limit_amount" {
  description = "The limit amount defined in the budget."
  value       = aws_budgets_budget.this.limit_amount
}

output "budget_limit_unit" {
  description = "The currency unit of the budget."
  value       = aws_budgets_budget.this.limit_unit
}

output "budget_time_unit" {
  description = "The time unit for the budget (e.g., MONTHLY, DAILY)."
  value       = aws_budgets_budget.this.time_unit
}

output "budget_time_period_start" {
  description = "The start date of the budget time period."
  value       = aws_budgets_budget.this.time_period_start
}

output "budget_time_period_end" {
  description = "The end date of the budget time period."
  value       = aws_budgets_budget.this.time_period_end
}

output "tags" {
  description = "All tags."
  value       = aws_budgets_budget.this.tags_all
}

