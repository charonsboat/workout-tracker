Rails.application.routes.draw do
  root controller: :welcome, action: :index

  resources :activities, only: [:index, :create]
  resources :activity_logs, only: [:index, :create]
  resources :users, only: [:create] do
    collection do
      get :current
      post :sign_in
    end
  end
end
