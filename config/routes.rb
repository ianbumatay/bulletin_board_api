Rails.application.routes.draw do

  # resources :boards
  # resources :bulletins


  namespace :api do  
    namespace :v1 do

      resources :boards do
        resources :bulletins 
      end
      
    end  
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
