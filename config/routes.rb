Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  namespace :admins do
  	get '/' => 'homes#top'
  end
  #get 'admins' => 'admins/homes#top'
  #resources :homes, only: [:top]

  devise_for :customers, controllers: {
  	sessions:      'customers/sessions',
  	passwords:     'customers/passwords',
  	registrations: 'customers/registrations'
  }

  namespace :customers do
  	get '/profile' => 'customers#show'
  	get '/profile/edit' => 'customers#edit'
    put '/profile' => 'customers#update'
    patch '/profile' => 'customers#update'
    get '/delete/confirm' => 'customers#confirm'
    patch '/delete' => 'customers#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get '/about' => 'homes#about'
end
