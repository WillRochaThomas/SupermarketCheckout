require 'spec_helper'

describe StoreController do


  describe "GET 'checkout'" do
    it "assigns the current user's checkout as @checkout" do
      users_checkout = stub_model(Checkout)
      Checkout.stub!(:find).with(users_checkout.id).and_return(users_checkout)
      users_session = { :checkout_id => users_checkout.id }

      get :checkout, {}, users_session

      assigns(:checkout).should eq(users_checkout)
    end
  end

  describe "GET 'checkout'" do
    it "creates a new checkout object assigned to @checkout if none exists in the current session" do
      a_new_checkout = stub_model(Checkout)
      Checkout.stub!(:create).and_return(a_new_checkout)
      new_session = { }

      get :checkout, {}, new_session

      assigns(:checkout).should eq(a_new_checkout)
    end
  end

end
