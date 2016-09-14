Rails.application.routes.draw do
  root to: 'brands#index'

  resources :brands do
    member do
      get 'relations'
    end
    resources :locations, except: :index
    resources :menu_items, except: :index
    resources :order_types, except: :index
    resources :price_levels, except: :index
  end

  resources :price_calculation, only: [:new, :create]

  resources :locations, only: [] do
    resources :day_parts
  end
end
