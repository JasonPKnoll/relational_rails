Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/artists', to: 'artists#index'

  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'

  get '/artists/:id', to: 'artists#show'

  get '/artworks', to: 'artworks#index'

  get 'artworks/new', to: 'artworks#new'
  post 'artworks', to: 'artworks#create'

  get '/easteregg', to: 'eastereggs#index'
end
