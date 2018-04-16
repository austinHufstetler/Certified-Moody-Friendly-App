Rails.application.routes.draw do
  get 'reports/new'

  get 'reports/update'

  get 'reports/edit'

  get 'reports/destroy'

  get 'reports/index'

  get 'reports/show'

  namespace :admin do
    resources :accounts
    resources :businesses
    resources :chambers
    resources :coupons
    resources :events
    resources :militaries

    root to: "accounts#index"
  end

  get 'favorite_events/index'

  get 'favorite_coupons/index'

  get 'event_search/index'

  get 'coupon_search/index'

  get 'businesses/index'

  get 'militaries/my_page'

  get 'chambers/approvals'

  get 'search', to: 'coupon_search#search'


  devise_for :accounts,:controllers => { :registrations => 'registrations' }
  resources :events
  resources :coupons
  resources :reports

  resources :chambers, only: [:edit, :update]
  resources :militaries, only: [:edit, :update]
  resources :businesses, only: [:edit, :update]

  resources :businesses do
    resources :coupons
    resources :events
    member do
      get 'report'
      get 'approve'
     end
  end

  resources :events do
    member do
      get 'like'
      get 'unlike'
      get 'report'
     end
   end

  resources :coupons do
    member do
      get 'like'
      get 'unlike'
      get 'report'
     end
   end

  get 'home/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
