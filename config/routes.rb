Rails.application.routes.draw do
  resources :activities, only: [:index, :create]
  resources :activity_logs, only: [:index, :create]
end
