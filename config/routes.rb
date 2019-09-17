Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :omniauth_callbacks_new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :omniauth_callbacks_destroy_user_session
  end
  resources :users
  get 'homes/my_repositories', to: 'homes#my_repositories', as: 'my_repositories'
  get 'homes/my_organizations', to: 'homes#my_organizations', as: 'my_organizations'
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
