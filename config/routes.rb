Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'questionnaires', to: 'users/registrations#new_questionnaire'
    post 'questionnaires', to: 'users/registrations#create_questionnaire'
  end  
  root to: "books#index"
  resources :books, only: [:index, :new, :create, :show, :edit, :update]
end
