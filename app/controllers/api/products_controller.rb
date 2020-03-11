class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end
    if params[:discount] == "true"
      @products = @products.where("price < 6")
    end
    if params[:sort] == "price"
      if params[:sort_order] == "desc"
        @products = @products.order(:price => :desc)
      else
        @products = @products.order(:price => :asc)
      end
    end
    if params[:sort]
      @products = @products.order(:id)
    end

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
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || @product.name
    @product.description = params["description"] || @product.description
    @product.abv = params["abv"] || @product.abv
    @product.ounces = params["ounces"] || @product.ounces
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product successfully destroyed." }
  end
end
