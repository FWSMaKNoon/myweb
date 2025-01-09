Rails.application.routes.draw do
  root "products#index"
  devise_for :users

  resources :products do
    resources :subscribers, only: [ :create ]
    resource :unsubscribe, only: [ :show ]
  end

end
