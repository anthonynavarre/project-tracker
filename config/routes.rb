ProjectTracker::Application.routes.draw do
  root to: 'homes#show', via: :get

  resource :dashboard, only: [:show]

  resources :projects, only: [:new, :create]

  resource :session,
    controller: 'sessions',
    only: [:create, :new, :destroy]

  resources :users,
    controller: 'users',
    only: [:create, :new, :destroy]
end
