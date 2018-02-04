Rails.application.routes.draw do
  get 'gift_list/index'
  get 'pay', to: 'pay#index'
  post 'pay/stripe'
  get 'pay/thanks'
  root 'gift_list#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
