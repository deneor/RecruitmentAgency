Rails.application.routes.draw do
  root 'home#index'
  get 'skills/index'
  resources :employees
  resources :vacancies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
