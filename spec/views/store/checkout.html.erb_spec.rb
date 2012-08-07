#coding: utf-8
require 'spec_helper'

describe "store/checkout" do

  before(:each) do
    @items = [stub_model(BasketItem, :name => 'tea', :price => '4.00'),
              stub_model(BasketItem, :name => 'coffee', :price => '6.00')]
    assign(:checkout, stub_model(Checkout, :total => '10.00', :basket_items => @items))
  end

  it "should display an itemised list of the products in the user's basket" do
    render
    rendered.should contain('tea £4.00')
    rendered.should contain('coffee £6.00')
  end

  it "should display the order total" do
    render
    rendered.should contain('Total: £10.00')
  end
end