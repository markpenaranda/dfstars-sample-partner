Rails.application.routes.draw do
  get 'main/index'
  get 'dfs/auth' => 'dfs#authenticate'

  root 'main#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
