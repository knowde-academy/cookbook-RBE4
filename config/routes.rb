Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  namespace :api do
    namespace :v1 do
      resources :recipes do
        resources :comments, only: [:create]
        resources :ratings, only: [:create, :destroy]
        member do
          post :add_product
          delete :delete_product
        end
      end
      
      resources :products
    end
  end
end
