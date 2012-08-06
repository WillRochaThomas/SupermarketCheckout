require 'spec_helper'

describe "basket_items/edit" do
  before(:each) do
    @basket_item = assign(:basket_item, stub_model(BasketItem,
      :product_id => 1,
      :checkout_id => 1
    ))
  end

  it "renders the edit basket_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => basket_items_path(@basket_item), :method => "post" do
      assert_select "input#basket_item_product_id", :name => "basket_item[product_id]"
      assert_select "input#basket_item_checkout_id", :name => "basket_item[checkout_id]"
    end
  end
end
