class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.products_in_cart

    render "index.json.jb"
  end

  def create
    #user sends product_id and quantity as params
    @carted_product = CartedProduct.new({
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted",
    })
    if @carted_product.save
      render "show.json.jb"
    else
      render json: { errors: @carted_product.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def destroy
    carted_product = current_user.products_in_cart
    carted_product.status = "removed"
    carted_product.save
    render json: { message: "Product successfully removed from cart." }
  end
end
