Rails.application.routes.draw do
  root "employees#index"
  resources :employees do
    resources :debits
    resources :overtimes
  end
end