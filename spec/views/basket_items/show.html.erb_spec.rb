require 'spec_helper'

describe "basket_items/show" do
  before(:each) do
    @basket_item = assign(:basket_item, stub_model(BasketItem,
      :product_id => 1,
      :checkout_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
