Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :urls, only: [:create, :show]
  get '/urls/:id/statistic', to: 'urls#statistic', as: 'urls_statistic'
  get '/:short_url', to: 'urls#redirect'
  get "*path", to: "application#render_404"
  
  # Defines the root path route ("/")
  root "pages#index"
end
