Rails.application.routes.draw do
  resources :employees 
  root "employees#index"
  
  resources :mains do
    resources :debits
    resources :overtimes
    collection do
      post 'create_monthly'
    end
  end
end