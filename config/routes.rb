Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/stats' => 'usage#index'
  get '/stats/memory' => 'usage#memory'
  get '/stats/cpu' => 'usage#cpu'
  get '/stats/disk' => 'usage#disk'
  # get '/stats/load' => 'usage#load'
end
