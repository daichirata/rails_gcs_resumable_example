Rails.application.routes.draw do
  root to: redirect('/images')

  resources :images, only: [:index] do
    get :resumable_url, on: :collection
  end
end
