Rails.application.routes.draw do
  get 'beranda/index'
  
  resources :surat_keluar
  
  root 'beranda#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
