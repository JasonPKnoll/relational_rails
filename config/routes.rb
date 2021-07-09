Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  # ARTISTS -------------------------
  get '/artists', to: 'artists#index'

  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'

  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/edit', to: 'artists#edit'
  patch '/artists/:id', to: 'artists#udpate'

  delete '/artists/:id', to: 'artists#destroy'

  # ARTWORKS -------------------------
  get '/artworks', to: 'artworks#index'

  get '/artworks/new', to: 'artworks#new'
  post '/artworks', to: 'artworks#create'

  get '/artworks/:id', to: 'artworks#show'
  get '/artworks/:id/edit', to: 'artworks#edit'
  patch '/artworks/:id/', to: 'artworks#udpate'

  delete '/artworks/:id', to: 'artworks#destroy'

  # ARTIST_ARTWORKS -------------------------
  get '/artists/:id/artworks', to: 'artist_artworks#index'

  # EASTEREGG -------------------------
  get '/easteregg', to: 'eastereggs#index'
end
