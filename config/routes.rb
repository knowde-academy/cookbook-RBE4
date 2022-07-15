Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
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
