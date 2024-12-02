Rails.application.routes.draw do
  resources :employees 
  root "employees#index"
  
  resources :mains do
    collection do
      post :mark_selected_fully_paid
    end
  
    resources :debits do
       post 'mark_fully_paid', on: :collection
      end
    resources :overtimes
    resources :opayments
    collection do
      post 'create_monthly'
    end
  end
end