Rails.application.routes.draw do
  resources :employees do
    resources :debits
  end
end

