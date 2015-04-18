Rails.application.routes.draw do
  root to: 'dashboard#index'

  get '/index', to: 'dashboard#index'
end
