#coding:utf-8
Inono::Application.routes.draw do
  # root :to => 'categories#index'
  root :to => "home#index"
  match '/home/index', :to => "home#index"
  match '/simple_captcha/:id', :to => 'simple_captcha#show', :as => :simple_captcha
  resources :customizations, :only => [:index, :show]
  resources :inquiries, :only => [:index, :create]
  resources :measurements
  resources :measure_pages
  resources :links, :only => [:new, :create]
  resources :feedbacks, :only => :create
  resources :events, :only => [:index, :new, :create]
  resources :helps, :only => :show
  resources :notices, :only => :show
  resources :users, :except => [:index, :destroy] do
    member {
      get :ba
      post :create_ruler
    }
  end
  resources :profiles, :only => [:update]
  resources :measures
  resources :orders
  resources :categories do
    collection {
      post :reserve_ruler
      post :reserve_shop
    }
  end
  resources :products do
    resources :comments
    member {
      get :reserve
    }
  end
  resource :session
  resources :blog_posts , :path=>"zhishitang" , :only=>[:index,:show]
  resources :blog_comments , :only=>[:create]
  match '/cart/:action' => 'cart#index'
  match '/customization_wrap/:action' => 'customization_wrap#index'
  match '/change_password' => 'users#change_password', :as => :change_password
  match '/register' => 'users#new', :as => :register
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout

  namespace :kadmin do
    root :to => 'orders#index'
    resources :customizations
    resources :links, :only => [:index, :edit, :update, :destroy]
    resources :comments do
      resources :replies
    end
    resources :products do
      resources :photos
      collection  {
        get :select_with_ajax
      }
    end
    resources :uploaded_photos
    resources :categories do
      resources :subcategories
    end
    resources :users do
      resources :measures
    end
    resources :orders
    resources :notices
    resources :helps
    resources :feedbacks
    resources :events
    resources :banners
    resources :inquiries
    resources :measure_pages
    resources :measure_properties
    resources :places
    resources :shops
    resources :reserve_rulers , :only=>[:index,:show,:destroy]
    resources :top_rulers , :only=>[:index,:create,:destroy]
    resources :blog_categories
    resources :blog_tags
    resources :blog_posts
    resources :blog_comments
    resources :chats do
      collection {
        get :check
      }
    end
  end

  match ':category' => 'categories#show'
  match ':category/:subcategory' => 'subcategories#show'

  match '/simple_captcha/:id', :to => 'simple_captcha#show', :as => :simple_captcha

  #  match '/:controller(/:action(/:id))'
end
