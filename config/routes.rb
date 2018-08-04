Rails.application.routes.draw do
  resources :customers
  resources :contacts, only: [:new, :create]
  resources :orders do 
    resources:orderitems
    
  end

  devise_for :users do resources :orders end
    post '/search', to: 'items#search'
  
  get '/checkout' => 'cart#createOrder'
  
  get 'cart/index'
  
  
  resources :items
  
  
 root 'static_pages#home'

  get '/profile', to: 'static_pages#profile'

  get '/about', to: 'static_pages#about'
  
  get '/thanks', to: 'orders#payNow'

  get '/paypal/:id', to: 'static_pages#paypal'
  
  get '/login' => 'user#login' 
get '/logout' => 'user#logout'

get '/cart/clearcart', to: 'cart#clearCart'
get '/cart', to: 'cart#index'
get '/cart/:id', to: 'cart#add'
get 'cart/remove/:id', to: 'cart#remove'

get '/cart/removeqty/:id', to: 'cart#removeqty'
get '/cart/addqty/:id', to: 'cart#addqty'

get 'contact/new', to: 'contacts#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
