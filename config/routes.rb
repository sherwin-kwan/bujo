Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :collections, :defaults => { :format => 'json' }
  resources :bullets, :defaults => {:format => 'json'}

end
