Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users


  controller :sessions do 
    get 'login' => :new
    post 'login' => :create
    delete 'login' => :destroy
  end 

  get 'signup', to: 'users#new', as: :sign_up
end
