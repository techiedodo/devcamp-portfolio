Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
