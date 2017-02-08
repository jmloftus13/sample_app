Rails.application.routes.draw do
  resources :products
  get 'static_pages/about'
  
  get 'static_pages/contact'

  root 'static_pages#landing_page'
  get 'static_pages/index' #this statement was in the original file
  
  get 'static_pages/landing_page' #(Ben recommended I delete)

  post 'static_pages/thank_you'

  resources :orders, only: [:index, :show, :create, :detroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
