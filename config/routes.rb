Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :series
      resources :data
      root 'data#index'
    end
  end
end
