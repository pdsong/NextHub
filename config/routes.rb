Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'application#website'

  devise_for :users, defaults: { format: :json }, skip: :all
  devise_scope :user do
    # If you change these urls and helpers, you must change these files too:
    # - config/initializers/devise.rb#JWT Devise
    # - spec/support/authentication_helper.rb
    post '/users/login' => 'sessions#create', as: :user_session
    delete '/users/logout' => 'sessions#destroy', as: :destroy_user_session
    post '/users/signup' => 'registrations#create', as: :user_registration
  end

  get '/panel(/*path)', to: 'application#panel', as: :panel

  namespace :api do
    namespace :v1 do
      get '/hackNews/listNow', to: 'hack_news#list_now', defaults: { format: :json }
      resources :user_hack_news, only: [:create, :index]
    end
  end

  get '/(*path)', to: 'application#website', as: :website
end
