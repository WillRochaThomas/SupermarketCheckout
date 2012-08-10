#coding: utf-8
require 'spec_helper'

describe "products/index" do

  it "renders a list of products" do
    assign(:products, [
        stub_model(Product,
                   :product_code => "Product Code",
                   :name => "Name",
                   :price => "9.99"
        ),
        stub_model(Product,
                   :product_code => "Product Code",
                   :name => "Name",
                   :price => "9.99"
        )
    ])

    render

    assert_select "tr>td", :text => "Product Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "£9.99".to_s, :count => 2
  end

  it "it formats product prices with 2 decimal places even when decimal values are zero" do
    assign(:products, [
        stub_model(Product,
                   :product_code => "Product Code",
                   :name => "Name",
                   :price => "£9.00"
        )
    ])

    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "£9.00".to_s, :count => 2
  end


end
