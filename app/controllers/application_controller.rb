class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_checkout
    Checkout.find(session[:checkout_id])
  rescue ActiveRecord::RecordNotFound
    checkout = Checkout.create
    session[:checkout_id] = checkout.id
    checkout
  end
end
