class Api::OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders

      render "index.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    product = Product.find_by(id: params["product_id"])

    calculated_subtotal = product.price * params["quantity"].to_i
    calculated_tax = product.tax * params["quantity"].to_i
    calculated_total = calculated_subtotal + calculated_tax
    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      )
      @order.save
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
    if current_user
      @order = current_user.orders.find_by(id: params["id"])

      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end
end
