Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'  
  resources :coins  #Forma de declarar as 7 rotas do crud ---> resources

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
