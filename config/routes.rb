Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

  get "/breweries", to: "breweries#index"
  get "/breweries/:id", to: "breweries#show"
  get "/breweries/:id/beers", to: "breweries#beers"

  # get "/breweries/new", to: "breweries#new"
  # post "/breweries", to: "breweries#create"
  # get "/breweries/:id/edit", to: "breweries#edit"
  # patch "breweries/:id", to: "breweries#update"
  # delete "/breweries/:id", to: "breweries#destroy"

  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"

end
