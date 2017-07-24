Rails.application.routes.draw do
  devise_for :users
  get 'beranda/index'
  
  resources :surat_keluar do
    member do
      put :change
    end
  end
  
  root 'beranda#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
