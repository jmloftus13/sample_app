Rails.application.routes.draw do
  #change sign_in & out to login & logout
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "new_registrations" }

  resources :products do
    resources :comments
  end
  resources :users

  get 'static_pages/about'
  
  get 'static_pages/contact'

  root 'static_pages#landing_page'
  get 'static_pages/index' #this statement was in the original file
  
  get 'static_pages/landing_page' #(Ben recommended I delete)

  post 'static_pages/thank_you'

  post 'payments/create'

  resources :orders, only: [:index, :show, :create, :detroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end