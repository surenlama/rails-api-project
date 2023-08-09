Rails.application.routes.draw do
  get 'contacts' => 'contacts#index'
  get 'contacts/:id' => 'contacts#show'
  post 'contacts' => 'contacts#create'
  put 'contacts/:id' => 'contacts#update'
  delete 'contacts/:id' => 'contacts#destroy'
  
  post 'users' => 'users#create'
  get 'users' => 'users#index'  
  post 'login' => 'auth#login'
 
  get 'users/self' => 'users#show'
  get 'csv/export' => 'contacts#export'
  post 'csv/import' => 'contacts#import_csv'


  put 'users/self' => 'users#update'
  delete 'users/self' => 'users#destroy'
end
