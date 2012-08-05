require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :product_code => "Product Code",
      :name => "Name",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Product Code/)
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
  end
end
