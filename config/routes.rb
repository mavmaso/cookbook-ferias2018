Rails.application.routes.draw do
  root to: "home#index"
  resources :recipes
  resources :cuisines
  resources :recipe_types
  get '/busca', to: 'recipes#buscar'
end
