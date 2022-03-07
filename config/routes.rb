Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :photos, only: [:index, :show, :create] do
    get 'comments', on: :member
  end
  resources :comments, only: [:create]
end
