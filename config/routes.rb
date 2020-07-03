Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers
  namespace :admins do
  	get '/' => 'homes#top'
  end
  #get 'admins' => 'admins/homes#top'
  #resources :homes, only: [:top]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
