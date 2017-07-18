Rails.application.routes.draw do
  get 'beranda/index'
  
  root 'beranda#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
