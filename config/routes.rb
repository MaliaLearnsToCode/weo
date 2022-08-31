Rails.application.routes.draw do
  get 'users/show'

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # ---------------- itineraries -------------------
  get '/itineraries', to: 'itineraries#index'
  get '/itineraries/new', to: 'itineraries#new'
  post '/itineraries', to: 'itineraries#create'
  get '/itineraries/:id/edit', to: 'itineraries#edit'
  patch '/itineraries/:id', to: 'itineraries#update'
  get '/itineraries/:id', to: 'itineraries#show'
  delete '/itineraries/:id', to: 'itineraries#destroy'

  resources :itineraries do
    collection do
      get :my_itineraries
    end
  end
  # this is a selected collection of index where the user can see their own index of all the itineraries
  # path is: /my-itineraries



  #--------------- activities --------------------
  # activities index is listed in the dependent itinerary page
  get '/activities/:id', to: 'activities#show'
  get '/activities/:id/edit', to: 'activities#edit'
  patch '/activities/:id', to: 'activities#update'

  resources :itineraries do
    resources :activities, only: %i[ index new create ]
    # controller is activity, index listed on one itinerary page
    # for the 'create' action, the path looks is: /itineraries/:itinerary_id/activities
  end

  resources :activities do
    collection do
      get :pending
    end
  end


  #--------------------- users -------------------------
  devise_for :users

  #--------------------- participants -------------------------
  resources :activities do
    resources :participants, only: %i[ new create approve destroy ]
  end





end
