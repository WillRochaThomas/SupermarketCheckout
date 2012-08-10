#coding: utf-8
require 'spec_helper'

describe "products/show" do

  it "renders attributes in <p>" do
    @product = assign(:product, stub_model(Product,
                                           :product_code => "Product Code",
                                           :name => "Name",
                                           :price => "9.99"
    ))

    render

    rendered.should match(/Product Code/)
    rendered.should match(/Name/)
    rendered.should match(/£9.99/)
  end

  it "it formats product prices with 2 decimal places even when decimal values are zero" do
    @product = assign(:product, stub_model(Product,
                                           :product_code => "Product Code",
                                           :name => "Name",
                                           :price => "9.00"
    ))

    render

    rendered.should match(/Product Code/)
    rendered.should match(/Name/)
    rendered.should match(/£9.00/)
  end


end
