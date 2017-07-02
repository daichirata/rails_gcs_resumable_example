Rails.application.routes.draw do
  resources :images, only: [:index] do
    get :resumable_url, on: :collection
  end
end
