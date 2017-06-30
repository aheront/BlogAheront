Rails.application.routes.draw do

  root to: 'categories#index'

  resources :categories do
    resources :posts
  end

  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
