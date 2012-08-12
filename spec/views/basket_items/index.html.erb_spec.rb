require 'spec_helper'

describe "basket_items/index" do
  before(:each) do
    assign(:basket_items, [
      stub_model(BasketItem,
        :product_id => 1,
        :checkout_id => 2
      ),
      stub_model(BasketItem,
        :product_id => 1,
        :checkout_id => 2
      )
    ])
  end

  it "renders a list of basket_items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
