Rails.application.routes.draw do
 root 'notes#index'
 
  resources :teams

  resources :members
  get 'members/:team_id/new' => 'members#new'
  post 'members/:team_id/create' => 'members#create'


  resources :notes

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
