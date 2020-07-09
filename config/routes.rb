Rails.application.routes.draw do

  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }
  namespace :admins do
    get '/' => 'homes#top'
    resources :items
    resources :genres
    resources :customers
  end

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :customers do
  	resources :shipping_addresses
  	resource :cart_items
  	delete '/cart_items' => 'cart_items#destroy_all'
  	get '/profile' => 'customers#show'
  	get '/profile/edit' => 'customers#edit'
    put '/profile' => 'customers#update'
    patch '/profile' => 'customers#update'
    get '/delete/confirm' => 'customers#confirm'
    patch '/delete' => 'customers#destroy'
    get '/items' => 'items#index'
    get '/items/:id' => 'items#show'
    get '/genres/:id' => 'items#genre_index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get '/about' => 'homes#about'
end
