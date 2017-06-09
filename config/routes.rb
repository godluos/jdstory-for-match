Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :posts
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :products do
     resources :posts
    member do
      post :add_to_cart
      post :post_create
      post :join
      post :quit
    end
  end
  get 'posts', to:'product#show'


  resources :categories

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :account do
    resources :orders
    resources :users
    resources :products
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :cart_items

  root 'welcome#index'
end
