Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/products" => "products#index"
    post "/product" => "products#create"
    get "/product/:id" => "products#show"
    patch "/product/:id" => "products#update"
    delete "/product/:id" => "products#destroy"
  end
end
