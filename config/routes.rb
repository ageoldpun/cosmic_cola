Rails.application.routes.draw do
  root 'orders#index'
  get 'checkout' => 'orders#checkout'
  post '/orders', to: 'orders#create'
  post '/orders/submit', to: 'orders#submit'
  get 'complete' => 'orders#complete'
end
