Rails.application.routes.draw do
  get 'favorite_events/index'

  get 'favorite_coupons/index'

  get 'event_search/index'

  get 'coupon_search/index'

  get 'businesses/index'

  get 'militaries/my_page'

  get 'search', to: 'coupon_search#search'

  devise_for :accounts,:controllers => { :registrations => 'registrations' }
  resources :events
  resources :coupons

  resources :chambers, only: [:edit, :update]
  resources :militaries, only: [:edit, :update]
  resources :businesses, only: [:edit, :update]

  resources :businesses do
    resources :coupons
    resources :events
  end

  resources :events do
    member do
      get 'like'
      get 'unlike'
     end
   end

  resources :coupons do
    member do
      get 'like'
      get 'unlike'
     end
   end

  get 'home/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
