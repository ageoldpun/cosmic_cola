Rails.application.routes.draw do
  root 'colas#index'
  get 'checkout' => 'colas#checkout'
end
