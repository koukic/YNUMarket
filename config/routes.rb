Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :information do
    get "search", on: :collection
    resources :reviews
  end


  devise_for :users, controllers: {
    registrations: 'registrations'
  }


  resources :messages, only: %i[create]
  resources :rooms, only: %i[create show index]

  get 'privacy', to: 'rules#privacy'

  get 'service_terms', to: 'rules#service_terms'

  get 'buy_guide', to: 'rules#buy_guide'

  get 'sell_guide',to: 'rules#sell_guide'


  root 'information#index'
end
