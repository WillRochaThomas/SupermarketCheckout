Given /^my basket contains (\d+) fruit tea\(s\)$/ do |teas_in_basket|
  tea_product_code = 'FR1'
  tea = Product.find(:first, :conditions => [ "product_code = ?", tea_product_code])
  url_of_tea_product = '/products/' + tea.id.to_s

  teas_added = 0

  until teas_added == teas_in_basket.to_i do
    visit(url_of_tea_product)
    click_button('Add to Basket')
    teas_added += 1
  end
end