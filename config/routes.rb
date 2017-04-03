Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :entries do
    collection { post :import }
  end
  # Month routes
  get '/months' => 'months#index'
  get '/months/new' => 'months#new'
  post '/months' => 'months#create'
  get '/months/:id' => 'months#show'
  patch '/months/:id/edit' => 'months#update'
  delete '/months/:id' => 'months#destroy'

  # Entry routes
  post '/entries' => 'entries#create'
  post '/entries_bulk' => 'entries#createbulk'
  get '/entries/new' => 'entries#new'
  get '/entries/:id' => 'entries#show'
  patch '/entries/:id/edit' => 'entries#update'
  delete '/entries/:id' => 'entries#destroy'

  # Join table routes
  post '/entry_category' => 'entry_categories#create'
end
