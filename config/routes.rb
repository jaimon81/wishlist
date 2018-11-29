Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#login'


  get '/users/signup' => 'users#signup'
  post '/users/register_user' => 'users#register_user'
  post '/users/signin' => 'users#signin'
  post '/users/save_wish' => 'users#save_wish'
  post '/users/update' => 'users#update'
  get '/users/login' => 'users#login'
  get '/users/signout' => 'users#signout'
  get '/users/edit' => 'users#edit'
  get '/users/wishlist' => 'users#wishlist'


  # post ':controller(/:action(/:id))'
  # post ':controller(/:action(/:id(.:format)))'
  # post ':controller(/:action(/:id(/:arg2)))'
  # post ':controller(/:action(/:id(/:arg2(/:arg3))))'
  # post ':controller(/:action(/:id(/:arg2(/:arg3(/:arg4)))))'
  #
  # put ':controller(/:action(/:id))'
  # put ':controller(/:action(/:id(.:format)))'
  # put ':controller(/:action(/:id(/:arg2)))'
  # put ':controller(/:action(/:id(/:arg2(/:arg3))))'
  # put ':controller(/:action(/:id(/:arg2(/:arg3(/:arg4)))))'
  #
  # get ':controller(/:action(/:id))'
  # get ':controller(/:action(/:id(.:format)))'
  # get ':controller(/:action(/:id(/:arg2)))'
  # get ':controller(/:action(/:id(/:arg2(/:arg3))))'
  # get ':controller(/:action(/:id(/:arg2(/:arg3(/:arg4)))))'
end
