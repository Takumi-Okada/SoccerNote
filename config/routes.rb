Rails.application.routes.draw do
 root 'notes#index'

  get 'teams/new'
  get 'teams/show'
  get 'teams/edit'
  resources :members

  resources :notes

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
