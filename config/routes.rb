Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :food_bookers, :controllers => {
    :sessions => 'food_bookers/sessions',
    :registrations => 'food_bookers/registrations',
  }

  root to: 'homes#top'
  resources :food_bookers, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
