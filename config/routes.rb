Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :series do
        resources :data
      end

      root 'series#index'
    end
  end
end
