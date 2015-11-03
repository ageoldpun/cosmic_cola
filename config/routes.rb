Rails.application.routes.draw do
  root 'orders#create'
  get 'checkout' => 'orders#checkout'
  post '/orders', to: 'orders#create'
end
