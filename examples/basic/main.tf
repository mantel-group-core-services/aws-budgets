module "basic" {
  source = "../../"

  name         = "basic_budget"
  limit_amount = 5000

  cost_types = {
    include_credit = false
  }

  notification = [{
    threshold                  = 5000
    subscriber_email_addresses = ["test@test.com"]
  }]
}
