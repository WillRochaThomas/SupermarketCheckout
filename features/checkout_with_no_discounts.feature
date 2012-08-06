#coding: utf-8

Feature: Checkout with no discounts
  In order to check I am being charged the correct amount
  As a customer
  I want to review my order total on checkout

  Scenario: Show the customer their order total on checkout
    Given my basket contains 2 fruit tea(s), 1 punnet(s) of strawberries, and 1 packet(s) of coffee
    When I checkout
    Then my order total should be £22.25