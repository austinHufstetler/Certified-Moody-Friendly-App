Rails.application.routes.draw do
  get 'event_search/index'

  get 'coupon_search/index'

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

  get 'home/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
