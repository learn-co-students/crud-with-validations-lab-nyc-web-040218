Rails.application.routes.draw do
  root to: 'songs#index'
  resources :songs
  delete 'songs/:id', to: 'songs#destroy'

end
