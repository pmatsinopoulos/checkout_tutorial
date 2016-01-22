Feature: Check out buy one get one for free
  As a Store Owner
  I want to offer one for free when you get one

  Background:
    Given The products:
      | product | price |
      | FR1     |  3.11 |
      | AP1     |  5.00 |
      | CF1     | 11.23 |

  Scenario: Customer buys one and gets one more for free
    Given The buy one get one for free rules:
      | product |
      | FR1     |
     When Checkout the product "FR1"
      And Then the product "FR1"
     Then Final price expected should be "3.11"

  Scenario: Customer buys one and gets one more for free with other two products too
    Given The buy one get one for free rules:
      | product |
      | FR1     |
     When Checkout the product "FR1"
      And Then the product "AP1"
      And Then the product "FR1"
      And Then the product "CF1"
     Then Final price expected should be "19.34"

  Scenario: Customer buys one gets one more for free but only for the ones that this policy applies
    Given The buy one get one for free rules:
      | product |
      | FR1     |
     When Checkout the product "FR1"
      And Then the product "FR1"
      And Then the product "CF1"
      And Then the product "CF1"
      And Then the product "AP1"
     Then Final price expected should be "30.57"


# try to have both policies apply at the same time

# try to have other policies different from the examples given

