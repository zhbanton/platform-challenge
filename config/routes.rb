Rails.application.routes.draw do
  root to: 'brands#index'

  resources :brands do
    resources :locations, except: :index
    resources :menu_items, except: :index
    resources :order_types, except: :index
    resources :price_levels, except: :index
  end

  resources :locations, only: [] do
    resources :day_parts, except: :index
  end
end
