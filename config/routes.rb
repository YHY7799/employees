Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :delete]
  resources :users, except: [:new, :create]
  
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