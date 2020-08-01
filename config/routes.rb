Rails.application.routes.draw do
  # devise_for :users

  # root to: "students#index"
  resources :students
  resources :institutions

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  devise_scope :user do
    root to: 'users/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
