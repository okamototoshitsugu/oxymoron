Rails.application.routes.draw do
  devise_for :admins, :controllers => { :sessions => 'admins/sessions'}
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users/homes#top'
  get 'homes/about' => 'users/homes#about'
  get 'admins/top' => 'admins/homes#top'

  namespace :admins do
    get 'homes/top'
  end

  namespace :users do
  	get 'homes/top'
  	get 'homes/about'
    get 'users/unsubscribe'

  	resources :tasks do
     resource :bookmarks, only: [:create, :destroy, :show]
    end
    resources :sub_tasks, only: [:create, :destroy, :update, :edit]
  	resources :users, only: [:show, :edit, :update, :destroy, :withdraw]
  	resources :graphs, only: [:show]
  	resources :shares, only: [:index]
  end
end




