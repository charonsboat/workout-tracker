Rails.application.routes.draw do
  resources :activities, only: [:index, :create]
  resources :activity_logs, only: [:index, :create]
  resources :users, only: [:create] do
    collection do
      get :current
    end
  end
end
