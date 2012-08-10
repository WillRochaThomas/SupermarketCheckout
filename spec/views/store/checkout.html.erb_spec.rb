#coding: utf-8
require 'spec_helper'

describe "store/checkout" do

  before(:each) do
    tea_product = stub_model(Product, :name => 'tea', :price => '4.00')
    coffee_product = stub_model(Product, :name => 'coffee', :price => '6.00')
    @items = [tea_product, coffee_product]
    assign(:checkout, stub_model(Checkout, :total => '10.00', :products => @items))
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