Rails.application.routes.draw do
 root 'notes#index'

  get 'teams/new'
  get 'teams/show'
  get 'teams/edit'
  get 'members/index'
  get 'members/new'
  get 'members/show'
  get 'members/edit'
  get 'notes/index'
  resources :notes
end
