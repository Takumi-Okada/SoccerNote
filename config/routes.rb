Rails.application.routes.draw do
 root 'notes#index'
 
  resources :teams
  resources :members
  resources :notes

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
