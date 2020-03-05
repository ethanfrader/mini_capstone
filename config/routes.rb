Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#all_products_method"
    get "/product/:product_name" => "products#specific_product_method"
    get "/product" => "products#specific_product_method"
    get "/ipa" => "products#ipa_method"
    get "/brown_ale" => "products#brown_ale_method"
    get "/hefeweizen" => "products#hefeweizen_method"
  end
end
