Rails.application.routes.draw do
  root 'contacts#index'

  resources :contacts do
    collection { post :import }
  end

  devise_for :users
  devise_scope :user do
    delete  'logout', to: 'devise/sessions#destroy'
    get     'logout', to: 'devise/sessions#destroy'
  end
end
