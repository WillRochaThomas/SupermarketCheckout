Feature:
  In order to boost sales and drive more traffic to our website
  As a CEO
  I want to offer customers a buy-one-get-one-free deal on fruit tea

  Scenario: Buy one get one free on fruit tea
    Given my basket contains 2 fruit tea(s)
    When I checkout
    Then my order total should be £3.11