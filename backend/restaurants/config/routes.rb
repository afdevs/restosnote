Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :restaurants
      resources :utilisateurs
      resources :comptes
      resources :commentaires
      resources :specialites
      resources :restaurantspecialites
      resources :notes
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
