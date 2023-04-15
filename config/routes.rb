Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/api', to: "url#api"
  get '/url/new', to: "url#new"
  get '/url/show/:id', to: 'url#show', as: 'url_show'
  get '/:short_url', to: 'url#redirect'
  post '/url/create', to: "url#create"
  # resources :url

  # Defines the root path route ("/")
  root "page#index"
end
