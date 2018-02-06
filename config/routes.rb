Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :notes, only: [:create, :destroy]
  end
  root 'books#index'
  
  resources :sessions, only: [:new, :create, :destroy]
  get "/login" => "sessions#new", as: "login"
  #delete "/logout" => "sessions#destroy", as: "logout"
  #get "/allbooks" => "allbooks#index"
  #get "/allbooks/:id" => "allbooks#show"
  #get "/new_reviewer" => "reviewers#new"
  #get "/reviewers" => "reviewers#index"
  #get "/edit_reviewer" => "reviewers#edit"
  #post "/reviewers/" => "reviewers#create"
end
