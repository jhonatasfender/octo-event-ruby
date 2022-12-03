Rails.application.routes.draw do
  post '/', to: 'events#create'
  get '/issues/:issue/events', to: 'events#index'
end
