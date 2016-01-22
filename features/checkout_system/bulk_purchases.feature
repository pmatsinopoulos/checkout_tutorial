Feature: Check out bulk purchase
  As a Store Owner
  I want to offer discount on bulk purchases

  Background:
    Given The products:
      | product | price |
      | FR1     |  3.11 |
      | AP1     |  5.00 |
      | CF1     | 11.23 |

  Scenario: Customer buys bulk gets discounted price
    Given The bulk purchase rules:
      | product | bulk_limit | price |
      | AP1     | 3          | 4.5   |
     When Checkout the product "AP1"
      And Then the product "AP1"
      And Then the product "FR1"
      And Then the product "AP1"
     Then Final price expected should be "16.61"

  Scenario: Customer buys bulk gets discounted price for two products
    Given The bulk purchase rules:
      | product | bulk_limit | price |
      | AP1     | 3          | 4.5   |
      | CF1     | 2          | 1.0   |
     When Checkout the product "AP1"
      And Then the product "AP1"
      And Then the product "FR1"
      And Then the product "CF1"
      And Then the product "CF1"
      And Then the product "AP1"
      And Then the product "CF1"
     Then Final price expected should be "19.61"

  Scenario: Customer buys bulk get discounted price but only for the products that are in the promotion
    Given The bulk purchase rules:
      | product | bulk_limit | price |
      | AP1     | 3          | 4.5   |
    When Checkout the product "AP1"
     And Then the product "AP1"
     And Then the product "FR1"
     And Then the product "AP1"
     And Then the product "FR1"
     And Then the product "FR1"
    Then Final price expected should be "22.83"


# try to have both policies apply at the same time

# try to have other policies different from the examples given

