require 'spec_helper'

describe StoreController do

  describe "GET 'checkout'" do
    it "returns http success" do
      get 'checkout'
      response.should be_success
    end
  end

end
