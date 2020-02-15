Rails.application.routes.draw do

  devise_for :users
  # , controllers: {
  #  registrations: 'users/registrations',
  #  sessions: 'users/sessions',
  #  password: 'users/passwords'
  # }
  
  # devise_scope :user do
  #   get 'my_page' => 'users/registrations#my_page'
  # end

  root to: 'items#index'
  resources :items do
    member do
      get 'confirm'
      post 'buy'
    end
  end

  resources :comments

  resources :categorys, only:[:index]

  resources :images

  resources :users, only: :show do
    resources :cards, only: [:new, :show, :index] do
      collection do
        post 'pay', to: 'cards#pay'
        post 'delete', to: 'cards#delete'
      end
    end
  end

end