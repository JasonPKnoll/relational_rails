Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  # ARTISTS -------------------------
  get '/artists', to: 'artists#index'

  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'

  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/edit', to: 'artists#edit'
  patch '/artists/:id/edit', to: 'artists#update'

  delete '/artists/:id', to: 'artists#destroy'

  # ARTWORKS -------------------------
  get '/artworks', to: 'artworks#index'

  get '/artworks/new', to: 'artworks#new'
  post '/artworks', to: 'artworks#create'

  get '/artworks/:id', to: 'artworks#show'
  get '/artworks/:id/edit', to: 'artworks#edit'
  patch '/artworks/:id/edit', to: 'artworks#update'

  delete '/artworks/:id', to: 'artworks#destroy'

  # ARTIST_ARTWORKS -------------------------
  get '/artists/:artist_id/artworks', to: 'artist_artworks#index'

  get '/artists/:artist_id/artworks/new', to: 'artist_artworks#new'
  post '/artists/:artist_id/artworks', to: 'artist_artworks#create'

  # EASTEREGG -------------------------
  get '/easteregg', to: 'eastereggs#index'

  # BREWERIES -------------------------
  get "/breweries", to: "breweries#index"
  get "/breweries/new", to: "breweries#new"
  get "/breweries/:id", to: "breweries#show"
  post "/breweries", to: "breweries#create"
  get "/breweries/:id/edit", to: "breweries#edit"
  patch "breweries/:id", to: "breweries#update"
  delete "/breweries/:id", to: "breweries#destroy"

  # BEERS -------------------------
  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"
  get "/beers/:id/edit", to: "beers#edit"
  patch "/beers/:id", to: "beers#update"

  # BREWERIES_BEERS -------------------------
  get "/breweries/:brewery_id/beers", to: "brewery_beers#index"
  get "/breweries/:brewery_id/beers/new", to: "brewery_beers#new"
  post "/breweries/:brewery_id/beers", to: "brewery_beers#create"
end
