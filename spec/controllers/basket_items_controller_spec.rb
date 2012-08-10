require 'spec_helper'

describe BasketItemsController do

  before(:each) do
    @product_our_item_references = mock_model('Product')
    Product.stub(:find).with(@product_our_item_references.id.to_s).and_return(@product_our_item_references)

    @valid_post_params = { :product_id => @product_our_item_references.id.to_s }

  end


  describe "GET index" do
    it "assigns all basket_items as @basket_items" do
      BasketItem.destroy_all
      basket_item = BasketItem.create!
      get :index, {}
      assigns(:basket_items).should eq([basket_item])
    end
  end

  describe "GET show" do
    it "assigns the requested basket_item as @basket_item" do
      basket_item = BasketItem.create!
      get :show, {:id => basket_item.to_param}
      assigns(:basket_item).should eq(basket_item)
    end
  end

  describe "GET new" do
    it "assigns a new basket_item as @basket_item" do
      get :new, {}
      assigns(:basket_item).should be_a_new(BasketItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested basket_item as @basket_item" do
      basket_item = BasketItem.create!
      get :edit, {:id => basket_item.to_param}
      assigns(:basket_item).should eq(basket_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BasketItem" do
        expect {
          post :create, @valid_post_params
        }.to change(BasketItem, :count).by(1)
      end

      it "assigns a newly created basket_item as @basket_item and persists it" do
        post :create, @valid_post_params
        assigns(:basket_item).should be_a(BasketItem)
        assigns(:basket_item).should be_persisted
      end

      it "redirects to the page for the product just added to the basket" do
        post :create, @valid_post_params
        response.should redirect_to(@product_our_item_references)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested basket_item" do
        basket_item = BasketItem.create!
        BasketItem.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => basket_item.to_param, :basket_item => {'these' => 'params'}}
      end

      it "assigns the requested basket_item as @basket_item" do
        basket_item = BasketItem.create!
        BasketItem.any_instance.stub(:update_attributes).and_return(true)
        put :update, {:id => basket_item.to_param, :basket_item => {}}
        assigns(:basket_item).should eq(basket_item)
      end

      it "redirects to the updated basket item" do
        basket_item = BasketItem.create!
        BasketItem.any_instance.stub(:update_attributes).and_return(true)

        put :update, {:id => basket_item.to_param, :basket_item => {} }
        response.should redirect_to(basket_item)
      end
    end

    describe "with invalid params" do
      it "assigns the basket_item as @basket_item" do
        basket_item = BasketItem.create!
        BasketItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => basket_item.to_param, :basket_item => {}}
        assigns(:basket_item).should eq(basket_item)
      end

      it "re-renders the 'edit' template" do
        basket_item = BasketItem.create!
        BasketItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => basket_item.to_param, :basket_item => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested basket_item" do
      basket_item = BasketItem.create!
      expect {
        delete :destroy, {:id => basket_item.to_param}
      }.to change(BasketItem, :count).by(-1)
    end

    it "redirects to the basket_items list" do
      basket_item = BasketItem.create!
      delete :destroy, {:id => basket_item.to_param}
      response.should redirect_to(basket_items_url)
    end
  end

end
