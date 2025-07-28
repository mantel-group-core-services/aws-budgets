<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.99.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The ID of the target account for budget. Will use current user's account\_id by default if omitted. | `string` | `null` | no |
| <a name="input_budget_type"></a> [budget\_type](#input\_budget\_type) | Budget type. | `string` | `"COST"` | no |
| <a name="input_cost_filter"></a> [cost\_filter](#input\_cost\_filter) | Cost filter for the budget, using a map of lists of strings. | `map(list(string))` | `{}` | no |
| <a name="input_cost_types"></a> [cost\_types](#input\_cost\_types) | Configuration options for cost types in the budget. | <pre>object({<br/>    include_credit             = optional(bool, true)<br/>    include_discount           = optional(bool, true)<br/>    include_other_subscription = optional(bool, true)<br/>    include_recurring          = optional(bool, true)<br/>    include_refund             = optional(bool, true)<br/>    include_subscription       = optional(bool, true)<br/>    include_support            = optional(bool, true)<br/>    include_tax                = optional(bool, true)<br/>    include_upfront            = optional(bool, true)<br/>    use_amortized              = optional(bool, false)<br/>    use_blended                = optional(bool, false)<br/>  })</pre> | `{}` | no |
| <a name="input_limit_amount"></a> [limit\_amount](#input\_limit\_amount) | The amount to set as the budget limit. | `string` | n/a | yes |
| <a name="input_limit_unit"></a> [limit\_unit](#input\_limit\_unit) | Unit of the budget limit amount (e.g., USD). | `string` | `"USD"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the budget. | `string` | `null` | no |
| <a name="input_notification"></a> [notification](#input\_notification) | List of budget notifications with optional subscriber details. | <pre>list(object({<br/>    comparison_operator        = optional(string, "GREATER_THAN")<br/>    notification_type          = optional(string, "ACTUAL")<br/>    threshold                  = string<br/>    threshold_type             = optional(string, "ABSOLUTE_VALUE")<br/>    subscriber_email_addresses = optional(list(string))<br/>    subscriber_sns_topic_arns  = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the budget. | `map(string)` | `{}` | no |
| <a name="input_time_period_end"></a> [time\_period\_end](#input\_time\_period\_end) | End time for the budget period. | `string` | `null` | no |
| <a name="input_time_period_start"></a> [time\_period\_start](#input\_time\_period\_start) | Start time for the budget period. | `string` | `null` | no |
| <a name="input_time_unit"></a> [time\_unit](#input\_time\_unit) | The frequency that the budget resets (e.g., MONTHLY). | `string` | `"MONTHLY"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_account_id"></a> [budget\_account\_id](#output\_budget\_account\_id) | The AWS Account ID where the budget is created. |
| <a name="output_budget_limit_amount"></a> [budget\_limit\_amount](#output\_budget\_limit\_amount) | The limit amount defined in the budget. |
| <a name="output_budget_limit_unit"></a> [budget\_limit\_unit](#output\_budget\_limit\_unit) | The currency unit of the budget. |
| <a name="output_budget_name"></a> [budget\_name](#output\_budget\_name) | The name of the AWS Budget. |
| <a name="output_budget_time_period_end"></a> [budget\_time\_period\_end](#output\_budget\_time\_period\_end) | The end date of the budget time period. |
| <a name="output_budget_time_period_start"></a> [budget\_time\_period\_start](#output\_budget\_time\_period\_start) | The start date of the budget time period. |
| <a name="output_budget_time_unit"></a> [budget\_time\_unit](#output\_budget\_time\_unit) | The time unit for the budget (e.g., MONTHLY, DAILY). |
| <a name="output_budget_type"></a> [budget\_type](#output\_budget\_type) | The type of budget (COST, USAGE, etc). |
| <a name="output_tags"></a> [tags](#output\_tags) | All tags. |
<!-- END_TF_DOCS -->