#coding: utf-8

Then /^my order total should be £(\d*(?:\.\d{2}))$/ do |expectedTotal|
  order_total = 'Total: £' + expectedTotal
  page.should have_content(order_total)
end