Rails.application.routes.draw do
  get 'main/index'
  get 'dfs/auth' => 'dfs#authenticate'
  post 'dfs/load' => 'dfs#add_credits'

  root 'main#index'

  devise_for :users,
  			 :controllers => {:registrations => 'my_devise/registrations'}
  get 'users/me' => 'user#me'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
