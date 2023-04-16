Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :urls
  get '/urls/:id', to: 'urls#show'
  get '/:short_url', to: 'urls#redirect'
  get "*path", to: "application#render_404"
  
  # Defines the root path route ("/")
  root "pages#index"
end
