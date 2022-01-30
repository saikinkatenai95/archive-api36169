Rails.application.routes.draw do
  resources :categories do
    resources :ideas
  end
end
