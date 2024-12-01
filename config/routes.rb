Rails.application.routes.draw do
  resources :employees 
  root "employees#index"
  
  resources :mains do
    resources :debits, except: [:mark_multiple_paid] do
       post 'mark_fully_paid', on: :collection
       post 'mark_multiple_paid', on: :collection
      end
    resources :overtimes
    resources :opayments
    collection do
      post 'create_monthly'
    end
  end
end