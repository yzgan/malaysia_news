Rails.application.routes.draw do
  root 'home#index'
  resources :resources
  resources :articles
  resources :searches do
    collection do
      get 'import'
    end
  end

  get 'search', to: 'home#search'
  get 'top-headlines', to: 'home#top_headlines'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
