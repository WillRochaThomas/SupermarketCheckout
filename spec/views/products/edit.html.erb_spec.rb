require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :product_code => "MyString",
      :name => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_product_code", :name => "product[product_code]"
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_price", :name => "product[price]"
    end
  end
end
