Rails.application.routes.draw do
  post '/', to: 'events#create'
  get '/issues/:issue/events', to: 'events#index'
  get '/issues/all', to: 'events#all'
end
