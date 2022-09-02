Rails.application.routes.draw do
  get 'participant_reviews/new'
  get 'participant_reviews/create'
  get 'creator_reviews/new'
  get 'creator_reviews/create'
  get 'participations/index'
  get 'participations/new'
  get 'participations/create'
  get 'participations/show'
  get 'participations/approve'
  get 'participations/destroy'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # ---------------- itineraries -------------------
  # get '/itineraries', to: 'itineraries#index' # path is: /itineraries
  # get '/itineraries/new', to: 'itineraries#new' # /itineraries/new
  # post '/itineraries', to: 'itineraries#create' # /itineraries
  # get '/itineraries/:id/edit', to: 'itineraries#edit' # /itineraries/:id/edit
  # patch '/itineraries/:id', to: 'itineraries#update' #/itineraries
  # get '/itineraries/:id', to: 'itineraries#show' # /itineraries/:id
  # delete '/itineraries/:id', to: 'itineraries#destroy' # /itineraries

  resources :itineraries do
    resources :activities, only: %i[ index new create show ]
    collection do
      get :my_itineraries # /my-itineraries
    end
  end
  # this is a selected collection of index where the user can see their own index of all the itineraries
  # path is: /my-itineraries

  #--------------- activities --------------------
  # activities index is listed in the dependent itinerary page
  get '/activities/:id', to: 'activities#show' # /activities/:id
  get '/activities/:id/edit', to: 'activities#edit' # /activities/:id/edit
  patch '/activities/:id', to: 'activities#update'

    # controller is activity,
    # index listed on one itinerary page path: /itineraries/:itinerary_id/activities
    # new path: /itineraries/:itinerary_id/activities/new
    # for the 'create' action, the path also looks is: /itineraries/:itinerary_id/activities

  resources :activities do
    collection do
      get :pending # path: /activities/pending
    end
  end

  #--------------------- users -------------------------
  devise_for :users
  resources :users, only: [:show]

  #--------------------- participants -------------------------
  resources :activities do
    resources :participations, only: %i[ index new create approve destroy ]
  end
  # participants show path: /activities/:activity_id/participants/new
  # participants create path: /activities/:activity_id/participants
  # participants approve path: ?
  # participants destroy path: /activities/:activity_id/participants
end
