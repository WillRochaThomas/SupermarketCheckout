require 'spec_helper'

describe "basket_items/new" do
  before(:each) do
    assign(:basket_item, stub_model(BasketItem,
      :product_id => 1,
      :checkout_id => 1
    ).as_new_record)
  end

  it "renders new basket_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => basket_items_path, :method => "post" do
      assert_select "input#basket_item_product_id", :name => "basket_item[product_id]"
      assert_select "input#basket_item_checkout_id", :name => "basket_item[checkout_id]"
    end
  end
end
