Rails.application.routes.draw do
  namespace :rack do
    get 'chunked/stream'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
