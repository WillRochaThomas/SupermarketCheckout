class BasketItemsController < ApplicationController
  # GET /basket_items
  # GET /basket_items.json
  def index
    @basket_items = BasketItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @basket_items }
    end
  end

  # GET /basket_items/1
  # GET /basket_items/1.json
  def show
    @basket_item = BasketItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @basket_item }
    end
  end

  # GET /basket_items/new
  # GET /basket_items/new.json
  def new
    @basket_item = BasketItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @basket_item }
    end
  end

  # GET /basket_items/1/edit
  def edit
    @basket_item = BasketItem.find(params[:id])
  end

  # POST /basket_items
  # POST /basket_items.json
  def create
    checkout = current_checkout

    product = Product.find(params[:product_id])
    @basket_item = BasketItem.new(:product => product)

    scanned_at_checkout = true
    if @basket_item.save
      checkout.scan(@basket_item)
    else
      scanned_at_checkout = false
    end

    respond_to do |format|
      if scanned_at_checkout
        format.html { redirect_to product, notice: 'Basket item was successfully created.' }
        format.json { render json: @basket_item, status: :created, location: @basket_item }
      else
        format.html { redirect_to product, notice: 'Oops! We were not able to add this to your basket, contact customer services for assistance.' }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /basket_items/1
  # PUT /basket_items/1.json
  def update
    @basket_item = BasketItem.find(params[:id])

    respond_to do |format|
      if @basket_item.update_attributes(params[:basket_item])
        format.html { redirect_to @basket_item, notice: 'Basket item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/1
  # DELETE /basket_items/1.json
  def destroy
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy

    respond_to do |format|
      format.html { redirect_to basket_items_url }
      format.json { head :no_content }
    end
  end
end
