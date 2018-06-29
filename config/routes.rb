Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, skip: [:passwords]

  get 'accounts', to: 'accounts#index'

  resources :transactions, only: %i[index destroy]
  resources :users, except: %i[destroy] do
    resources :accounts, only: %i[index] do
      post 'transaction', to: 'accounts#transaction'
    end
  end

  namespace :api do
    root 'users#welcome'
    post 'auth' => 'user_token#create'

    resources :transactions, only: %i[index destroy]
    get 'all_transactions', to: 'transactions#all_transactions'
    get 'accounts', to: 'accounts#all_accounts'
    resources :users, except: %i[destroy] do
      resources :accounts, only: %i[index show create destroy] do
        post 'transaction', to: 'accounts#transaction'
      end
    end
  end
end
