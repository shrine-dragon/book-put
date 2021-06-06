Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'questionnaires', to: 'users/registrations#new_questionnaire'
    post 'questionnaires', to: 'users/registrations#create_questionnaire'
  end  
  root to: "books#index"
  resources :books do
    resources :comments,  only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update, :destroy]
end
