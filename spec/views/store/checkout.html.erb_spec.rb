#coding: utf-8
require 'spec_helper'

describe "store/checkout" do

  before(:each) do
    tea = stub_model(BasketItem, :product => stub_model(Product, :name => 'tea'))
    tea.stub(:price).and_return(4.00)

    coffee = stub_model(BasketItem, :product => stub_model(Product, :name => 'coffee'))
    coffee.stub(:price).and_return(6.00)

    @items = [tea, coffee]
    assign(:checkout, stub_model(Checkout, :total => '10.00', :basket_items => @items))
  end

  it "should display an itemised list of the products in the user's basket" do
    render
    rendered.should have_content('tea £4.00')
    rendered.should have_content('coffee £6.00')
  end

  it "should display the order total" do
    render
    rendered.should have_content('Total: £10.00')
  end
end