Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :recipes do
        resources :comments, only: [:create]
        resources :ratings, only: [:create]
        member do
          post :add_product
          delete :delete_product
        end
      end
      
      resources :products
    end
  end
end
