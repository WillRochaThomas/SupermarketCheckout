require 'spec_helper'

describe BasketItemsController do

  # This should return the minimal set of attributes required to create a valid
  # BasketItem. As you add validations to BasketItem, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BasketItemsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all basket_items as @basket_items" do
      basket_item = BasketItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:basket_items).should eq([basket_item])
    end
  end

  describe "GET show" do
    it "assigns the requested basket_item as @basket_item" do
      basket_item = BasketItem.create! valid_attributes
      get :show, {:id => basket_item.to_param}, valid_session
      assigns(:basket_item).should eq(basket_item)
    end
  end

  describe "GET new" do
    it "assigns a new basket_item as @basket_item" do
      get :new, {}, valid_session
      assigns(:basket_item).should be_a_new(BasketItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested basket_item as @basket_item" do
      basket_item = BasketItem.create! valid_attributes
      get :edit, {:id => basket_item.to_param}, valid_session
      assigns(:basket_item).should eq(basket_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BasketItem" do
        expect {
          post :create, {:basket_item => valid_attributes}, valid_session
        }.to change(BasketItem, :count).by(1)
      end

      it "assigns a newly created basket_item as @basket_item with product_id passed and a checkout_id" do
        post :create, {:basket_item => valid_attributes}, valid_session
        assigns(:basket_item).should be_a(BasketItem)
        assigns(:basket_item).should be_persisted
      end

      it "redirects to the created basket_item" do
        post :create, {:basket_item => valid_attributes}, valid_session
        response.should redirect_to(BasketItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved basket_item as @basket_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        BasketItem.any_instance.stub(:save).and_return(false)
        post :create, {:basket_item => {}}, valid_session
        assigns(:basket_item).should be_a_new(BasketItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BasketItem.any_instance.stub(:save).and_return(false)
        post :create, {:basket_item => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested basket_item" do
        basket_item = BasketItem.create! valid_attributes
        # Assuming there are no other basket_items in the database, this
        # specifies that the BasketItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BasketItem.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => basket_item.to_param, :basket_item => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested basket_item as @basket_item" do
        basket_item = BasketItem.create! valid_attributes
        put :update, {:id => basket_item.to_param, :basket_item => valid_attributes}, valid_session
        assigns(:basket_item).should eq(basket_item)
      end

      it "redirects to the basket_item" do
        basket_item = BasketItem.create! valid_attributes
        put :update, {:id => basket_item.to_param, :basket_item => valid_attributes}, valid_session
        response.should redirect_to(basket_item)
      end
    end

    describe "with invalid params" do
      it "assigns the basket_item as @basket_item" do
        basket_item = BasketItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BasketItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => basket_item.to_param, :basket_item => {}}, valid_session
        assigns(:basket_item).should eq(basket_item)
      end

      it "re-renders the 'edit' template" do
        basket_item = BasketItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BasketItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => basket_item.to_param, :basket_item => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested basket_item" do
      basket_item = BasketItem.create! valid_attributes
      expect {
        delete :destroy, {:id => basket_item.to_param}, valid_session
      }.to change(BasketItem, :count).by(-1)
    end

    it "redirects to the basket_items list" do
      basket_item = BasketItem.create! valid_attributes
      delete :destroy, {:id => basket_item.to_param}, valid_session
      response.should redirect_to(basket_items_url)
    end
  end

end
