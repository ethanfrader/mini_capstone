class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

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
end
