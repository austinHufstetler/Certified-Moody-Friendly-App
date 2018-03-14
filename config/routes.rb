Rails.application.routes.draw do
  get 'event_search/index'

  get 'coupon_search/index'

  devise_for :accounts
  resources :events
  resources :coupons
  get 'home/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
