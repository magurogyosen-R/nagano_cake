Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :index, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :order_details, only: [:update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  namespace :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :orders, only: [:new, :index, :show, :create] do
     collection do
      get "thanks" => "orders#thanks"
      post "confirm" => "orders#confirm"
     end
    end
    resources :customers, only: [:show, :edit, :update] do
     collection do
       get "out" => "customers#out"
       patch "destroyupdate" => "customers/destroyupdate"
     end
    end
    resources :addresses, only: [:index, :edit, :destroy, :create, :update]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy] do
     collection do
       delete "destroy_all" => "cart_items/destroy_all"
     end
    end
  end
end


