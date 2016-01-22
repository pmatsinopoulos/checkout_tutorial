Feature: Combined discounts, a.k.a buy one get one for free and bulk discounts
  As a Store Owner
  I want to be able to offer combined discounts

  Background:
    Given The products:
      | product | price |
      | FR1     |  3.11 |
      | AP1     |  5.00 |
      | CF1     | 11.23 |

  Scenario: Customer buys one and gets one more for free and buys bulk and gets discount
    Given The buy one get one for free rules:
      | product |
      | FR1     |
      And The bulk purchase rules:
      | product | bulk_limit | price |
      | AP1     | 3          | 4.5   |
      | CF1     | 2          | 1.0   |
     When Checkout the product "FR1"
      And Then the product "FR1"
      And Then the product "CF1"
      And Then the product "FR1"
      And Then the product "FR1"
      And Then the product "AP1"
      And Then the product "AP1"
      And Then the product "AP1"
     Then Final price expected should be "30.95"
