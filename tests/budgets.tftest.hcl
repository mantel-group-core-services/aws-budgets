mock_provider "aws" {}

variables {
  name         = "test-budget"
  cost_filters = {}
  limit_amount = "10000"
  time_unit    = "MONTHLY"

  notification = [{
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = ["test@test.com"]
  }]

  tags = {
    Department = "finance"
  }
}


run "test_name" {
  assert {
    condition     = aws_budgets_budget.this.name == "test-budget"
    error_message = "Budget 'test-budget' should exist"
  }
}

run "test_limit_amount" {
  assert {
    condition     = aws_budgets_budget.this.limit_amount == "10000"
    error_message = "Expected limit_amount to be 10000"
  }
}

