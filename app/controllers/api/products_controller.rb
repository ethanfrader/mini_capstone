class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "all_products.json.jb"
  end

  def ipa_method
    @product = Product.find_by(name: "IPA")
    render "product.json.jb"
  end

  def brown_ale_method
    @product = Product.find_by(name: "Brown Ale")
    render "product.json.jb"
  end

  def hefeweizen_method
    @product = Product.find_by(name: "Hefeweizen")
    render "product.json.jb"
  end
end
