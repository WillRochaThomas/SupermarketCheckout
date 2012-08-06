Given /^my basket contains (\d+) fruit tea\(s\), (\d+) punnet\(s\) of strawberries, and (\d+) packet\(s\) of coffee$/ do |teas_in_basket, strawberries_in_basket, coffees_in_basket|

  checkout = Checkout.new

  tea_product_code = 'FR1'
  tea = Product.find(:first, :conditions => [ "product_code = ?", tea_product_code])
  teas_scanned = 0

  until teas_scanned == teas_in_basket.to_i do
    checkout.scan(tea)
    teas_scanned += 1
  end

  strawberries_product_code = 'SR1'
  strawberries = Product.find(:first, :conditions => [ "product_code = ?", strawberries_product_code])
  strawberries_scanned = 0

  until strawberries_scanned == strawberries_in_basket.to_i do
    checkout.scan(strawberries)
    strawberries_scanned += 1
  end

  coffee_product_code = 'CF1'
  coffee = Product.find(:first, :conditions => [ "product_code = ?", coffee_product_code])
  coffees_scanned = 0

  until coffees_scanned == coffees_in_basket.to_i do
    checkout.scan(coffee)
    coffees_scanned += 1
  end

end