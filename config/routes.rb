Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  resources :resources
  resources :articles, only: %i[index show edit update destroy]
  resources :searches do
    collection do
      get 'import'
    end
  end

  get ENV['LOADERIO_TOKEN'], to: 'home#test'
  get 'search', to: 'home#search', as: 'query'
  get 'top-headlines', to: 'home#top_headlines', as: 'top_headlines'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
