require "spec_helper"

describe BasketItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/basket_items").should route_to("basket_items#index")
    end

    it "routes to #new" do
      get("/basket_items/new").should route_to("basket_items#new")
    end

    it "routes to #show" do
      get("/basket_items/1").should route_to("basket_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/basket_items/1/edit").should route_to("basket_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/basket_items").should route_to("basket_items#create")
    end

    it "routes to #update" do
      put("/basket_items/1").should route_to("basket_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/basket_items/1").should route_to("basket_items#destroy", :id => "1")
    end

  end
end
