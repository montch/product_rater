Rails.application.routes.draw do

  resources :products
  resources :ratings
  resources :sources


  root 'ratings#new'


end
