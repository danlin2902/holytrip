Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :tasks
    resources :participants, only: [ :new, :create, :edit, :update ]
  end

  resources :tasks do
    resources :attachments, only: [ :create, :destroy ]
  end
end
