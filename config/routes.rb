Rails.application.routes.draw do
  root 'home#index'
  resources :sources
  resources :articles
  resources :searches

  get '/top-headlines', to: 'home#top_headlines'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
