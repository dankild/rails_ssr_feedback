Rails.application.routes.draw do
  get  "/",           to: "feedback#index"
  get  "/new",        to: "feedback#new"
  post "/new",        to: "feedback#create"
  get  "/:id/delete", to: "feedback#delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
