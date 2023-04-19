Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :short_urls, only: [:create, :show]
  get '/short_urls/:id/statistic', to: 'short_urls#statistic', as: 'short_urls_statistic'
  get '/:short_code', to: 'short_urls#redirect'
  get "*path", to: "application#render_404"
  
  # Defines the root path route ("/")
  root "pages#index"
end
