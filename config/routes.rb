Rails.application.routes.draw do
  root 'orders#index'
  get 'checkout' => 'orders#checkout'
end
