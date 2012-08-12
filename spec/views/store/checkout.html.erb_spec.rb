#coding: utf-8
require 'spec_helper'

describe "store/checkout" do

  before(:each) do
    tea = stub_model(BasketItem, :product => stub_model(Product, :name => 'tea'), :quantity => 1)
    tea.stub(:price).and_return(4.00)

    coffees = stub_model(BasketItem, :product => stub_model(Product, :name => 'coffee'), :quantity => 2)
    coffees.stub(:price).and_return(6.00)

    @items = [tea, coffees]
    assign(:checkout, stub_model(Checkout, :total => '16.00', :basket_items => @items))
  end

  it "should display an itemised list of products in the users basket, including name, price and quantity" do
    render

    assert_select "tr>th", :text => "Name".to_s, :count => 1
    assert_select "tr>th", :text => "Price".to_s, :count => 1
    assert_select "tr>th", :text => "Quantity".to_s, :count => 1

    assert_select "tr>td", :text => "tea".to_s, :count => 1
    assert_select "tr>td", :text => "£4.00".to_s, :count => 1
    assert_select "tr>td", :text => "1".to_s, :count => 1

    assert_select "tr>td", :text => "coffee".to_s, :count => 1
    assert_select "tr>td", :text => "£6.00".to_s, :count => 1
    assert_select "tr>td", :text => "2".to_s, :count => 1

  end

  it "should display the order total" do
    render

    assert_select "tr>td", :text => "Total:".to_s, :count => 1
    assert_select "tr>td", :text => "£16.00".to_s, :count => 1
  end
end