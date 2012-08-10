class StoreController < ApplicationController
  def checkout
    @checkout = current_checkout

    respond_to do |format|
      format.html
      format.json { render json: @checkout }
    end
  end
end
