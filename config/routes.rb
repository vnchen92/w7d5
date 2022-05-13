Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :create, :new, :update, :edit] 

  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:show, :index, :create, :new, :update, :edit]

  resources :posts, only: [:show, :create, :new, :update, :edit, :destroy]
end
