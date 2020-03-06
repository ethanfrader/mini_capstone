class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def create
    @product = Product.new({
      name: params["name"],
      price: params["price"],
      description: params["description"],
      ounces: params["ounces"],
      abv: params["abv"],
    })
    @product.save
    render "create.json.jb"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || product.name
    @product.description = params["description"] || product.description
    @product.abv = params["abv"] || product.abv
    @product.ounces = params["ounces"] || product.ounces
    @product.price = params["price"] || product.price
    @product.save
    render "show.json.jb"
  end
end
