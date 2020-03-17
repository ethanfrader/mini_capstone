class Api::OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders

      render "index.json.jb"
    else
      render json: []
    end
  end

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: Product.find_by(id: params["product_id"]).price * params["quantity"].to_i,
      tax: Product.find_by(id: params["product_id"]).tax * params["quantity"].to_i,
      total: Product.find_by(id: params["product_id"]).price * params["quantity"].to_i + Product.find_by(id: params["product_id"]).tax * params["quantity"].to_i,
    )
    @order.save
    render "show.json.jb"
  end

  def show
    @order = Order.find_by(id: params["id"])

    render "show.json.jb"
  end
end
