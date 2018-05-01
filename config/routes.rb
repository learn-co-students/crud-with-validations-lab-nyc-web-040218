Rails.application.routes.draw do
  get 'songs/new'

  get 'songs/create'

  get 'songs/update'

  get 'songs/edit'

  get 'songs/destroy'

  get 'songs/index'

  get 'songs/show'

  resources :songs
end
