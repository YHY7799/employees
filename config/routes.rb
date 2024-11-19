Rails.application.routes.draw do
  resources :employees do
    resources :debits
    resources :overtimes
  end
end