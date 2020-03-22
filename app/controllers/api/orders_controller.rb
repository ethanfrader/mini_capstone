class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    @order = Order.new(
      user_id: current_user.id,
    )
    @carted_products = current_user.products_in_cart
    if @order.save
      @carted_products.update_all(status: "purchased", order_id: @order.id) #this line is essential to come before .update_totals since it passes/connects carted_products with the created order so we can access them for the update
      @order.update_totals
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def show
    @order = current_user.orders.find_by(id: params["id"])
    render "show.json.jb"
  end
end
