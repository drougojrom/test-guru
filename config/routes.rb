Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { registrations: 'registration', sessions: 'sessions' }

  root 'tests#index'

  resources :badges, only: :index
  resources :badges, only: :index do
    get :my, on: :collection
  end

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index]
  end

  get '/contacts', to: 'contacts#new', as: 'contacts'
  post '/contacts', to: 'contacts#submit'
end
