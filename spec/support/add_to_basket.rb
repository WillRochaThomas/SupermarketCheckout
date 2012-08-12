shared_context "add_to_basket" do

  def add_product_to_basket (product)
    url_of_product = product_path(product)
    visit(url_of_product)
    click_button('Add to Basket')
  end

end