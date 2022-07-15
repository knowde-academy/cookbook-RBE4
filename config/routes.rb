Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :recipes do
        member do
          post 'products/:product_id', to: 'recipes#createproduct'
          delete 'products/:product_id', to: 'recipes#destroyproduct'
        end
      end
      
      resources :products
    end
  end
end
