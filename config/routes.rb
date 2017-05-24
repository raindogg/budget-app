Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :entries do
    collection { post :import }
  end
  # Month routes
  get '/' => 'months#index'
  get '/months' => 'months#index'
  get '/months/new' => 'months#new'
  post '/months/new' => 'months#create'
  post '/months' => 'months#archive'
  get '/months/:id' => 'months#show'
  patch '/months/:id/edit' => 'months#update'
  delete '/months/:id' => 'months#destroy'

  # Entry routes
  post '/entries' => 'entries#create'
  post '/entries_bulk' => 'entries#createbulk'
  get '/entries/new' => 'entries#new'
  patch '/entries/:id/edit' => 'entries#update'
  delete '/entries/:id' => 'entries#destroy'

  # Total routes
  post '/totals' => 'totals#create'

  # Goal routes
  get '/goals' => 'goals#index'
  get '/goals/new' => 'goals#new'
  post '/goals/new' => 'goals#create'
  patch 'goals/:id/edit' => 'goals#update'
end
