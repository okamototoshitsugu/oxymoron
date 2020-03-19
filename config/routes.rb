Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users/homes#top'
  get 'homes/about' => 'users/homes#about'

  namespace :users do
  	get 'homes/top'
  	get 'homes/about'
    get 'users/unsubscribe'

  	resources :tasks do
     resource :bookmarks, only: [:create, :destroy]
    end
  	resources :users, only: [:show, :edit, :update, :destroy, :withdraw]
  	resources :graphs, only: [:show]
  	resources :shares, only: [:index]
  end
end




