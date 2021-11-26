Rails.application.routes.draw do
  get 'feedback/index'

  get "/feedback", to: "feedback#index"
  get "/feedback/new", to: "feedback#new"
  post "/feedback/new", to: "feedback#create"
  get "/feedback/:id/delete", to: "feedback#delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
