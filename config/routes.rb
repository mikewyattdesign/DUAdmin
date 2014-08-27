require 'api_constraints'

Rails.application.routes.draw do
  root 'entries#index'

  get '/entries/facebook' => 'entries#facebook'

  resources :entries do
    member do
      post 'rate'
      post 'decline'
      post 'approve'
      post 'favorite'
    end
  end

  get '/entries/rating/:rating' => 'entries#index'

  namespace :api, defaults: { format: 'json', path: '/' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      post 'warriordash' => 'warrior_dash#create'
    end
  end
end
