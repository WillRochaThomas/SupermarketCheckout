require 'spec_helper'

describe "checkouts/edit" do
  before(:each) do
    @checkout = assign(:checkout, stub_model(Checkout))
  end

  it "renders the edit checkout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => checkouts_path(@checkout), :method => "post" do
    end
  end
end
