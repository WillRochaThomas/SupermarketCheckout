require 'spec_helper'

describe "checkouts/show" do
  before(:each) do
    @checkout = assign(:checkout, stub_model(Checkout))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
